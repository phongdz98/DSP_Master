clear, clc, close all
[x, fs] = audioread('rock.wav');
N = length(x);
X = 2*abs(fft(x))/N;
subplot(3,1,1);
plot(X(1:10000)), grid on, title('DFT input signal');

x1 = zeros(N,1);
x1(1:5000) = 1;
y = real(ifftshift(ifft(x1)));

a = zeros(N,1);
a(1) =1; % Dirac
Nf1 = 2500;
af1 = filter(y(N/2-Nf1/2:N/2+Nf1/2-1).*hanning(Nf1),1,a);
af2 = filter(y(N/2-Nf1/2:N/2+Nf1/2-1).*hanning(Nf1),1,x);
subplot(3,1,2);
plot(abs(fft(af1))), xlim([0 10000]), grid on , title('Frequency Response low pass filter')
subplot(3,1,3);
plot(abs(fft(af2))), xlim([0 10000]), grid on , title('DFT filtered signal')