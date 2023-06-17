clear, clc, close all;

fs = 200;

f1=30;
f2=40;
f3=50;

t1 = 0 : 1/fs : 1-1/fs;
t2 = 1 : 1/fs : 2-1/fs;
t3 = 2 : 1/fs : 3-1/fs;

x1 = sin(2*pi*f1*t1);
x2 = sin(2*pi*f2*t2);
x3 = sin(2*pi*f3*t3);

ts = [t1 t2 t3];
x = [x1 x2 x3];
N = length(ts);

X = 2*abs(fft(x))/N;
f = (0:N-1)*fs/N;

subplot(2,1,1);
plot(x), grid on, title("Input signal");
subplot(2,1,2);
plot(f,X), grid on, title("DFT signal");

figure;
subplot(1,2,1);
[WX,freq] = wft(x,fs,'f0',0.05);
srf = surf(ts, freq, abs(WX));
set(srf, 'LineStyle', 'none');
title("Window Scale 0.05")
xlabel('Time'); ylabel('Frequency'); zlabel('Amplitude');
subplot(1,2,2);
[WX,freq] = wft(x,fs,'f0',0.25);
srf = surf(ts, freq, abs(WX));
set(srf, 'LineStyle', 'none');
title("Window Scale 0.25");
xlabel('Time'); ylabel('Frequency'); zlabel('Amplitude');
