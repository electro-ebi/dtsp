clc;
clear all;
close all;

% Linear System
% Generate input signals
x1 =[3 2 5];
x2 =[1 2 3];

% Ensure the input signals are of the same length
if length(x1) ~= length(x2)
    error('The two input signals must have the same length.');
end

% System operation: y(n) = 2x(n)
y1 = 2 * x1;
y2 = 2 * x2;

% Coefficients for the linear combination
a = 3;
b = 5;

% Check superposition
lhs = 2 * (a * x1 + b * x2); % Left-hand side of the superposition principle
rhs = a * y1 + b * y2; % Right-hand side of the superposition principle

% Determine linearity
if isequal(lhs, rhs)
    disp('The given system is LINEAR.');
else
    disp('The given system is NONLINEAR.');
end

% Plotting the results
subplot(3, 1, 1);
stem(lhs, 'b', 'LineWidth', 2);
title('LHS Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(3, 1, 2);
stem(rhs, 'r', 'LineWidth', 2);
title('RHS Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(3, 1, 3);
stem(lhs - rhs, 'g', 'LineWidth', 2);
title('Difference between LHS and RHS');
xlabel('Time');
ylabel('Difference');
grid on;






% Input the shift value k
k = 4;

% Define input signal
x = [1 2 3 4]
n = 0:length(x)-1;

% System operation: y(n) = x(n)^2
y_original = x.^2;

% Step 1: Output for shifted input
% Shifted input: Circular shift by k
x_shifted = circshift(x, [0 k]);
y_shifted_input = x_shifted.^2;

% Step 2: Shifted output sequence
% Shift the original output by k
y_shifted_output = circshift(y_original, [0 k]);

% Display the results
disp('y_shifted_input:');
disp(y_shifted_input);

disp('y_shifted_output:');
disp(y_shifted_output);

% Determine and display if the system is time-invariant or not
if isequal(y_shifted_input, y_shifted_output)
    disp('The given system is TIME-INVARIANT.');
else
    disp('The given system is TIME-VARIANT.');
end

% Plotting the results
figure()
subplot(2,1,1);
stem(n, y_shifted_input, 'r', 'LineWidth', 1.5);
xlabel('Time');
ylabel('Amplitude');
title('Output due to Shift in Input Signal');
grid on;

subplot(2,1,2);
stem(n, y_shifted_output, 'b', 'LineWidth', 1.5);
xlabel('Time');
ylabel('Amplitude');
title('Shifted Output Signal');
grid on;
