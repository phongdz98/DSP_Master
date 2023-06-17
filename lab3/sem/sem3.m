
fs = 44100;
ts = 0:1/fs:0.1-1/fs;
N = length(ts);
x= sin(2*pi*1000*ts)+2*sin(2*pi*5000*ts)+sin(2*pi*10000*ts);
subplot(2,1,1)
plot(x(1:200)), grid on;
y = filter(Hd, x);
subplot(2,1,2)
plot(y(1:200)), grid on;

figure
%f = m*fs/N   
f = 0:fs/N:fs-fs/N;
f = f/1000;
subplot(2,1,1)
stem(f,abs(fft(x))*2/N), grid on
subplot(2,1,2)
stem(f,abs(fft(y))*2/N), grid on