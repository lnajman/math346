% MATH 346 - Week 2
% Simple function and basic tests

clear; clc;

values = [-2, -1, 0, 1, 2];
outputs = quadratic_value(1, 0, -1, values);

disp(table(values.', outputs.', 'VariableNames', ["x", "x_squared_minus_1"]));

expected_at_zero = -1;
actual_at_zero = quadratic_value(1, 0, -1, 0);

if actual_at_zero == expected_at_zero
    disp("Test passed at x = 0.");
else
    error("Test failed at x = 0.");
end

function y = quadratic_value(a, b, c, x)
    y = a .* x.^2 + b .* x + c;
end

