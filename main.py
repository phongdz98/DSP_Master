from tkinter import filedialog

import goertzel
import matplotlib.pyplot as plt
import numpy as np
import os.path
from tkinter import *


def run_goertzel():
    file_path = root.filename
    x, fs = goertzel.read_signal(file_path)
    _, ext = os.path.splitext(file_path)
    if ext == '.wav':
        x = x.T[0]
    N = len(x)

    Y = goertzel.goertzel(x, fs, 0, fs)
    f = np.arange(0, fs, fs / N)
    plt.stem(f, Y)
    plt.grid(True)
    plt.show()


def select_file():
    root.filename = filedialog.askopenfilename(initialdir='./input', title='Select A File',
                                               filetypes=(("mat file", "*.mat"),
                                                          ("music file", "*.wav;*.mp3;*.flac;*.aac"),
                                                          ("all files", "*.*")))
    entry.delete(0,END)
    entry.insert(0, root.filename)


# TODO: Interface
root = Tk()
root.title('Goertzel algorithm')
root.iconbitmap('icon.ico')
root.config(padx=20, pady=20)

# my_label = Label(root, text="No file selected.")
# my_label.pack()
#
# select_button = Button(root, text="Select File", command=select_file)
# select_button.pack()
#


label = Label(text="Выберите файл сигнала:")
label.grid(column=0, row=0)

entry = Entry(width=100)
entry.insert(END,  "Файл не выбран.")
entry.grid(column=1, row=0, sticky="EW")

button = Button(text="Выбор файл", command=select_file)
button.grid(column=2, row=0)

run_button = Button(root, text="Start", command=run_goertzel)
run_button.grid(column=0, row=1, columnspan=3)

root.mainloop()
