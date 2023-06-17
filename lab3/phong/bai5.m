clear, clc, close all;
fs = 20000;
ts = 0:1/fs:1-1/fs;
N = length(ts);
x = 0.15*sin(2*pi*1500*ts) + sin(2*pi*5000*ts+3*pi/4)+ 0.15*cos(2*pi*8500*ts);
subplot(2,2,1)
plot(x),xlim([100 200]), grid on, title('Input signal')
subplot(2,2,2)
stem(2*abs(fft(x))/N), xlim([0 N/2]) ,grid on, title('DFT input signal')
fir = bpf;
y = filter(fir.Numerator, 1,x);
subplot(2,2,3)
plot(y),xlim([100 200]), grid on, title('Filtered signal')
subplot(2,2,4)
stem(2*abs(fft(y))/N), xlim([0 N/2]) , grid on, title('DFT filtered signal')