clear, clc, close all
load multi_signal.mat
subplot(4,1,1), plot(x), title('x')
[C,L] = wavedec(x,3,'db3');% многоуровневое одномерное вейвлет-разложение
cA3 = appcoef(C,L,'db3',3); % вычисляет аппроксимирующий коэффициент
                            % 2-ого уровня
A3 = wrcoef('a',C,L,'db3',3); % аппроксимирующий сигнал на втором уровне
% вычисление детализирующие коэффициенты
cD3 = detcoef(C,L,3);
cD2 = detcoef(C,L,2);
cD1 = detcoef(C,L,1);
% детализирующие сигналы
D1 = wrcoef('d',C,L,'db3',1);
D2 = wrcoef('d',C,L,'db3',2);
D3 = wrcoef('d',C,L,'db3',3);
subplot(5,1,2); plot(A3); title('Approximation A3')
subplot(5,1,5); plot(D1); title('Detail D1')
subplot(5,1,4); plot(D2); title('Detail D2')
subplot(5,1,3); plot(D3); title('Detail D3')
