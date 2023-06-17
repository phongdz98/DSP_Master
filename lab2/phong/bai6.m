clear, clc, close all;

fs = 130;
Ns = 30;
ts = 0 : 1/fs : Ns*10-1/fs;
N = length(ts);

f1 = 19;
f2 = 50;

x = 0.4*sin(2*pi*f2*ts) + 0.5*sin(2*pi*(f1-0.1)*ts) + ...
    0.6*sin(2*pi*f1*ts) + 0.5*sin(2*pi*(f1+0.1)*ts) + ...
    0.4*sin(2*pi*f1*2*ts) + 0.5*sin(2*pi*f1*3*ts) + ...
    4*randn(size(ts)) + pinknoise(N);

N1 = round(length(ts)/Ns);
x1 = x(1:N1);

F = (0 : N1-1)*fs/N1;
X = abs(fft(x1))*2/N1;

figure;
subplot(2,2,1);
plot(x1); grid on;
title('Input signal');

subplot(2,2,2);
plot(F,X); grid on;
title('DFT Input signal');

h = hanning(N1)';
xw = x1.*h;

subplot(2,2,3);
plot(xw); grid on;
title('Input signal with hanning window');

Xw = abs(fft(xw))*2/N1;

subplot(2,2,4);
plot(F,Xw); grid on;
title('DFT signal with hanning window');

Nseg = 1000;
Xsum = zeros(1,Nseg);
for i =1 : N/Nseg
    xtmp = x( (i-1)*Nseg+1 : (i-1)*Nseg+Nseg ).* hanning(Nseg)';
    Xsum = Xsum + abs(fft(xtmp))*2/Nseg;   
end
Xsum = Xsum/(N/Nseg);
fsum = (0 : Nseg-1)*fs/Nseg;
figure;
plot(fsum(1:Nseg/2),Xsum(1:Nseg/2)); grid on;
title('Averaged DFT');