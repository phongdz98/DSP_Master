veclear, clc, close all

[x, fs] = audioread('bas-gitara-zvuk-zvuk-42332.wav');
N =length(x);
S = 2*abs(fft(x))/N;
f = 0: fs/N : fs-fs/N;
stem(f,S(:,1)),xlim([0 1]) ,grid on, title ('БПФ исходного сигнала')
xlabel('Частота'), ylabel('Амплитуда')