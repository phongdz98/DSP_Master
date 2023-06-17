clear , clc, close all;

fs1 = 2000; 
fs2 = 400; 
fs3 = 120; 

T = 1;
ts1 = 0 : 1/fs1 : T-1/fs1;
ts2 = 0 : 1/fs2 : T-1/fs2;
ts3 = 0 : 1/fs3 : T-1/fs3;

x1 = sin(2*pi*100*ts1);
x2 = sin(2*pi*100*ts2);
x3 = sin(2*pi*100*ts3);

plot(ts1(1:200), x1(1:200),'-g',  ...
     ts2(1:40),  x2(1:40), '-bo',  ...
     ts3(1:12),  x3(1:12)),'-rx'; grid on
title('Discretization')
xlabel('Time, s')
ylabel('Amplitude')