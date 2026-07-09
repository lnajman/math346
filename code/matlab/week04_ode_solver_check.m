% MATH 346 - Week 4
% ODE solver pattern and initial-condition checks

clear; clc; close all;

f = @(t, y) -y + sin(t);
tspan = [0 10];
y0 = 1;

[t, y] = ode45(f, tspan, y0);

initial_error = abs(y(1) - y0);
fprintf("Initial condition error: %.3e\n", initial_error);
assert(initial_error < 1e-12);

figure;
plot(t, y, "o-", "LineWidth", 1.2);
grid on;
xlabel("t");
ylabel("y(t)");
title("ODE45 Solution For y' = -y + sin(t)");

t_requested = linspace(0, 10, 21);
[t_grid, y_grid] = ode45(f, t_requested, y0);

figure;
plot(t, y, "o", "MarkerSize", 5);
hold on;
plot(t_grid, y_grid, "-", "LineWidth", 1.5);
hold off;
grid on;
xlabel("t");
ylabel("y(t)");
title("ODE45 Output Times");
legend("automatic output", "requested output grid", "Location", "best");

fprintf("Final value with automatic output: %.4f\n", y(end));
fprintf("Final value with requested output grid: %.4f\n", y_grid(end));
fprintf("Requested output times do not directly set the solver's internal step size.\n");
