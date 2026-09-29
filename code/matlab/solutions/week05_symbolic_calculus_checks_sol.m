% MATH 346 - Week 5
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Symbolic differentiation, integration, and independent checks

clear; clc; close all;

syms x real

f = x^2 * exp(-x);
df = diff(f, x);
F = int(f, x);

derivative_check = simplify(diff(F, x) - f);
assert(isAlways(derivative_check == 0));

area_exact = int(f, x, 0, 4);
area_decimal = vpa(area_exact, 12);

f_numeric = @(x) x.^2 .* exp(-x);
area_numeric = integral(f_numeric, 0, 4);
area_difference = abs(double(area_exact) - area_numeric);
assert(area_difference < 1e-10);

x_value = sym(2);
slope_exact = simplify(subs(df, x, x_value));
slope_decimal = double(slope_exact);

disp("Function:");
disp(f);
disp("Derivative:");
disp(df);
disp("One antiderivative (without an arbitrary constant):");
disp(F);
disp("Exact integral from 0 to 4:");
disp(area_exact);

fprintf("Integral, 12 significant digits: %s\n", char(area_decimal));
fprintf("Independent numerical integral: %.12f\n", area_numeric);
fprintf("Absolute difference: %.3e\n", area_difference);
fprintf("Exact slope at x = 2: %s\n", char(slope_exact));
fprintf("Decimal slope at x = 2: %.12f\n", slope_decimal);

f_handle = matlabFunction(f, 'Vars', x);
x_grid = linspace(0, 6, 300);

figure;
plot(x_grid, f_handle(x_grid), "LineWidth", 1.5);
grid on;
xlabel("x");
ylabel("f(x)");
title("Symbolic Expression Converted To A Numerical Function");
