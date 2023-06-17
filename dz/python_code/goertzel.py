from scipy.io import loadmat
import soundfile as sf
import os.path
import tkinter as tk
import math
import cmath
import numpy as np

class MyTk(tk.Tk):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.filename = None


def goertzel(signal, fs, f, num_samples):
    N = num_samples
    m = f / fs * N + 1
    u1 = 0
    u2 = 0
    w = 2 * math.pi * (m - 1) / N

    for n in range(N):
        u0 = 2 * math.cos(w) * u1 - u2 + signal[n]
        u2 = u1
        u1 = u0

    y = u0 - cmath.exp(-1j * w) * u2
    Y = 2 * abs(y) / N
    return Y


def goertzel_range(signal, fs, f_min, f_max, step, num_samples):
    f = f_min
    frequencies = []
    while f <= f_max:
        frequencies.append(f)
        f += step
    amplitudes = []
    for f in frequencies:
        amplitude = goertzel(signal, fs, f, num_samples)
        amplitudes.append(amplitude)
    return frequencies, amplitudes


def read_signal(file_path):
    _, ext = os.path.splitext(file_path)
    if ext == '.mat':
        mat = loadmat(file_path)
        signal = mat['x'].ravel()
        fs = int(mat['fs'])
    elif ext == '.npz':
        data = np.load(file_path)
        signal = data['x']
        fs = data['fs']
    else:
        signal, fs = sf.read(file_path)
    return signal, fs


def get_freq(file_path):
    signal, fs = read_signal(file_path)
    return fs


def get_total_samples(file_path):
    signal, fs = read_signal(file_path)
    return len(signal)
