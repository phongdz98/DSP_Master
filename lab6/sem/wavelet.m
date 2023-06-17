clc, clear, close all

fs  = 50;
T = 5;
ts = -T: 1/fs: T-1/fs;
c = cos(2*pi*ts);
g = exp(-ts.^2/2);
w = c.*g;

subplot(3,1,1)

plot(c), grid on
subplot(3,1,2);
plot(g), grid on;
subplot(3,1,3);
plot(w), grid on;

figure
W = abs(fft(w));
plot(W)
