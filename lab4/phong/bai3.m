clear, clc, close all;

N = 200;
a = -4;
b = 4;

% случайный сигнал
x = (a + (b-a)* rand(1,N));
subplot(2,1,1);
plot(x), grid on, title('Случайный сигнал')
[xc,lags] = xcorr(x,'coeff');
subplot(2,1,2);
plot (lags, xc), grid on;
title ('Автокорреляционная функция случайного сигнала');