clear, clc, close all

fs = 100;
ts = 0: 1/fs: 3-1/fs;

x = sin(2*pi*5*ts);
x(100) = [];

plot(x), grid on;

figure;
cwt(x,'amor', fs);