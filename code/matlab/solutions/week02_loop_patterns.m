% MATH 346 - Week 2
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Loop patterns, accumulators, and vectorization checks

clear; clc; close all;

values = [1 2 3 4 5];

% Pattern 1: for loop with preallocation
squares_loop = zeros(size(values));

for k = 1:numel(values)
    squares_loop(k) = values(k)^2;
end

squares_vectorized = values.^2;
assert(isequal(squares_loop, squares_vectorized));

disp("Squares computed with a loop:");
disp(squares_loop);
disp("Squares computed with vectorized MATLAB:");
disp(squares_vectorized);

% Pattern 2: accumulator
total = 0;

for k = 1:numel(values)
    total = total + values(k);
end

assert(total == sum(values));
fprintf("Accumulator total: %d\n", total);

% Pattern 3: while loop with a guard
target = 100;
sum_of_squares = 0;
n = 0;
max_steps = 1000;

while sum_of_squares < target && n < max_steps
    n = n + 1;
    sum_of_squares = sum_of_squares + n^2;
end

if n == max_steps && sum_of_squares < target
    error("The while loop reached max_steps before the target.");
end

fprintf("Smallest n with 1^2 + ... + n^2 >= %d is %d.\n", target, n);
fprintf("Final sum: %d\n", sum_of_squares);

% Reflection questions:
% 1. Which loop has a known number of repetitions?
% 2. Which loop stops because a condition changes?
% 3. Which calculation is clearer without a loop?
