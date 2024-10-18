clc;
clear all;
close all;

% Specifications
t = 1; % Time period for normalization
wp = 2*pi/2; % Passband frequency (rad/s)
ws = 7*pi/2; % Stopband frequency (rad/s)
wp = wp / t; % Normalize passband frequency

% Ripple and attenuation factors
e = sqrt((1/(0.707)^2) - 1); % Ripple factor for passband (0.707 -> 3dB)
l = sqrt((1/(0.2)^2) - 1);   % Attenuation factor for stopband (0.2 -> -14dB)

% Filter order and cutoff frequency calculation
N = ceil((log10(l/e)) / log10(ws/wp) + 1); % Calculate filter order
wc = wp / (e)^(0.5/N); % Cutoff frequency
Fs = 1/t; % Sampling frequency

% Butterworth filter design (Analog)
[Z, P, K] = buttap(N); % Prototype Butterworth filter
P = P * wc; % Scale poles with cutoff frequency
K = K * wc^N; % Scale gain with cutoff frequency
B = real(poly(Z)); % Numerator polynomial
b = K * B; % Filter numerator coefficients
a = real(poly(P)); % Filter denominator coefficients

% Bilinear transformation (Digital filter design)
[b, a] = bilinear(b, a, Fs);

% Frequency response of the digital filter
[H, w] = freqz(b, a);

% Calculate Magnitude and Phase
mag = abs(H); % Magnitude of the frequency response
phase = angle(H); % Phase of the frequency response

% Plot Frequency, Magnitude, and Phase Response
subplot(3, 1, 1);
plot(w/pi, mag);
title('Frequency Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(3, 1, 2);
plot(w/pi, mag);
title('Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(3, 1, 3);
plot(w/pi, phase);
title('Phase Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;
