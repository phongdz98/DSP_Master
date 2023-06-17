clear, clc, close all

fs = 10000;
ts = 0: 1/fs: 0.2-1/fs;
N = length(ts);

%% 8PSK
fc = 1000;
M = 8;
Nd = 100;
bit_size = N / Nd;% длина одного бита в отсчётах
data =  randi([0 M-1],Nd,1).'; % количество отсчётов на бит

% Преобразование Gray в Natural Binary для PSK, вместо  pskmod
bin_gray = de2bi(data, 3, 'right-msb');
bin_natural = zeros(size(bin_gray));
for i = 1:Nd
    for j = 3:-1:1
        if j == 3
            bin_natural(i, 3) = bin_gray(i, 3);
        else
            bin_natural(i, j) = bitxor(bin_natural(i, j+1), bin_gray(i, j));
        end
    end
end
pdata =  exp(1i*2*pi/M *bi2de(bin_natural, 'right-msb')).'; % Массив комплексных чисел
pdata = awgn(pdata,20);% Добавить белый Гауссов шум
scatterplot(pdata), grid on;

qmod = repelem(pdata,bit_size);
i = real(qmod).*cos(2*pi*fc*ts);
q = imag(qmod).*sin(2*pi*fc*ts);
y= i +q;

figure 
subplot(3,1,1)
plot(real(qmod))
title('Действительная часть сигнала')
subplot(3,1,2)
plot(imag(qmod))
title('Мнимая часть сигнала')
subplot(3,1,3)
plot(y)
title('Модулированный сигнал')

%% 8PSK демодуляция

io = 2*y.*cos(2*pi*fc*ts);
qo = 2*y.*sin(2*pi*fc*ts);

filer_8psk = psk_filter_lowpass;
iof = round(conv(filer_8psk.Numerator,io));
qof = round(conv(filer_8psk.Numerator,qo));

figure
subplot(2,1,1)
plot(iof)
title('Синфазная составляющая демодулированного сигнала после ФНЧ')
subplot(2,1,2)
plot(qof)
title('Квадратурная составляющая демодулированного сигнала после ФНЧ')

of = complex(iof, qof);
fir_delay = round(length(filer_8psk.Numerator)/2);
of_dec = of(fir_delay+round(bit_size/2):bit_size:length(of)-fir_delay);

% Преобразование Natural Binary в Gray для демодуляция PSK, вместо pskdemod
edges = zeros(size(of_dec));
data_received = zeros(size(of_dec));
for i = 1: length(of_dec)
    edges(i) = angle(of_dec(i));
    if edges(i) < 0
        edges(i) = edges(i) + 2*pi;
    end
    data_received(i) = bitxor(edges(i)/(2*pi/M),floor(edges(i)/(2*pi/M)/2));
end

% Сравниваем результаты
figure
plot(data,'b-'), grid on, hold on
plot(data_received,'x','LineWidth',2)
title('Сравнение закодированных (переданных) и декодированных (принятых) данных')
legend({'Переданные данные';'Принятые данные'})

