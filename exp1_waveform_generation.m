clc;
close all;
clear all;

% Length of the sequence
N = 5;

% Unit Step Function
t = (0:N-1);
y = ones(1, N);
subplot(2, 3, 1);
plot(t, y); % Using stem for discrete plots
xlabel('Time (samples)');
ylabel('Amplitude');
title('Step Function');


% Unit Impulse Function
t = [-2,-1,-0.001,0,0.001,1,2];
y = [0,0, 0, 1, 0, 0,0];
subplot(2, 3, 2);
plot(t, y); % Using stem for discrete plots
xlabel('Time (samples)');
ylabel('Amplitude');
title('Impulse Function');

% Ramp Signal
t = (0:N-1);
y = t;
subplot(2, 3, 3);
plot(t, y); % Using stem for discrete plots
xlabel('Time (samples)');
ylabel('Amplitude');
title('Ramp Function');

% Sine Function
f = 10; % Signal frequency
%t = 0:1/(100*f):1/f; % Time vector from 0 to one period of the signal with a finer resolution
t= 0:1/(10*f):1/f;  %for discrete
y = sin(2 * pi * f * t); % Sine wave

subplot(2, 3, 4);
plot(t, y); % Using plot for continuous appearance
xlabel('Time (seconds)'); % Time in seconds
ylabel('Amplitude');
title('Sine Function');

% Square Function
t = 0:0.1:2*N;% for discrete
%t=0:0.5:2*N;
y = square(t);
subplot(2, 3, 5);
plot(t, y); % Using stem for discrete plots
xlabel('Time (samples)');
ylabel('Amplitude');
title('Square Function');

% Exponential Function
t = 0:0.2:N;
a = 1;
y = exp(a * t);
subplot(2, 3, 6);
plot(t, y); % Using stem for discrete plots
xlabel('Time (samples)');
ylabel('Amplitude');
title('Exponential Function');

x = linspace(-5,5);
y = sinc(x);
figure
plot(x,y)

% Sinc Function
t = -10:0.1:10; % Time vector
%t = -10:0.3:10; % Time vector for discrete
y = sinc(t); % Sinc function in MATLAB, sinc(t) = sin(pi*t)/(pi*t)

 % Assuming you are placing this in the fifth subplot
plot(t, y); % Using plot for continuous appearance
xlabel('Time');
ylabel('Amplitude');
title('Sinc Function');

grid