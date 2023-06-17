clear,clc, close all
fs =8000;
ts =0:1/fs:0.002-1/fs;
N =length(ts)/4;
x1 = sin(2*pi*1000*ts)+0.5*sin(2*pi*2000*ts+3*pi/4);
fg = 1200;
m = fg/fs*N+1;
u1 =0;
u2 =0;
w =2*pi*(m-1)/N;
for n=1:N
u0 = 2*cos(w)*u1-u2+x1(n);
u2=u1;
u1=u0;
end
y = u0 - exp(-1i*w)*u2;
Y = 2*abs(y)/N;
disp('way 2: Use Goertzel algorithm');
disp(Y);
