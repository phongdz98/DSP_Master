import tkinter
from tkinter import *
from tkinter import filedialog
import goertzel
import matplotlib.pyplot as plt
import os.path
import csv
from tabulate import tabulate

data_list = []


def run_goertzel():
    global data_list
    if not root.filename:
        tkinter.messagebox.showerror('Error', 'Выберите файл сигнала!!!!!!!')
    else:
        file_path = root.filename
        x, fs = goertzel.read_signal(file_path)
        _, ext = os.path.splitext(file_path)
        if ext in ['.wav', '.mp3']:
            x = x.T[0]
        num_samples = int(entry_samples.get())
        freq_min = float(entry_freq_min.get())
        freq_max = float(entry_freq_max.get())
        step = float(entry_step.get())

        f, Y = goertzel.goertzel_range(x, fs, freq_min, freq_max, step, num_samples)
        data_list = [(f[i], Y[i]) for i in range(len(f))]
        text_output.delete('1.0', 'end')
        table = [[f[i], Y[i]] for i in range(len(f))]
        headers = ["frequencies", "amplitudes"]
        text_output.insert('end', tabulate(table, headers, tablefmt="presto"))
        plt.stem(f, Y)
        plt.grid(True)
        plt.show()


def select_file():
    root.filename = filedialog.askopenfilename(initialdir='./input', title='Select A File',
                                               filetypes=(("numpy file", "*.npz"),
                                                          ("mat file", "*.mat"),
                                                          ("music file", "*.wav;*.mp3"),
                                                          ("all files", "*.*")))
    entry_signal.delete(0, END)
    entry_signal.insert(0, root.filename)
    entry_freq_max.delete(0, END)
    entry_freq_max.insert(0, goertzel.get_freq(root.filename))
    entry_samples.delete(0, END)
    entry_samples.insert(0, goertzel.get_total_samples(root.filename))
    entry_step.delete(0, END)
    entry_step.insert(0, str(float(goertzel.get_freq(root.filename)/goertzel.get_total_samples(root.filename))))
    label_fs.config(text = str(goertzel.get_freq(root.filename)) )


def diagram_input():
    if not root.filename:
        tkinter.messagebox.showerror('Error', 'Выберите файл сигнала!!!!!!!')
    else:
        file_path = root.filename
        x, fs = goertzel.read_signal(file_path)
        _, ext = os.path.splitext(file_path)
        N = int(entry_samples.get())
        if ext in ['.wav', '.mp3']:
            x = x.T[0]
        plt.plot(x)
        plt.xlim(0, N)
        plt.grid(True)
        plt.xlabel('Время (s)')
        plt.ylabel('Амплитуда')
        plt.title('Входный сигнал')
        plt.show()


def create_csv():
    if data_list:
        filename = filedialog.asksaveasfilename(defaultextension='.csv', initialdir='./output',
                                                filetypes=(("csv file", "*.csv"),
                                                           ("all files", "*.*"))
                                                )
        with open(filename, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['frequencies', 'amplitudes'])
            writer.writerows(data_list)
        text_output.insert("end", f'\n Создать {filename}!!!!')
        text_output.see(END)
    else:
        tkinter.messagebox.showerror('Error', 'Нет данных для сохранения.')


# TODO: Interface
root = goertzel.MyTk()
root.title('Алгоритм Герцеля')
root.iconbitmap('./icon.ico')
root.config(pady=20, padx=20)
root.minsize(width=600, height=300)
root.resizable(False, False)

# 0.Input signal
label_signal = Label(text="Выберите файл сигнала:")
label_signal.grid(column=0, row=0, pady=10)

entry_signal = Entry(width=50)
entry_signal.insert(END, "Файл не выбран.")
entry_signal.grid(column=1, row=0, sticky="EW", pady=10, columnspan=2)

button = Button(text="Выбор файл", command=select_file)
button.grid(column=3, row=0, pady=10)

# 1. Viewing frequency range
label_signal = Label(text="Диапазон просмотриваемых частот:")
label_signal.grid(column=0, row=1, pady=10)

frame_freq = Frame(root)
frame_freq.grid(column=1, row=1, sticky="EW", pady=10, columnspan=2)
label_freq_min = Label(frame_freq, text="F1,Гц:")
label_freq_min.grid(column=0, row=0, padx=5)
entry_freq_min = Entry(frame_freq, width=5)
entry_freq_min.insert(END, '0')
entry_freq_min.grid(column=1, row=0)
label_freq_max = Label(frame_freq, text="F2,Гц:")
label_freq_max.grid(column=2, row=0, padx=5)
entry_freq_max = Entry(frame_freq, width=5)
entry_freq_max.insert(END, '0')
entry_freq_max.grid(column=3, row=0)
label_freq_max = Label(frame_freq, text="Щаг:")
label_freq_max.grid(column=4, row=0, padx=5)
entry_step = Entry(frame_freq, width=5)
entry_step.insert(END, '0')
entry_step.grid(column=5, row=0)

# 2. Number of sample
label_samples = Label(text="Количество отчетов всего:")
label_samples.grid(column=0, row=2, pady=10)
entry_samples = Entry(width=8)
entry_samples.insert(END, '0')
entry_samples.grid(sticky="W", column=1, row=2, pady=10)

# 3. fs
label_fs = Label(text="Частота дискретизации:")
label_fs.grid(column=0, row=3, pady=10)
label_fs = Label(width=8, text="0")
label_fs.grid(sticky="W", column=1, row=3, pady=10)

# 4.Buttons
run_button = Button(root, text="Тест", command=run_goertzel)
run_button.grid(column=1, row=4, pady=10)
run_button = Button(root, text="Диаграмма входного сигнала", command=diagram_input)
run_button.grid(column=0, row=4, pady=10)
csv_button = Button(root, text="Создать CSV файл", command=create_csv)
csv_button.grid(column=2, row=4, pady=10)

# 5. Output
text_output = Text(root, height=10, width=100, bg="white")
text_output.grid(column=0, row=5, columnspan=4, pady=10)

scrollbar = Scrollbar(root, command=text_output.yview)
scrollbar.grid(column=4, row=5, sticky="NS", pady=10)
scrollbar.set(0.0, 1.0)

text_output.config(yscrollcommand=scrollbar.set)

root.mainloop()
