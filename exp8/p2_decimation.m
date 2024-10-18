clc;
clear all;
close all;

% Time vector
t = 0:0.0025:1; 

% Original signal
x = sin(2*pi*5*t);

% Decimation by a factor of 3
y = decimate(x, 3);

% Plotting the original signal
subplot(1,2,1);
stem(x(1:120), 'filled');
axis([0 120 -2 2]);
title('Original Signal');

% Plotting the decimated signal
subplot(1,2,2);
stem(y(1:40), 'filled');
axis([0 40 -2 2]);
title('Decimated Signal');
