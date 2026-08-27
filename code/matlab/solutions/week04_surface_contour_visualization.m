% MATH 346 - Week 4
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Surface and contour visualization checks

clear; clc; close all;

x = linspace(-3, 3, 121);
y = linspace(-3, 3, 121);
[X, Y] = meshgrid(x, y);

Z = sin(X).*cos(Y).*exp(-0.08*(X.^2 + Y.^2));

figure;
surf(X, Y, Z);
shading interp;
colorbar;
grid on;
xlabel("x");
ylabel("y");
zlabel("z");
title("Surface plot of z = sin(x) cos(y) exp(-0.08(x^2+y^2))");

figure;
contourf(X, Y, Z, 20);
colorbar;
axis equal tight;
xlabel("x");
ylabel("y");
title("Filled contour plot of the same surface");

[z_max, max_index] = max(Z(:));
[row, col] = ind2sub(size(Z), max_index);
x_max = X(row, col);
y_max = Y(row, col);

[z_min, min_index] = min(Z(:));
[row_min, col_min] = ind2sub(size(Z), min_index);
x_min = X(row_min, col_min);
y_min = Y(row_min, col_min);

fprintf("Approximate maximum: z = %.4f at x = %.3f, y = %.3f\n", ...
    z_max, x_max, y_max);
fprintf("Approximate minimum: z = %.4f at x = %.3f, y = %.3f\n", ...
    z_min, x_min, y_min);

fprintf("These locations depend on the grid spacing.\n");
