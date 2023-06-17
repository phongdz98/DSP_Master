clear, clc, close all
fs = 1000;
ts = 0:1/fs:1-1/fs;
N = length(ts);

x =zeros(N,1);
x(1:300)=1;
% ОДПФ(IDFT)
y = real(ifftshift(ifft(x))); 

subplot(2,1,1);
plot(x), grid on, title('Expected Frequency Response')

subplot(2,1,2)
plot(N/2-150:N/2+150-1,y(N/2-150:N/2+150-1)), grid on , title('Impulse Response')

a = zeros(N,1);
a(1) = 1;
figure

Nf1 = 50;
af1 = filter(y(N/2-Nf1/2:N/2+Nf1/2-1),1,a);
af2 = filter(y(N/2-Nf1/2:N/2+Nf1/2-1).*hanning(Nf1),1,a);

subplot(2,2,1)
plot(abs(fft(af1))), grid on ,title('Frequency Response , N=50')
subplot(2,2,2)
plot(abs(fft(af2))), grid on ,title('Frequency Response with Hanning window , N=50')

Nf2 = 100;
af3 = filter(y(N/2-Nf2/2:N/2+Nf2/2-1),1,a);
af4 = filter(y(N/2-Nf2/2:N/2+Nf2/2-1).*hanning(Nf2),1,a);

subplot(2,2,3)
plot(abs(fft(af3))), grid on ,title('Frequency Response , N=100')
subplot(2,2,4)
plot(abs(fft(af4))), grid on ,title('Frequency Response with Hanning window , N=100')


