clc, clear, close all

fs  = 40;
T = 5;
ts = -T: 1/fs: T-1/fs;
N = length(ts);

f1 = 1;
f2 = 1.5;
f3 = 2;
f4 = 2.5;
f5 = 3;

figure
g = exp(-ts.^2/2);  %Гауссова функция
plot(ts, g), grid on
title('Гауссова функция')

f = 0:fs/N:fs-fs/N;

figure
x1 = cos(2*pi*ts*f1);
w1 = x1.*g;
W1 = abs(fft(w1));
subplot(3, 1, 1)
plot(ts,x1), grid on
title('Косинусоидальный сигнал x1 при f1 = 1 Гц')
subplot(3,1,2)
plot(ts,w1), grid on;
title('Вейвлет Морле w1')
subplot(3,1,3)
plot(f(1:N/2),W1(1:N/2)), grid on
title('ДПФ вейвлета Морле W1')


figure
x2 = cos(2*pi*ts*f2);
w2 = x2.*g;
W2 = abs(fft(w2));
subplot(3, 1, 1)
plot(ts,x2), grid on
title('Косинусоидальный сигнал x2 при f2 = 1.5 Гц')
subplot(3,1,2)
plot(ts,w2), grid on;
title('Вейвлет Морле w2')
subplot(3,1,3)
plot(f(1:N/2),W2(1:N/2)), grid on
title('ДПФ вейвлета Морле W2')

figure
x3 = cos(2*pi*ts*f3);
w3 = x3.*g;
W3 = abs(fft(w3));
subplot(3, 1, 1)
plot(ts,x3), grid on
title('Косинусоидальный сигнал x3 при f3 = 2 Гц')
subplot(3,1,2)
plot(ts,w3), grid on;
title('Вейвлет Морле w3')
subplot(3,1,3)
plot(f(1:N/2),W3(1:N/2)), grid on
title('ДПФ вейвлета Морле W3')

figure
x4 = cos(2*pi*ts*f4);
w4 = x4.*g;
W4 = abs(fft(w4));
subplot(3, 1, 1)
plot(ts,x4), grid on
title('Косинусоидальный сигнал x4 при f4 = 3 Гц')
subplot(3,1,2)
plot(ts,w4), grid on;
title('Вейвлет Морле w4')
subplot(3,1,3)
plot(f(1:N/2),W4(1:N/2)), grid on
title('ДПФ вейвлета Морле W4')


figure
x5 = cos(2*pi*ts*f5);
w5 = x5.*g;
W5 = abs(fft(w5));
subplot(3, 1, 1)
plot(ts,x5), grid on
title('Косинусоидальный сигнал x5 при f5 = 2.5 Гц')
subplot(3,1,2)
plot(ts,w5), grid on;
title('Вейвлет Морле w5')
subplot(3,1,3)
plot(f(1:N/2),W5(1:N/2)), grid on
title('ДПФ вейвлета Морле W5')

