clear, clc, close all

fs = 10000;
ts = 0: 1/fs: 0.5-1/fs;
N = length(ts);

%% 64-QAM
fc = 1000;
M = 64;
Nd = 100;
bit_size = N / Nd;% длина одного бита в отсчётах
data =  randi([0 M-1],Nd,1).'; % количество отсчётов на бит

% % Создание созвездиий для 64-QAM
x = (0:M-1);
y = bitxor(x, floor(x/2)); % преоброзование в код Грея

qamSymbols = zeros(1, M); 
index = 1; 
i_indexs = -7:2:7;
q_indexs = -7:2:7;
for i = -7:2:7
    if mod(i, 4) == 1
        j_range = flip(q_indexs);
    else
        j_range = q_indexs;
    end
    
    for j = j_range
        qamSymbols(index) = i + j*1i;
        index = index + 1;
    end
end
qam_64_table = zeros(2,M);
qam_64_table(1,:)=y;
qam_64_table(2,:)=qamSymbols;

% преоброзование data в  массив значений 64-QAM сигнала
qdata = zeros(1,Nd);
for i= 1:Nd
   qdata(i) = qam_64_table(2,y==data(i));
end
% qdata = qammod(data,M);
qdata = awgn(qdata,20);% Добавить белый Гауссов шум
scatterplot(qdata), grid on;

qmod = repelem(qdata,bit_size);
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

%% 64-QAM демодуляция

io = 2*y.*cos(2*pi*fc*ts);
qo = 2*y.*sin(2*pi*fc*ts);

filer_64qam = qam_filter_lowpass;
iof = round(conv(filer_64qam.Numerator,io));
qof = round(conv(filer_64qam.Numerator,qo));

figure
subplot(2,1,1)
plot(iof)
title('Синфазная составляющая демодулированного сигнала после ФНЧ')
subplot(2,1,2)
plot(qof)
title('Квадратурная составляющая демодулированного сигнала после ФНЧ')

of = complex(iof, qof);
fir_delay = round(length(filer_64qam.Numerator)/2);
of_dec = of(fir_delay+round(bit_size/2):bit_size:length(of)-fir_delay);
data_received = zeros(size(of_dec));

for i=1:length(of_dec)
    i_val = real(of_dec(i));
    q_val = imag(of_dec(i));
    [~,i_index] = min(abs(i_val-i_indexs));
    [~,q_index] = min(abs(q_val-q_indexs));
    qamSymbol =  i_indexs(i_index) + 1i*q_indexs(q_index);
    data_received(i) = qam_64_table(1,qamSymbols == qamSymbol);
end

% y =qamdemod(of_dec,M);

% Сравниваем результаты
figure
plot(data,'b-'), grid on, hold on
plot(data_received,'x','LineWidth',2)
title('Сравнение закодированных (переданных) и декодированных (принятых) данных')
legend({'Переданные данные';'Принятые данные'})
