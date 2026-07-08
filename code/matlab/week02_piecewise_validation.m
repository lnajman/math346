% MATH 346 - Week 2
% Piecewise rules and boundary tests

clear; clc;

test_ages = [0 5 6 17 18 64 65];
expected_prices = [0 0 20 20 35 35 25];
actual_prices = arrayfun(@ticket_price, test_ages);

disp(table(test_ages.', actual_prices.', expected_prices.', ...
    'VariableNames', ["age", "actual_price", "expected_price"]));

assert(isequal(actual_prices, expected_prices), "Boundary price test failed.");
disp("Boundary price tests passed.");

negative_age_rejected = false;
try
    ticket_price(-1);
catch
    negative_age_rejected = true;
end
assert(negative_age_rejected, "Negative age test failed: function should reject -1.");
disp("Negative age test passed.");

function price = ticket_price(age)
    if age < 0
        error("Age must be nonnegative.");
    elseif age <= 5
        price = 0;
    elseif age <= 17
        price = 20;
    elseif age <= 64
        price = 35;
    else
        price = 25;
    end
end
