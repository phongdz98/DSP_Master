clear, clc, close all

fs = 100;
ts = 0: 1/fs: 5-1/fs;
N = length(ts);

x = sin(2*pi*10*ts);
x(300) = []; % убираем из сигнала отсчёт с индексом 300
plot(ts(1:length(ts)-1),x), grid on;
title('Синусоида с разрывом')

figure
[cfs,frq] = cwt(x,'amor',fs); % вейвлет-преобразование 
tms = (0:numel(x)-1)/fs;
surface(tms,frq,abs(cfs));
axis tight
shading flat
title('Вейвлет-преобразование')
xlabel('Время'), ylabel('Частота')