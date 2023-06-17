clear , clc, close all
[x, fs] = audioread('arlam.mp3');
threshold = 0.8;
mul = 3;
y = x*mul;
for i = 1:length(x)
    if y(i) > threshold
        y(i) = threshold;
    elseif y(i) < -threshold
        y(i) = -threshold;
    end
    if y(i,2) > threshold
        y(i,2) = threshold;
    elseif y(i,2) < -threshold
        y(i,2) = -threshold;
    end
end
subplot(2,1,1);
plot(x),grid on;
subplot(2,1,2);
plot(y),ylim([-1 1]),grid on;
audiowrite("arlam_distortion.wav",y,fs)
sound(y,fs)
