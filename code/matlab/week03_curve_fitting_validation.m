% MATH 346 - Week 3
% Curve fitting, interpolation, and residual checks

clear; clc; close all;

x = [0 1 2 3 4 5 6 7 8 9 10];
y = [2.0 2.8 3.6 5.1 6.9 8.2 9.1 10.2 10.7 11.1 11.4];

degree = 2;
p = polyfit(x, y, degree);
yhat = polyval(p, x);
residuals = y - yhat;

x_fine = linspace(min(x), max(x), 300);
y_fine = polyval(p, x_fine);

figure;
plot(x, y, "o", "MarkerSize", 7, "LineWidth", 1.5);
hold on;
plot(x_fine, y_fine, "LineWidth", 1.5);
hold off;
grid on;
xlabel("x");
ylabel("y");
title("Data and polynomial fit");
legend("data", "degree 2 fit", "Location", "best");

figure;
stem(x, residuals, "filled");
grid on;
xlabel("x");
ylabel("residual");
title("Residuals: observed - fitted");

rmse = sqrt(mean(residuals.^2));
fprintf("Degree %d RMSE: %.4f\n", degree, rmse);

