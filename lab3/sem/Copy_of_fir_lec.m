clear , clc, close all
fs = 1000;
ts = 0:1/fs:1-1/fs;
N =length(ts);
x =zeros(N,1);
x(1:200) = 1;
y =real(ifftshift(ifft(x))); 
subplot(2,1,1);
plot(x), grid on
subplot(2,1,2);
plot(N/2-100:N/2+100,y(N/2-100:N/2+100)), grid on
d = zeros(N,1);
d(1)= 1;
figure

Nf1 = 10;
af1= filter(y(N/2-Nf1/2:N/2+Nf1/2-1),1,d);
subplot(2,2,1)
plot(abs(fft(af1))), grid on , title("N =10")
Nf2 = 20;
af2= filter(y(N/2-Nf2/2:N/2+Nf2/2-1),1,d);
subplot(2,2,2)
plot(abs(fft(af2))), grid on , title("N =20")
Nf3 = 50;
af3= filter(y(N/2-Nf3/2:N/2+Nf3/2-1),1,d);
subplot(2,2,3)
plot(abs(fft(af3))), grid on , title("N =50")
Nf4 = 100;
af4= filter(y(N/2-Nf4/2:N/2+Nf4/2-1),1,d);
subplot(2,2,4)
plot(abs(fft(af4))), grid on , title("N =100")