clear, clc, close all

fs = 400;

f1 = 10;
f2 = 20;
f3 = 30;
f4 = 40;
f5 = 50;

t1 = 0 : 1/fs : 1-1/fs;
t2 = 1 : 1/fs : 2-1/fs;
t3 = 2 : 1/fs : 3-1/fs;
t4 = 3 : 1/fs : 4-1/fs;
t5 = 4 : 1/fs : 5-1/fs;

x1 = sin(2*pi*f1*t1);
x2 = sin(2*pi*f2*t2);
x3 = sin(2*pi*f3*t3);
x4 = sin(2*pi*f4*t4);
x5 = sin(2*pi*f5*t5);

ts = [t1 t2 t3 t4 t5];
x = [x1 x2 x3 x4 x5];
N = length(ts);

X = 2*abs(fft(x))/N;
f = (0:N-1)*fs/N;

subplot(2,1,1);
plot(x), grid on, title("Исходный сигнал");
subplot(2,1,2);
stem(f,X), grid on, title("ДПФ исходного сигнала");

figure
cwt(x,'amor',fs)

% набор фильтров
fb = cwtfilterbank(SignalLength=numel(x),SamplingFrequency=fs,...
    FrequencyLimits=[10 50]);
figure
freqz(fb)
figure
cwt(x,FilterBank=fb)