clc;
clear all;
close all;

% Time vector
t = 0:0.0025:1; 

% Original signal
x = sin(2*pi*5*t);

% Interpolation by a factor of 3
y = interp(x, 3);

% Plotting the original signal
subplot(1,2,1);
stem(x(1:120), 'filled');
axis([0 120 -2 2]);
title('Original Signal');

% Plotting the interpolated signal
subplot(1,2,2);
stem(y(1:360), 'filled');
axis([0 360 -2 2]);
title('Interpolated Signal');
