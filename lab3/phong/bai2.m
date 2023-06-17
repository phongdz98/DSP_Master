clear, clc, close all
fs = 100;
ts = 0 : 1/fs : 2 - 1/fs;
N = length(ts);

% Dirac func
x = zeros(1,N);
x(8) = 1;

subplot(3,1,1);
stem(x), grid on, title('Dirac func')
y = zeros(1, N+7);
for i = 7: N
y(i) = (x(i-1) + x(i-2) + x(i-3) + x(i-4) + x(i-5)+ x(i-6)) * 1/6;
end
subplot(3,1,2);
stem(y(1:200)), grid on, title('Impulse Response') % Импульсная характеристика

X = 2*abs(fft(y,N))/N;
f = (0:N-1)*fs/N;

subplot(3,1,3);
stem(f,X), grid on, title('Frequency Response')
