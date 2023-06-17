clear, clc, close all

fs = 10000;
ts = 0: 1/fs: 0.2-1/fs;
N = length(ts);

%% несущий сигнал
fc = cos(2*pi*250*ts);
fc = awgn(fc,35); % Добавить белый Гауссов шум

%% модулирующий сигнал
code = [1 -1 -1 1 1 -1 -1 1 -1 1]; % кодируемая последовательность
ns_bit = 200;% длина одного бита в отсчётах

pm = repelem(code , ns_bit); % Модулирующий сигнал

%% Фазовая манипуляция (BPSK)
x = fc.*pm;
figure;
plot(ts,x,'LineWidth',1), grid on, hold on
plot(ts, pm , 'LineWidth',2 ) , grid on, hold on
legend({'Модулированный сигнал';'Модулирующий сигнал'})
title('Фазовая манипуляция (BPSK)')
h = hilbert(x);
scatterplot(h,ns_bit,round(ns_bit/2)) , grid on

%% BPSK демодуляция
y = x.*fc;
figure;
subplot(3,1,1)
plot(ts,y), grid on
title('Модулированный сигнал, умноженный на несущую')

demod_filter = bpsk_filer_lowpass;
z = filter(demod_filter.Numerator, 1,y);

subplot(3,1,2)
plot(ts,z), grid on
title('Сигнал y, прошедший через ФНЧ')

dem = z >=0.1;
subplot(3,1,3)
plot(ts, dem ),  grid on
title('Демодулированный сигнал')

