clear, clc, close all;

fs = 10000;
ts = 0 : 1/fs : 0.01-1/fs;
N = length(ts);

x = 2*sin(2*pi*500*ts) + sin(2*pi*4000*ts+3*pi/4) + sin(2*pi*2000*ts);  

plot(x, '-bo'), grid on, title('Source signal')

% X = fft(x);
X =zeros(N,1);
for m =1:N
    for n =1:N
        X(m)=X(m)+x(n)*(cos(2*pi*(n-1)*(m-1)/N)-1i*sin(2*pi*(n-1)*(m-1)/N));
    end
end

figure;
subplot(3, 2, 1)
stem(real(X)), grid on, title('Real part X')

subplot(3, 2, 2)
stem(imag(X)), grid on, title('Imag part X')

subplot(3, 2, 3)
stem(abs(X)), grid on, title('Amplitude')
 
Xm = 2*abs(X)/N;
subplot(3, 2, 4)
stem(Xm), grid on, title('Normalized amplitude')

f = (0:N-1)*fs/N;
subplot(3, 2, 5)
stem(f,Xm), grid on, title('Normalized ampl and freq')

phi = angle(X)*180/pi;
subplot(3,2,6);
stem(f, phi), grid on, title('Phase response')


