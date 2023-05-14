clc, clear, close all;
fs = 8000 ;
ts = 0: 1/fs:0.001-1/fs;
N = length(ts);
x = sin(2*pi*1000*ts) + 0.5*sin(2*pi*2000*ts + 3*pi/4);
save('my_signal.mat', 'x', 'fs');
audiowrite('signal.wav',x,fs);