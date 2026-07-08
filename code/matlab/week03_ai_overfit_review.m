% MATH 346 - Week 3
% AI overfitting critique starter
%
% This script intentionally imitates plausible but weak generated code.
% Your job is to review the modeling claim before trusting it.

clear; clc; close all;

x = [0 1 2 3 4 5 6 7 8 9 10];
y = [2.0 2.8 3.6 5.1 6.9 8.2 9.1 10.2 10.7 11.1 11.4];

degree = length(x) - 1;
p = polyfit(x, y, degree);

x_plot = linspace(min(x) - 2, max(x) + 2, 500);
y_plot = polyval(p, x_plot);

figure;
plot(x, y, "o", "MarkerSize", 7, "LineWidth", 1.5);
hold on;
plot(x_plot, y_plot, "LineWidth", 1.5);
hold off;
grid on;
xlabel("x");
ylabel("y");
title("AI-style high-degree polynomial model");
legend("data", "high-degree polynomial", "Location", "best");

x_future = 12;
y_future = polyval(p, x_future);

fprintf("Generated-code claim:\n");
fprintf("The best polynomial predicts y = %.3f when x = %.1f.\n", ...
    y_future, x_future);

% Review questions:
% 1. Is this interpolation, curve fitting, or extrapolation?
% 2. What degree did the code choose, and why?
% 3. Does the plot justify the word "best"?
% 4. Add residuals and compare this model with degree 2.
