clear, clc, close all
fs = 10000;
ts = -0.1 : 1/fs : 0.1-1/fs;
N = length(ts);

fc = cos(2*pi*500*ts);
fc = awgn(fc,30); %% nhieu 

n_for_bit = 200;

code = [1 0.1 0.1 1 1 0.1 1 0.1 1 1];

fm = zeros(1,N);
for i=1:length(code)
    for j=n_for_bit*(i-1)+1:n_for_bit*i
        fm(j) = code(i);
    end
end

x = fc.*fm;

plot(ts,x,'LineWidth',0.5), grid on, hold on
plot(ts,fm,'LineWidth',2), grid on
title ('ASK модуляция')
xlabel('Время'), ylabel('Амплитуда')
legend({'Модулированный сигнал';'Модулирующий сигнал'})

scatterplot(hilbert(x),n_for_bit,round(n_for_bit/2)), grid on

h = hilbert(x);