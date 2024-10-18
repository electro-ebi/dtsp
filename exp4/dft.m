clc; % Clear command window
close all; % Close all figure windows
clear all; % Remove all variables, globals, functions, and MEX links

% Prompt user for input sequence and DFT length
x =[1 2 3 4 5 6]; 
N = 6;

% Determine the length of the input sequence
xlen = length(x);

% Zero-pad or truncate the sequence to match the desired DFT length
if N > xlen
    x = [x zeros(1, N - xlen)]; % Zero-pad
elseif N < xlen
    x = x(1:N); % Truncate
end

% Create vectors for DFT computation
n = 0:(N-1);
k = 0:(N-1);
nk = n' * k;
W = exp(-i * 2 * pi / N) .^ nk; % Construct DFT matrix

% Compute DFT using matrix multiplication
X = x * W;

% Display DFT result in command window
disp(X);

% Plot magnitude spectrum
subplot(2,1,1);
mag = abs(X);
stem(k, mag, 'filled'); % Use 'filled' for better visibility
title('Magnitude Spectrum');
xlabel('Discrete frequency');
ylabel('Amplitude');
grid on;

% Plot phase spectrum
subplot(2,1,2);
theta = angle(X);
stem(k, theta, 'filled'); % Use 'filled' for better visibility
title('Phase Spectrum');
xlabel('Discrete frequency');
ylabel('Phase Angle');
grid on;

