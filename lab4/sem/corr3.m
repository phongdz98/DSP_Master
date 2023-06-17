clear, clc, close all;
fs = 10;
ts = 0:1/fs:10-1/fs;
N =length(ts);

rng shuffle; 
x = rand(1,N).*sin(2*pi*0.5*ts)+1.5*rand(1,N);
subplot(2,1,1)
plot(x),grid on
[r12, lags] = xcorr(x,'unbiased');
subplot(2,1,2)
plot(lags, r12), grid on