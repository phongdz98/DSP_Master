clear, clc, close all

fs = 10000;
ts = 0 : 1/fs : 0.1-1/fs;
N = length(ts);

fc = 1000;
h = 6;
T = 0.01;

f0 = fc+h/(2*T); % частота лог. "0"
f1 = fc-h/(2*T); % частота лог. "1"

n_for_bit = T*fs; % длина одного бита в отсчётах

code = [1 0 1 1 0 0 1 0 0 1];

%% модулирующий сигнал
fm = repelem(code , n_for_bit); % Модулирующий сигнал

%% Частотная манипуляция (FSK)
x0 = cos(2*pi*f0*ts);
x1 = cos(2*pi*f1*ts);
x = zeros(1,N);
for i = 1:N 
    if fm(i) == 0
        x(i)  =x0(i);
    else
        x(i) = x1(i);
    end
end

figure;
plot(ts, x), grid on, hold on
plot(ts, fm,'LineWidth',2)
title ('Частотная манипуляция (FSK)')
legend({'Модулированный сигнал';'Модулирующий сигнал'})

%% FSK демодуляция

y0 = x.*x0;
y1 = x.*x1;

y = y1-y0;

figure
subplot(3,1,1)
plot(ts, y0), grid on
subplot(3,1,2)
plot(ts, y1), grid on
subplot(3,1,3)
plot(ts, y), grid on
title('Сигнал y = y0-y1')

fltr = fsk_filter_lowpass;
z = filter(fltr.Numerator,1,y);

dem = z >= 0.1;
figure
subplot(2,1,1)
plot(ts,z), grid on
title('Сигнал y, прошедший через ФНЧ')
subplot(2,1,2)
plot(ts,dem), grid on
title('Код демодулированного сигнала')
