clear, clc, close all
fs = 10000;
ts = 0: 1/fs: 0.2 - 1/fs;
N = length(ts);

fc = cos(2*pi*250*ts);

code = [1 -1 1 1 1 -1 1 1 -1 1];
ns_bit = 200;

am = repelem(code , ns_bit);

plot(fc), grid on, hold on
plot(am)

x = fc.*am;

rng shuffle

x = x +(rand(1,N)*0.3-0.1);
h = hilbert(x);
scatterplot(h,ns_bit,round(ns_bit/2)) , grid on
figure
plot(x), grid on
y = x.*fc ;
figure
plot(y), grid on

figure;

plot(x), grid on , hold on


fltr = bpsk_filter;
yf = filter(fltr.Numerator,1,y);
figure;
plot(yf), grid on

dig = yf > 0.1;
figure
plot(x), grid on, hold on
plot(dig)




