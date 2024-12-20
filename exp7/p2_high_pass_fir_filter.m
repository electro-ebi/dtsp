clear all; 
close all; 
clc;

% Filter and Window Parameters
N = 11; % Window length
Rw = boxcar(N); % Rectangular window (Boxcar)

% FIR Filter Design (High-Pass Filter)
b = fir1(10, 0.08, 'high', Rw); % High-pass FIR filter design using Rectangular window

% Display Window Coefficients
disp('Window Coefficient = ');
disp(Rw);

% Frequency Response of the FIR Filter
[h, f] = freqz(b, 1, 512); % Frequency response of the filter
mag = 20*log10(abs(h)); % Magnitude response in dB
phase = angle(h); % Phase response

% Plot Window Coefficient
n = 0:N-1;
figure();
stem(n, Rw, 'm', 'fill', 'LineWidth', 1.5); 
grid on;
xlabel('Time index ------>');
ylabel('Magnitude ------>');
title('Rectangular Window');
axis([-1 N+1 -0.05 1.05]);

% Magnitude Response
figure();
subplot(2,1,1);
plot(f/pi, mag, 'r', 'LineWidth', 1.5); 
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample) ------>');
ylabel('Gain (dB) ------>');
title('Magnitude Response');

% Phase Response
subplot(2,1,2);
plot(f/pi, phase, 'b', 'LineWidth', 1.5); 
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample) ------>');
ylabel('Phase (Radians) ------>');
title('Phase Response');
