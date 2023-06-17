clc, clear, close all

fs  = 100;
T = 5;
ts = -T: 1/fs: T-1/fs;
N = length(ts);

f = 0:fs/N:fs-fs/N;

figure

g1 = exp(-ts.^2*2); %Гауссова функция
dg1 = -diff(g1,2); % вторая производная от Гауссовой функции
W1 = abs(fft(dg1));

subplot(3, 1, 1)
plot(ts,g1), grid on
title('Гауссова функция g1')
subplot(3,1,2)
plot(ts(1:length(ts)-2),dg1), grid on;
title('Вейвлет "Мексиканская шляпа" dg1')
subplot(3,1,3)
plot(f(1:N/2),W1(1:N/2)), grid on
title('ДПФ вейвлета "Мексиканская шляпа" W1')

figure

g2 = exp(-ts.^2*4); %Гауссова функция
dg2 = -diff(g2,2); % вторая производная от Гауссовой функции
W2 = abs(fft(dg2));

subplot(3, 1, 1)
plot(ts,g2), grid on
title('Гауссова функция g2')
subplot(3,1,2)
plot(ts(1:length(ts)-2),dg2), grid on;
title('Вейвлет "Мексиканская шляпа" dg2')
subplot(3,1,3)
plot(f(1:N/2),W2(1:N/2)), grid on
title('ДПФ вейвлета "Мексиканская шляпа" W2')


figure

g3 = exp(-ts.^2*8); %Гауссова функция
dg3 = -diff(g3,2); % вторая производная от Гауссовой функции
W3 = abs(fft(dg3));

subplot(3, 1, 1)
plot(ts,g3), grid on
title('Гауссова функция g3')
subplot(3,1,2)
plot(ts(1:length(ts)-2),dg3), grid on;
title('Вейвлет "Мексиканская шляпа" dg3')
subplot(3,1,3)
plot(f(1:N/2),W3(1:N/2)), grid on
title('ДПФ вейвлета "Мексиканская шляпа" W3')


figure

g4 = exp(-ts.^2*16); %Гауссова функция
dg4 = -diff(g4,2); % вторая производная от Гауссовой функции
W4 = abs(fft(dg4));

subplot(3, 1, 1)
plot(ts,g4), grid on
title('Гауссова функция g4')
subplot(3,1,2)
plot(ts(1:length(ts)-2),dg4), grid on;
title('Вейвлет "Мексиканская шляпа" dg4')
subplot(3,1,3)
plot(f(1:N/2),W4(1:N/2)), grid on
title('ДПФ вейвлета "Мексиканская шляпа" W4')


figure

g5 = exp(-ts.^2*32); %Гауссова функция
dg5 = -diff(g5,2); % вторая производная от Гауссовой функции
W5 = abs(fft(dg5));

subplot(3, 1, 1)
plot(ts,g5), grid on
title('Гауссова функция g5')
subplot(3,1,2)
plot(ts(1:length(ts)-2),dg5), grid on;
title('Вейвлет "Мексиканская шляпа" dg5')
subplot(3,1,3)
plot(f(1:N/2),W5(1:N/2)), grid on
title('ДПФ вейвлета "Мексиканская шляпа" W5')