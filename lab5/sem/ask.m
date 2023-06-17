clear, clc, close all
fs = 10000;
ts = 0: 1/fs: 0.2 - 1/fs;
N = length(ts);

fc = cos(2*pi*500*ts);

code = [1 0.1 1 1 1 0.1 1 1 0.1 1];
ns_bit = 200;

am = repelem(code , ns_bit);

plot(fc), grid on, hold on
plot(am)

x = fc.*am;

rng shuffle

x = x +(rand(1,N)*0.3-0.1);

figure;

plot(x), grid on , hold on
plot(am)

h = hilbert(x);
plot(abs(h))


dig = abs(h) > 0.5;
figure
plot(dig), grid on, hold on

scatterplot(h,ns_bit,round(ns_bit/2)) , grid on




