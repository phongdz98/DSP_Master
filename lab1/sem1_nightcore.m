clear, clc, close all

[x,fs] = audioread('Foo Fighters - Everlong.mp3');

plot(x),grid on

sound(x(1:1000000), fs*2) % it plays for some time at 200% speed (см. nightcore) 