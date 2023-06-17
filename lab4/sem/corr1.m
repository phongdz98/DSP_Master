clear, clc, close all;
fs = 100;
ts = 0:1/fs:5-1/fs;
N =length(ts);
x1 = (square(2*pi*ts)+1)/2;
x2 = (square(2*pi*ts+pi)+1)/2;

subplot(4,1,1);
plot(x1), grid on
subplot(4,1,2);
plot(x2), grid on
[r_12, lags] = xcorr(x1,x2,'unbiased');
subplot(4,1,3);
plot(lags,r_12), grid on
title("kf x1 and x2")

x2 = [x2 x2];
r_12_nom = zeros(1,N);
for j = 1:N-1
    r_12_nom(j) = sum(x1.*x2(j:j+N-1));
end

subplot(4,1,4);
plot(r_12_nom), grid on