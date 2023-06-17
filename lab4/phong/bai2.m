clear, clc, close all;

fs = 100;
ts = 0:1/fs:2-1/fs;
N =length(ts);

x = sin(2*pi*10*ts);
x = awgn(x,5); % Добавить белый Гауссов шум
subplot(2,1,1);
plot(x), grid on,title ('Исходный сигнал');

[xc, lags] = xcorr(x);
subplot(2,1,2);
plot (lags, xc), grid on ,ylim([-max(xc) max(xc)]);
title ('Автокорреляционная функция');
