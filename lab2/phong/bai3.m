clear, clc, close all;

fs = 32000;
ts = 0:1/fs:0.005-1/fs;
N= length(ts);

subplot(2,2,1);

x1 = sin(2*pi*8000*ts)+0.075*sin(2*pi*9900*ts);
X1 = abs(fft(x1));
stem(X1), grid on, title ('DFT Signal 1');

subplot(2,2,3);

x2 = sin(2*pi*8500*ts)+0.075*sin(2*pi*9900*ts);
X2 = abs(fft(x2));
stem(X2), grid on, title ('DFT Signal 2');


subplot(2,2,2);
h = hanning(N)';
x1w = x1.*h;
X1w = abs(fft(x1w));
stem(X1w), grid on, title ('DFT Signal 1 with Hanning window');

subplot(2,2,4);
x2w = x2.*h;
X2w = abs(fft(x2w));
stem(X2w), grid on, title ('DFT Signal 2 with Hanning window');
