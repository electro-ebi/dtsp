clc
clear all;
close all;
% Input sequences for linear convolution
x = [1 2 1 -1]; % Example sequence x
h = [1 2 3 1]; % Example sequence h
% Plotting the first sequence
figure;
subplot(2, 2, 1);
stem(x, 'filled'); % Using 'filled' for better visibility
xlabel('Time');
ylabel('Amplitude');
title('First Input Sequence');
% Plotting the second sequence
subplot(2, 2, 2);
stem(h, 'filled'); % Using 'filled' for better visibility
xlabel('Time');
ylabel('Amplitude');
title('Second Input Sequence');
% Linear convolution of the two sequences
x1 = conv(x, h);
% Displaying the convolution result in the command window
disp('Linear Convolution Output:');
disp(x1);
% Plotting the convolution result
subplot(2, 2, 3);
stem(x1, 'filled'); % Using 'filled' for better visibility
xlabel('Time');
ylabel('Amplitude');
title('Linear Convolution Output');
% Length of the sequences
N = max(length(x), length(h));
% Zero-padding to make the sequences of equal length
x = [x, zeros(1, N - length(x))];
h = [h, zeros(1, N - length(h))];
% Perform Circular Convolution using FFT and IFFT
X = fft(x); % FFT of sequence x
H = fft(h); % FFT of sequence h
Y = X .* H; % Point-wise multiplication in frequency domain
y = ifft(Y); % Inverse FFT to get the circular convolution result
% Display the result
disp('Circular Convolution result:');
disp(y);
% Plotting the circular convolution result
subplot(2, 2, 4);
stem(real(y), 'filled'); % Using 'filled' for better visibility
xlabel('Time');
ylabel('Amplitude');
title('Circular Convolution Output');
