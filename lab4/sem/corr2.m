clear, clc, close all;
[x,fs] = audioread('rock.wav', [1,100000]);
N = length(x);
a =0.5;
d = 10000;
y =x;
for i = d+1:N
    y(i) = x(i)+a*x(i-d);
end
sound(y,fs);
[r12, lags] = xcorr(y,'coeff');
r12 = r12(lags>0);
Nr = length(r12);
lags = lags(lags>0);
plot(lags, r12), grid on
findpeaks(r12,lags, 'MinPeakHeight',0.3);
[~, dl] = findpeaks(r12(200:Nr), lags(200:Nr),'MinPeakHeight',0.3);
y2 = filter(1,[1 zeros(1,dl-1) 0.5],y);
s = filt(1,[1 zeros(1,dl-1) 0.5])
sc = tf(1,[1 zeros(1,dl-1) 0.5])
sound(y,fs)