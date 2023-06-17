clear, clc, close all
fs = 10000;
ts = 0: 1/fs: 0.2 - 1/fs;
N = length(ts);
fc = 1000;
M =16;
Ndata = 50;
bit_size = N / Ndata;
data = randi([0 M-1], Ndata, 1);
qdata = qammod(data, M);
scatterplot(qdata), grid on

qmod = repelem(qdata, bit_size).';
i = real((qmod).*cos(2*pi*fc*ts));
q = imag((qmod).*sin(2*pi*fc*ts));
y = i + q;
rng shuffle;
y = y + (rand(1,N)*0.2-0.1);
figure
subplot(3,1,1)
plot(i), grid on
subplot(3,1,2)
plot(q), grid on
subplot(3,1,3)
plot(y), grid on

idem = 2*y.*cos(2*pi*fc*ts);
qdem = 2*y.*sin(2*pi*fc*ts);

figure

subplot(2,1,1)
plot(idem), grid on
subplot(2,1,2)
plot(qdem), grid on


fltr = qam_filter;

idemf =  round(conv(fltr.Numerator, idem));
qdemf = round(conv(fltr.Numerator, qdem));

figure

subplot(2,1,1)
plot(idemf), grid on
subplot(2,1,2)
plot(qdemf), grid on

demod = complex(idemf, qdemf);

fir_delay = round(length(fltr.Numerator)/2);
demod_data = demod(fir_delay+round(bit_size/2):bit_size:length(demod)-fir_delay);
y = qamdemod(demod_data, M);
figure;
plot(data), grid on, hold on
plot(y, 'xr', 'LineWidth',5)

