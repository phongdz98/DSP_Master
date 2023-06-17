clear, clc, close all
fs = 100;
ts = 0 : 1/fs : 2 - 1/fs;
N = length(ts);

a = 1;
b = 0.2;

x = (a+(b-a)*rand(1,N)).*sin(2*pi*5*ts);

subplot(2,1,1);
plot(x), grid on
y = zeros(1, N+7);
for i = 7: N
y(i) = (x(i-1) + x(i-2) + x(i-3) + x(i-4) + x(i-5)+ x(i-6)) * 1/6;
end
subplot(2,1,2);
plot(y(1:200)), grid on
