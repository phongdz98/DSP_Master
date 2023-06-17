clear, clc, close all
fs = 8000;
ts = 0:1/fs:0.01-1/fs;
N = length(ts);
x = cos(2*pi*1000*ts);
X = fft(x);
plot(x), grid on
fp = 2:N/2;
fn = N/2+2:N;
S(fn) = X(fn)*0;
S(fp) = X(fp)*2;
s = ifft(S);
figure
plot(real(s)), grid on, hold on
plot(imag(s))
legend({'Real';'Imag'});