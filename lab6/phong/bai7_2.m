clear ,clc ,close all

fs = 1000;
ts = 0: 1/fs: 1-1/fs;

x = 2*sin(2*pi*5*ts) +  6 *sin(2*pi*10*ts);
x = awgn(x,5);
plot(x), hold on

x1 = wdenoise(x,3,'Wavelet', 'db2');
plot(x1,'LineWidth',2)

legend({'Input signal';'Denoised signal'})