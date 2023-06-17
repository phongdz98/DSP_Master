clc, clear, close all

fs = 200;
T = 2.5;
ts = 0:1/fs:T-1/fs;
N = length(ts);

[wpws,x] = wpfun('db2',4); %  вейвлет-пакетные функции
                           % Вейвлета Добеши DB2
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
title('Масштабирующая функция DB2 wpws0')
subplot(2,1,2)
plot(f(1:N/2),W0(1:N/2)), grid on
title('ДПФ W0')

figure
W1 = abs(fft(wpws(2,:)));
subplot(2,1,1)
plot(ts,wpws(2,:),'LineWidth',2), grid on;
title('Вейвлет DB2 wpws1')
subplot(2,1,2)
plot(f(1:N/2),W1(1:N/2)), grid on
title('ДПФ вейвлета DB2 W1')

figure
W2 = abs(fft(wpws(3,:)));
subplot(2,1,1)
plot(ts,wpws(3,:),'LineWidth',2), grid on;
title('Вейвлет DB2 wpws2')
subplot(2,1,2)
plot(f(1:N/2),W2(1:N/2)), grid on
title('ДПФ вейвлета DB2 W2')

figure
W3 = abs(fft(wpws(4,:)));
subplot(2,1,1)
plot(ts,wpws(4,:),'LineWidth',2), grid on;
title('Вейвлет DB2 wpws3')
subplot(2,1,2)
plot(f(1:N/2),W3(1:N/2)), grid on
title('ДПФ вейвлета DB2 W3')

figure
W4 = abs(fft(wpws(5,:)));
subplot(2,1,1)
plot(ts,wpws(5,:),'LineWidth',2), grid on;
title('Вейвлет DB2 wpws4')
subplot(2,1,2)
plot(f(1:N/2),W4(1:N/2)), grid on
title('ДПФ вейвлета DB2 W4')
 
                              