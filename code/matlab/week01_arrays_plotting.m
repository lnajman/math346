% MATH 346 - Week 1
% Arrays, scripts, and 2D plotting

clear; clc; close all;

x = linspace(0, 2*pi, 200);
y1 = sin(x);
y2 = cos(x);

figure;
plot(x, y1, "LineWidth", 1.5);
hold on;
plot(x, y2, "LineWidth", 1.5);
hold off;

xlabel("x");
ylabel("function value");
title("Sine and cosine on [0, 2pi]");
legend("sin(x)", "cos(x)", "Location", "best");
grid on;

identity_error = max(abs(y1.^2 + y2.^2 - 1));
fprintf("Maximum error in sin^2(x) + cos^2(x) = 1: %.3e\n", identity_error);

