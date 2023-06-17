clear, close all;

fs = 200;
ts = 0: 1/fs: 1-1/fs;

x1 = sin(2*pi*4*ts);
x2 = [x1 x1];
x3 = [x1 x1 x1];

N = length(x3);

X1 = fft(x1, N);
X2 = fft(x2, N);
X3 = fft(x3, N);

subplot(3,2,1)
plot(x1), xlim([0 N]), grid on, title('4 periods');
subplot(3,2,2)
stem(abs(X1)), xlim([0 (N/2)]), grid on, title('DFT 4 periods');

subplot(3,2,3)
plot(x2), xlim([0 N]), grid on, title('8 periods');
subplot(3,2,4)
stem(abs(X2)), xlim([0 (N/2)]), grid on, title('DFT 8 periods');

subplot(3,2,5)
plot(x3), xlim([0 N]), grid on, title('12 periods');
subplot(3,2,6)
stem(abs(X3)), xlim([0 (N/2)]), grid on, title('DFT 12 periods');