fs = 32000;
ts = 0: 1/fs : 0.005 - 1/fs;
N = length(ts);

subplot(3,2,1);
x1 = sin(2*pi*8000*ts)+0.075*sin(2*pi*9700*ts);
X1 = abs(fft(x1));
stem(X1), grid on

subplot(3,2,3);
x2 = sin(2*pi*8500*ts)+0.075*sin(2*pi*9700*ts);
X2 = abs(fft(x2));
stem(X2), grid on

subplot(3,2,5);
x3 = sin(2*pi*8750*ts)+0.075*sin(2*pi*9700*ts);
X3 = abs(fft(x3));
stem(X3), grid on

% windows "fix"
h = hanning(N)';

subplot(3,2,2);
x1w = x1.*h;
X1w = abs(fft(x1w));
stem(X1w), grid on

subplot(3,2,4);
x2w = x2.*h;
X2w = abs(fft(x2w));
stem(X2w), grid on

subplot(3,2,6);
x3w = x3.*h;
X3w = abs(fft(x3w));
stem(X3w), grid on

% TODO
% Windows
% Zero Add
% Extend Periods
% Pink noise filter
% 3D ебала