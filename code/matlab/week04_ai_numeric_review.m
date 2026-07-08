% MATH 346 - Week 4
% AI numerical answer critique starter
%
% This script intentionally imitates plausible but incomplete generated code.
% Your job is to add checks before trusting the printed answer.

clear; clc; close all;

f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

x0 = 0;
root = fzero(f, x0);

fprintf("Generated-code claim:\n");
fprintf("The solution is x = %.4f.\n", root);

% Review questions:
% 1. What initial guess was used?
% 2. Does this prove there is only one solution?
% 3. What is f(root)?
% 4. What does the plot on [0, 4] show?
% 5. Which brackets would find all visible roots?
