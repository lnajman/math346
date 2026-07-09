% MATH 346 - Week 1
% Matrix operations and linear-system checks

clear; clc; close all;

A = [2 1; 1 3];
b = [1; 2];

x = A\b;
residual = A*x - b;

disp("Solution of A*x = b:");
disp(table((1:numel(x)).', x, 'VariableNames', {'Index', 'SolutionValue'}));
fprintf("Residual norm: %.3e\n\n", norm(residual));

B = [1 2; 3 4];
C = [10 20; 30 40];

matrix_product = B*C;
elementwise_product = B.*C;

disp("Matrix product B*C:");
disp(matrix_product);

disp("Elementwise product B.*C:");
disp(elementwise_product);

row = B(1, :);
column = B(:, 2);

fprintf("First row of B has %d entries.\n", numel(row));
fprintf("Second column of B has %d entries.\n", numel(column));

identity_matrix = eye(2);
fprintf("Check eye(2)*B equals B: %d\n", isequal(identity_matrix*B, B));
