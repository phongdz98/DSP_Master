clear, clc, close all;

fs = 100;
ts = 0:1/fs:2-2/fs;
N =length(ts);

x1 = sin(2*pi*10*ts);
x2 = sin(2*pi*10*ts+pi);

figure;
subplot(2,1,1);
plot(x1), grid on;
title('Исходный сигнал x1')
subplot(2,1,2);
plot(x2), grid on;
title('Исходный сигнал x2')

figure;
[r12, lags] = xcorr(x1, x2);
subplot(3,1,1);
plot(lags, r12), grid on;
xlabel('Временной сдвиг, j'), ylabel('r_{12}[j]');
title('Корреляционная функция с краевым эффектом');


% способ убрать влияние краевого эффекта - увеличить длину одного из сигналов
x2 = [x2 x2];

r12 =zeros(1,N);
p12 = zeros(1,N);

for j = 1:N-1
    r12(j) = sum(x1.*x2(j:j+N-1));
    p12(j) = r12(j)/(sqrt(sum(x1.^2)*sum(x2(j:j+N-1).^2)));
end

subplot(3,1,2);
plot(r12), grid on;
xlabel('Временной сдвиг, j'), ylim([-100 100]), ylabel('r_{12}[j]');
title('Корреляционная функция');

subplot(3,1,3);
plot(p12), grid on;
xlabel('Временной сдвиг, j'), ylim([-1 1]), ylabel('p_{12}[j]');
title('Нормированная корреляционная функция ');
