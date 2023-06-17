function Hd = bpf
%BPF Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.13 and DSP System Toolbox 9.15.
% Generated on: 21-Apr-2023 15:13:30

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 20000;  % Sampling Frequency

Fstop1 = 3000;            % First Stopband Frequency
Fpass1 = 4500;            % First Passband Frequency
Fpass2 = 6500;            % Second Passband Frequency
Fstop2 = 8000;            % Second Stopband Frequency
Dstop1 = 0.0001;          % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.0001;          % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]