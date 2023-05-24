import numpy as np

fs = 8000
ts = np.arange(0, 0.002, 1/fs)
N = len(ts)
x = np.sin(2*np.pi*1000*ts) + 0.9*np.sin(2*np.pi*500*ts + 3*np.pi/4)
np.savez('my_signal.npz', x=x, fs=fs)