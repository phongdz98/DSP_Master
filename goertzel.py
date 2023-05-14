import numpy as np
from scipy.io import loadmat
import soundfile as sf
import os.path
import pandas as pd


def goertzel(signal, sampling_rate, freq_min, freq_max, num_samples):
    N = num_samples
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


def read_signal(file_path):
    _, ext = os.path.splitext(file_path)
    if ext == '.mat':
        mat = loadmat(file_path)
        signal = mat['x'].ravel()
        fs = int(mat['fs'])
    else:
        signal, fs = sf.read(file_path)
    return signal, fs


def get_freq(file_path):
    signal, fs = read_signal(file_path)
    return fs


def get_total_samples(file_path):
    signal, fs = read_signal(file_path)
    return len(signal)

def csv_output(A,f):
    df = pd.DataFrame({'frequencies': f, 'amplitudes': A})
    df.to_csv('./output/output.csv', index=False)


