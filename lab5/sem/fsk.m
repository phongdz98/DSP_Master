clear, clc, close all
fs = 10000;
ts = 0 : 1/fs : 0.1-1/fs;
N = length(ts);
%% параметры несущей
fc = 500;        % несущая частота
h = 4;  
T = 10e-3;
f0 = fc + h/(2*T);
f1 = fc - h/(2*T);

code = [0 1 0 0 1 1 1 0 1 0];
bit_len = T * fs;

mod = repelem(code, bit_len);

x0 = cos(2*pi*f0*ts);
x1 = cos(2*pi*f1*ts);

x = zeros(1,N);
for i = 1:N 
    if mod(i) == 0
        x(i)  =x0(i);
    else
        x(i) = x1(i);
    end
end

plot(ts, x), grid on, hold on
plot(ts, mod)

y0 = x.*x0;
y1 = x.*x1;

y = y1- y0;

figure
subplot(2,1,1)
plot(y), grid on

fltr = fsk_fir;
yf = filter(fltr.Numerator, 1, y);

subplot(2,1,2)
plot(yf), grid on

dem = yf >= 0.2;

figure
plot(x), grid on, hold on

plot(dem)