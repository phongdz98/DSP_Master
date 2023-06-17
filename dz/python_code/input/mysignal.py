import numpy as np

fs = 4200
ts = np.arange(0, 0.02, 1/fs)
N = len(ts)
x = np.sin(2*np.pi*700*ts) + 0.5*np.sin(2*np.pi*300*ts + 3*np.pi/4)
np.savez('my_signal.npz', x=x, fs=fs)