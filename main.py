import goertzel
import matplotlib.pyplot as plt
import numpy as np

x, fs = goertzel.read_signal('input file/bas-gitara-zvuk-zvuk-42332.wav')
x = x.T[0]
N = len(x)

Y = goertzel.goertzel(x, fs, 0, 1)
print(Y)
f = np.arange(0, 1, fs / N)
plt.stem(f, Y)
plt.grid(True)
plt.show()
