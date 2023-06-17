clear, clc, close all
Nh = 128;
n = -Nh/2:Nh/2-1;
h = 1./(pi*n).*(1-cos(pi*n));
h(Nh/2+1)=0;
h = h.*hamming(Nh)';
plot(h), grid on;
fs = 40000;
ts = 0:1/fs:0.01-1/fs;
N = length(ts);
x = cos(2*pi*1000*ts);
y = conv(x,h);

D = round((Nh-1)/2);
x = [zeros(1,D),x];

figure
plot(x), grid on, hold on 
plot(y)

