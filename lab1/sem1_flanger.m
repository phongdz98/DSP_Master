clear, clc, close all

[x, fs] = audioread('arlam.mp3');

N = length(x);

ts = 0: 1/fs : N*1/fs-1/fs;

d = abs(round(50*sin(2*pi*0.05*ts))); % comb wave generation

plot(d), grid on

y = x;

for i = 1 : N
   	flange_time_delay = i - d(i); 
    if flange_time_delay > 0
        y(i,:) = x(i,:) + x(flange_time_delay,:);
    else
        y(i,:) = x(i,:);
    end
end
subplot(3,1,1)
plot(x)
title("X")
subplot(3,1,2)
plot(d)
title("Comb wave")
subplot(3,1,3)
plot(y)
title("Y")
sound(y,fs)

% TODO: Distortion sfx

% TODO: Fade-in and Fade-out of wav-files

% TODO: Chorus sfx