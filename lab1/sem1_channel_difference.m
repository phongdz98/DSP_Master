clear, clc, close all

[x, fs] = audioread('Foo Fighters - Everlong.mp3');

subplot(2,1,1);

plot(x), grid on

y = zeros(size(x));

y(:,1) = x(:,1) * 2; % left channel is now at 200% original volume
y(:,2) = x(:,2) /10000 ; % right - at 50%

subplot(2,1,2);
plot(y), grid on

sound(y(1:400000), fs)