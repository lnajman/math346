% MATH 346 - Week 4
% Numerical roots, integration, and validation checks

clear; clc; close all;

f = @(x) x.*exp(-x) - 0.2;
x_grid = linspace(0, 6, 500);
y_grid = f(x_grid);

figure;
plot(x_grid, y_grid, "LineWidth", 1.5);
hold on;
plot([min(x_grid), max(x_grid)], [0, 0], "k-");
hold off;
grid on;
xlabel("x");
ylabel("f(x)");
title("Plot before root-finding");

[left_root, left_residual] = fzero(f, [0 1]);
[right_root, right_residual] = fzero(f, [1 5]);

Root = [left_root; right_root];
Residual = [left_residual; right_residual];
Bracket = {'[0, 1]'; '[1, 5]'};
disp(table(Bracket, Root, Residual));

fprintf("A root is credible only after checking f(root).\n\n");

g = @(x) sin(x)./(1 + x.^2);

area_function = integral(g, 0, 6);

x_coarse = linspace(0, 6, 13);
y_coarse = g(x_coarse);
area_trapz_coarse = trapz(x_coarse, y_coarse);

x_fine = linspace(0, 6, 201);
y_fine = g(x_fine);
area_trapz_fine = trapz(x_fine, y_fine);

Method = {'integral'; 'trapz, 13 points'; 'trapz, 201 points'};
Estimate = [area_function; area_trapz_coarse; area_trapz_fine];
DifferenceFromIntegral = Estimate - area_function;
disp(table(Method, Estimate, DifferenceFromIntegral));

figure;
plot(x_fine, g(x_fine), "LineWidth", 1.5);
hold on;
plot(x_coarse, y_coarse, "o", "MarkerSize", 6, "LineWidth", 1.2);
hold off;
grid on;
xlabel("x");
ylabel("g(x)");
title("Function values used for numerical integration");
legend("function", "coarse data", "Location", "best");

h = @(x) (x - 2).^2 + 0.5*sin(5*x);
[xmin, hmin] = fminbnd(h, 0, 4);
fprintf("Local minimum on [0, 4]: x = %.4f, h(x) = %.4f\n", xmin, hmin);
