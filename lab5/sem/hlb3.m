clear, clc, close all

fs = 40000;
ts = 0 : 1/fs : 0.05-1/fs;
N = length(ts);
fc = cos(2*pi*1000*ts);
fm = sin(2*pi*50*ts);

x = fc.*fm;
plot(ts, x), grid on

env_f = func;

y = filter(env_f.Numerator, 1, abs(x));

figure;

plot(ts,x), hold on;
plot(ts,y), grid on;

xh = hilbert(x);

xm = abs(xh);

% plot(xm)
