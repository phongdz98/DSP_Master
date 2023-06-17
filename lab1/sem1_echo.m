clear, clc, close all

[x, fs] = audioread('short_song.mp3');
subplot(2,1,1);
plot(x), grid on

k = 0.5;  
d = 10000; % delay

y = x;    

for i = d+1 : length(x) % for every sample from delay start to song finish
    y(i,:) = x(i,:) + k*x(i-d,:); 
end
subplot(2,1,2);
plot(y), grid on
