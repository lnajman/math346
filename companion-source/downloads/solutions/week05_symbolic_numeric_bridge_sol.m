% MATH 346 - Week 5
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Exact inputs, assumptions, vpa, vpasolve, and residual checks

clear; clc; close all;

exact_one_third = sym(1) / 3;
decimal_one_third = sym("0.3333333333333333");
input_difference = simplify(exact_one_third - decimal_one_third);

disp("Exact one third:");
disp(exact_one_third);
disp("Finite decimal entered symbolically:");
disp(decimal_one_third);
disp("Their exact difference:");
disp(input_difference);
assert(~isAlways(input_difference == 0));

syms x real
root_exact = solve(x^3 == 2, x);
root_decimal = vpa(root_exact, 16);
exact_residual = simplify(root_exact^3 - 2);
assert(isAlways(exact_residual == 0));

root_vpasolve = vpasolve(x^3 == 2, x, [1 2]);
numeric_residual = abs(double(root_vpasolve)^3 - 2);
assert(numeric_residual < 1e-12);

syms y
all_solutions = solve(y^2 == 9, y);

syms y_positive positive
positive_solution = solve(y_positive^2 == 9, y_positive);
assert(numel(all_solutions) == 2);
assert(isAlways(positive_solution == 3));

fprintf("Exact real cube root of 2: %s\n", char(root_exact));
fprintf("Decimal approximation: %s\n", char(root_decimal));
fprintf("vpasolve residual: %.3e\n", numeric_residual);
fprintf("Solutions of y^2 = 9 without a positivity assumption:\n");
disp(all_solutions);
fprintf("Solution when y is assumed positive: %s\n", char(positive_solution));
