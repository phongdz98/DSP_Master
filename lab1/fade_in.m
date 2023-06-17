clear , clc, close all
[x, fs] = audioread('arlam.mp3');
subplot(3,1,1);
plot(x), grid on;
title("Original song");

%fade in
out1 = x;
fade_in_time = 5;
fade_in_samples = fade_in_time*fs;
fade_in_t = linspace(0,1,fade_in_samples)';
out1(1:fade_in_samples,:) = out1(1:fade_in_samples,:).*fade_in_t;
audiowrite("arlam_fade_in.wav",out1,fs);
subplot(3,1,2);
plot(out1), grid on;
title("Fade in");

%fade out
out2 = x;
fade_out_time = 10;
fade_out_samples = fade_out_time*fs;
fade_out_t = linspace(1,0,fade_out_samples)';
out2(end-fade_out_samples+1:end,:)=out2(end-fade_out_samples+1:end,:).*fade_out_t;
audiowrite("arlam_fade_out.wav",out2,fs);
subplot(3,1,3);
plot(out2), grid on;
title("Fade out");