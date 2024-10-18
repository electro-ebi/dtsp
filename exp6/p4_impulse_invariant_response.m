clc;
clear all;
close all;

% Filter specifications
N = 3;           % Filter order
wc = 0.95;       % Normalized cutoff frequency (0 < wc < 1)
T = 1;           % Sampling time
Fs = 1/T;        % Sampling frequency

% Analog Butterworth filter design
[Z, P, K] = buttap(N);   % Prototype Butterworth filter (analog)
P = P * wc;              % Scale poles by cutoff frequency
K = K * wc^N;            % Scale gain by cutoff frequency
B = real(poly(Z));       % Numerator polynomial coefficients
b = K * B;               % Scaled numerator coefficients
a = real(poly(P));       % Denominator polynomial coefficients

% Impulse Invariant Transformation (Analog to Digital)
[b, a] = impinvar(b, a, Fs);

% Frequency response of the digital filter
[H, w] = freqz(b, a);

% Plot frequency response
subplot(3, 1, 1);
plot(w/pi, abs(H));
title('Frequency Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

% Plot magnitude response
mag = abs(H);
subplot(3, 1, 2);
plot(w/pi, mag);
title('Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

% Plot phase response
phase = angle(H);
subplot(3, 1, 3);
plot(w/pi, phase);
title('Phase Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

