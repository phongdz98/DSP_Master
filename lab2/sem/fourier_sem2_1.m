% add to sem02
clear, clc, close all

fs = 8000;
ts = 0 : 1/fs : 0.001-1/fs;
N = length(ts);

x = sin(2*pi*1000*ts) + 0.5*sin(2*pi*2000*ts+3*pi/4);

% Dirac too to sem02
% x = zeros(N, 1);
% x(1) = 1;

plot(x, '-bo'), grid on, title('Source signal')

X = fft(x);

% for m = 1 : N
%     for n = 1 : N
%         X(m) = X(m) + x(n)*(cos(2*pi*(n-1)*(m-1)/N) - 1i*sin(2*pi*(n-1)*(m-1)/N));
%     end
% end



figure;
subplot(2, 1, 1)
stem(real(X)), grid on, title('Read part X')

subplot(2, 1, 2)
stem(imag(X)), grid on, title('Imag part X')

figure;
stem(abs(X)), grid on, title('Amplitude')

Xm = 2 * abs(X)/N;

f = zeros(N, 1);
for i = 1 : N
    f(i) = (i-1)*fs/N;
end

figure;
stem(f, Xm), grid on, title('Normalized ampl and freq')

phi = angle(X) * 180/pi;

figure;
stem(f, phi), grid on, title('Phase response')
