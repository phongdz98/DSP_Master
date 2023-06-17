import numpy as np

fs = 8000
ts = np.arange(0, 0.002, 1/fs)
N = len(ts)
x = np.sin(2*np.pi*1000*ts) + np.sin(2*np.pi*2000*ts + 3*np.pi/4)
np.savez('my_signal.npz', x=x, fs=fs)