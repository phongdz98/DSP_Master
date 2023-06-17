clear, clc, close all;

fs = 8000;
ts = 0 : 1/fs : 0.001-1/fs;
N = length(ts);

x =zeros(N,1);
x(1) = 1;

X = fft(x);

subplot(3, 2, 1)
stem(x), grid on, title('Dirac function')

subplot(3, 2, 2)
stem(real(X)), grid on, title('Real part X')

subplot(3, 2, 3)
stem(imag(X)), grid on, title('Imag part X')

subplot(3, 2, 4)
stem(abs(X)), grid on, title('Amplitude')
 
Xm = 2*abs(X)/N;

f = (0:N-1)*fs/N;
subplot(3, 2, 5)
stem(f,Xm), grid on, title('Normalized ampl and freq')

phi = angle(X)*180/pi;
subplot(3,2,6);
stem(f, phi), grid on, title('Phase response')
