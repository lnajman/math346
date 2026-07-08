% MATH 346 - Week 2
% Functions, vectorized formulas, and basic tests

clear; clc;

values = [-2, -1, 0, 1, 2];
outputs = quadratic_value(1, 0, -1, values);

disp(table(values.', outputs.', 'VariableNames', ["x", "x_squared_minus_1"]));

expected_at_zero = -1;
actual_at_zero = quadratic_value(1, 0, -1, 0);

assert_close(actual_at_zero, expected_at_zero, "quadratic at x = 0");

assert_close(quadratic_value(1, 0, -1, 1), 0, "quadratic at x = 1");
assert_close(quadratic_value(1, 0, -1, -1), 0, "quadratic at x = -1");
assert_close(quadratic_value(0, 2, 3, [0 1 2]), [3 5 7], "linear vector case");

disp("All Week 2 function tests passed.");

function y = quadratic_value(a, b, c, x)
    y = a .* x.^2 + b .* x + c;
end

function assert_close(actual, expected, test_name)
    tolerance = 1e-12;
    if max(abs(actual - expected), [], "all") > tolerance
        error("Test failed: %s", test_name);
    else
        fprintf("Test passed: %s\n", test_name);
    end
end

