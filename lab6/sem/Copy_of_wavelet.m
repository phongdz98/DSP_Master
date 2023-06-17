clc, clear, close all

fs  = 50;
T = 5;
ts = -T: 1/fs: T-1/fs;
g = exp(-ts.^2/2);
w = -diff(g,2);

subplot(3,1,1)

plot(g), grid on
subplot(3,1,2);
plot(w), grid on;
subplot(3,1,3);
W = abs(fft(w));
plot(W)
