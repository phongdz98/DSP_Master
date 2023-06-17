clc, clear, close all

fs = 100;
f1 = 10;
f2 = 20;
f3 = 30;

t1 = 0: 1/fs: 1- 1/fs;
x1 = sin(2*pi*f1*t1);
t2 = 1: 1/fs: 2- 1/fs;
x2 = sin(2*pi*f2*t2);
t3 = 2: 1/fs: 3- 1/fs;
x3 = sin(2*pi*f3*t3);

t = [t1 t2 t3];
x = [x1 x2 x3];
N = length(x);

figure
subplot(2,1,1)
plot(t,x), grid on
subplot(2,1,2)
plot(abs(fft(x)))

figure 
cwt(x, 'amor',fs)

fb = cwtfilters2array('SignalLength', nummel(x), 'SamplingFrequency', 'FrequencyLimits', [10 30]);

figure
freqz(fb)

figure
cwt(x,'FilterBank', fb)