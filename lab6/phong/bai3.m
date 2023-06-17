clc, clear, close all

fs = 258;
T = 1.5;
ts = 0:2/fs:T-1/fs;
N = length(ts);

[wpws,x] = wpfun('db1',4); %  вейвлет-пакетные функции
                         % Вейвлеты Хаара (Db1)

for i = 1: size(wpws,1)
    for j = length(wpws) + 1 : length(ts)
        wpws(i,j) = 0;
    end
end

f = 0:fs/N:fs-fs/N;

figure
W0 = abs(fft(wpws(1,:)));
subplot(2,1,1)
plot(ts,wpws(1,:),'LineWidth',2), grid on;
title('Масштабирующая функция Хаара wpws0')
subplot(2,1,2)
plot(f(1:N/2),W0(1:N/2)), grid on
title('ДПФ W0')

figure
W1 = abs(fft(wpws(2,:)));
subplot(2,1,1)
plot(ts,wpws(2,:),'LineWidth',2), grid on;
title('Вейвлет Хаара wpws1')
subplot(2,1,2)
plot(f(1:N/2),W1(1:N/2)), grid on
title('ДПФ вейвлета Хаара W1')

figure
W2 = abs(fft(wpws(3,:)));
subplot(2,1,1)
plot(ts,wpws(3,:),'LineWidth',2), grid on;
title('Вейвлет Хаара wpws2')
subplot(2,1,2)
plot(f(1:N/2),W2(1:N/2)), grid on
title('ДПФ вейвлета Хаара W2')

figure
W3 = abs(fft(wpws(4,:)));
subplot(2,1,1)
plot(ts,wpws(4,:),'LineWidth',2), grid on;
title('Вейвлет Хаара wpws3')
subplot(2,1,2)
plot(f(1:N/2),W3(1:N/2)), grid on
title('ДПФ вейвлета Хаара W3')

figure
W4 = abs(fft(wpws(5,:)));
subplot(2,1,1)
plot(ts,wpws(5,:),'LineWidth',2), grid on;
title('Вейвлет Хаара wpws4')
subplot(2,1,2)
plot(f(1:N/2),W4(1:N/2)), grid on
title('ДПФ вейвлета Хаара W4')
