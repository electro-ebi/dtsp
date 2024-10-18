clc; % Clear the command window
close all; % Close all figure windows
clear all; % Clear all variables from the workspace

% Define the sequence in the frequency domain
X = [21, -3 + 5.1962i, -3 + 1.7321i, -3, -3 - 1.7321i, -3 - 5.1962i]; 
N = 6; % Length of the IDFT

xlen = length(X); % Length of the input sequence X(K)
if N > xlen
    % If N is greater than the length of X(K), zero-pad X to length N
    X = [X zeros(1, N - xlen)];
elseif N < xlen
    % If N is less than the length of X(K), truncate X to length N
    X = X(1:N);
end

% Create vectors for n and k
n = 0:(N-1); % Time index
k = 0:(N-1); % Frequency index

% Create the matrix of nk products (outer product of n and k)
nk = n' * k;

% Construct the IDFT matrix W using the formula W = exp(i * 2 * pi / N) .^ nk
W = exp(i * 2 * pi / N) .^ nk;

% Compute the IDFT by multiplying X with W and normalizing by 1/N
x = (1 / N) * (X * W);

% Display the IDFT result in the command window
disp('The IDFT of given X(K):');
disp(x);

% Plot the Magnitude Spectrum
subplot(2,1,1); % Create a subplot for the magnitude spectrum
mag = abs(x); % Compute the magnitude of the IDFT result
stem(k, mag); % Plot the magnitude spectrum using discrete points
title('Magnitude Spectrum'); % Title of the plot
xlabel('No. of Sample'); % X-axis label
ylabel('Amplitude'); % Y-axis label
grid on; % Enable grid for better visualization

% Plot the Phase Spectrum
subplot(2,1,2); % Create a subplot for the phase spectrum
theta = angle(x); % Compute the phase angle of the IDFT result
stem(k, theta); % Plot the phase spectrum using discrete points
title('Phase Spectrum'); % Title of the plot
xlabel('No. of Sample'); % X-axis label
ylabel('Phase Angle'); % Y-axis label
grid on; % Enable grid for better visualization
