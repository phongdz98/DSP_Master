clear, clc, close all;

fs = 50;
ts = 0: 1/fs: 0.4-1/fs;

x = sin(2*pi*5*ts)+ sin(2*pi*15*ts);

N1= length(ts);
N2=128;
N3=256;

X1 = abs(fft(x,N1));
X2 = abs(fft(x,N2));
X3 = abs(fft(x,N3));

F1 = (0 : N1-1)*fs/N1;
F2 = (0 : N2-1)*fs/N2;
F3 = (0 : N3-1)*fs/N3;

subplot(3,1,1)
stem(F1,X1),title('N = 20')
grid on

subplot(3,1,2)
stem(F2,X2),title('N = 128')
grid on

subplot(3,1,3)
stem(F3,X3),title('N = 256')
grid on