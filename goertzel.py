import numpy as np
from scipy.io import loadmat
import soundfile as sf
import os.path


def goertzel(signal, sampling_rate, freq_min, freq_max):
    N = len(signal)
    X = []
    f_array = np.arange(freq_min, freq_max, sampling_rate / N)

    for fg in f_array:
        m = int(fg / sampling_rate * N) + 1
        s1 = 0
        s2 = 0
        w = 2 * np.pi * (m - 1) / N

        for n in range(N):
            s0 = 2 * np.cos(w) * s1 - s2 + signal[n]
            s2 = s1
            s1 = s0

        y = s0 - np.exp(-1j * w) * s2
        X.append(2 * np.abs(y) / N)

    return X


def read_mat_signal(file_path):
    mat = loadmat(file_path)
    x = mat['x'].ravel()
    fs = int(mat['fs'])
    return x, fs


def read_audio_signal(file_path):
    signal, Fs = sf.read(file_path)
    return signal, Fs


def read_signal(file_path):
    _, ext = os.path.splitext(file_path)
    if ext == '.mat':
        return read_mat_signal(file_path)
    else:
        return read_audio_signal(file_path)
