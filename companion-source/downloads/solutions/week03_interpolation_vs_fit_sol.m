% MATH 346 - Week 3
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Compare interpolation with polynomial fitting

clear; clc; close all;

x = [0 1 2 3 4 5 6 7 8];
y = [3.0 3.8 4.3 5.9 6.5 7.1 7.8 8.0 8.4];

x_query = [2.5 5.5];

y_linear = interp1(x, y, x_query, "linear");
y_pchip = interp1(x, y, x_query, "pchip");

p2 = polyfit(x, y, 2);
y_fit_query = polyval(p2, x_query);

for k = 1:numel(x_query)
    fprintf("x = %.1f: linear = %.3f, pchip = %.3f, degree 2 fit = %.3f\n", ...
        x_query(k), y_linear(k), y_pchip(k), y_fit_query(k));
end

x_fine = linspace(min(x), max(x), 300);
y_linear_curve = interp1(x, y, x_fine, "linear");
y_pchip_curve = interp1(x, y, x_fine, "pchip");
y_fit_curve = polyval(p2, x_fine);

figure;
plot(x, y, "o", "MarkerSize", 7, "LineWidth", 1.5);
hold on;
plot(x_fine, y_linear_curve, "LineWidth", 1.5);
plot(x_fine, y_pchip_curve, "LineWidth", 1.5);
plot(x_fine, y_fit_curve, "LineWidth", 1.5);
plot(x_query, y_linear, "s", "MarkerSize", 8, "LineWidth", 1.5);
hold off;
grid on;
xlabel("x");
ylabel("y");
title("Interpolation compared with a polynomial fit");
legend("data", "linear interpolation", "pchip interpolation", ...
    "degree 2 fit", "query points", "Location", "best");

fprintf("\nThe query points are inside the measured range.\n");
fprintf("For x-values outside this range, the question becomes extrapolation.\n");
