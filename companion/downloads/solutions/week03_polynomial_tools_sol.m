% MATH 346 - Week 3
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Polynomial utility commands and checks

clear; clc; close all;

roots_expected = [1 2 3];
p = poly(roots_expected);
roots_computed = roots(p);

disp("Coefficients built from roots 1, 2, and 3:");
disp(p);

disp("Roots recovered from the coefficient vector:");
disp(roots_computed.');

factor1 = [1 -1];
factor2 = [1 -2];
factor3 = [1 -3];
p_from_factors = conv(conv(factor1, factor2), factor3);

assert(norm(p - p_from_factors) < 1e-12);

dp = polyder(p);
slope_at_2 = polyval(dp, 2);

fprintf("Derivative coefficients:\n");
disp(dp);
fprintf("Derivative evaluated at x = 2: %.3f\n", slope_at_2);

x = linspace(0, 4, 200);
y = polyval(p, x);

figure;
plot(x, y, "LineWidth", 1.5);
hold on;
plot(roots_expected, zeros(size(roots_expected)), "o", "MarkerSize", 8);
grid on;
xlabel("x");
ylabel("p(x)");
title("Polynomial Built From Roots");
