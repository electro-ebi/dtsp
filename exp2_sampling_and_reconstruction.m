clc;
clear all;
close all;

% Generate 10 Hz sinusoidal signal of 0.1s duration sampled at 1000 Hz
fm = 1000;  % Frequency of the sinusoidal signal
t = 0:1/(fm*100):1/fm;  % Time vector with 1000 Hz sampling frequency
x = sin(2*pi*fm*t);

% Plot the original analog signal
figure;
subplot(1,1,1);
plot(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Analog Signal');

% Analog signal sampled at fs << 2*fm (Undersampling)
fs = 30;  % Sampling Frequency
n = 0:1/(fs*100):1/fm;  % Sample points
xn = sin(2*pi*fm*n);
figure;
subplot(2,1,1);
stem(n,xn);
xlabel('Time (s)');
ylabel('Amplitude');
title('Undersampled Signal (fs << 2*fm)');

% Reconstruct the undersampled signal

subplot(2,1,2);
plot(t,x, 'cyan');  % Plot original signal for comparison
hold on;
plot(n,xn, 'red');  % Plot reconstructed signal
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Undersampled Signal (fs << 2*fm)');
legend('Original', 'Reconstructed');

% Analog signal sampled at fs = 2*fm (Nyquist rate sampling)
fs = 2000;
n = 0:1/(fs*100):1/fm;
xn = sin(2*pi*fm*n);
figure;
subplot(2,1,1);
stem(n,xn);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sampled at Nyquist Rate (fs = 2*fm)');

% Reconstruct the Nyquist rate sampled signal

subplot(2,1,2);
plot(t,x, 'b');  % Plot original signal for comparison
hold on;
plot(n,xn, 'r');  % Plot reconstructed signal
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Nyquist Rate Signal (fs = 2*fm)');
legend('Original', 'Reconstructed');

% Analog signal sampled at fs >> 2*fm (Oversampling)
fs = 3000;
n = 0:1/(fs*100):1/fm;
xn = sin(2*pi*fm*n);
figure;
subplot(2,1,1);
stem(n,xn);
xlabel('Time (s)');
ylabel('Amplitude');
title('Oversampled Signal (fs >> 2*fm)');

% Reconstruct the oversampled signal

subplot(2,1,2);
plot(t,x, 'b');  % Plot original signal for comparison
hold on;
plot(n,xn, 'r');  % Plot reconstructed signal
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Oversampled Signal (fs >> 2*fm)');
legend('Original', 'Reconstructed');
