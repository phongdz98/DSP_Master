clear, clc, close all
fs = 10000;
ts = 0: 1/fs: 0.2 - 1/fs;
N = length(ts);

%% несущий сигнал
fc = cos(2*pi*500*ts);
fc = awgn(fc,30); % Добавить белый Гауссов шум

%% модулирующий сигнал
code = [1 0.1 0.1 1 1 0.1 0.1 1 0.1 1]; % кодируемая последовательность
ns_bit = 200;% длина одного бита в отсчётах

am = repelem(code , ns_bit); % Модулирующий сигнал

%% Амплитудная манипуляция (ASK)
x = fc.*am;
figure;
plot(ts,x,'LineWidth',1), grid on, hold on
plot(ts, am , 'LineWidth',2 ) , grid on, hold on
legend({'Модулированный сигнал';'Модулирующий сигнал'})
title('Амплитудная манипуляция (ASK)')
h = hilbert(x);
scatterplot(h,ns_bit,round(ns_bit/2)) , grid on

%% ASK демодуляция
ah = abs(h);
dem = ah >=0.5;
figure;
subplot(2,1,1)
plot(ts,x,'LineWidth',0.5), grid on, hold on
plot(ts, ah , 'LineWidth',2 ) , grid on
legend({'Модулированный сигнал';'Демодулированный сигнал'})
title('ASK демодуляция')
subplot(2,1,2)
plot(ts, dem  ) , grid on
title('Код демодулированного сигнала')




