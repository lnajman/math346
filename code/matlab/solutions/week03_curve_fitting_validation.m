% MATH 346 - Week 3
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Compare polynomial fits with residual checks

clear; clc; close all;

x = [0 1 2 3 4 5 6 7 8 9 10];
y = [2.0 2.8 3.6 5.1 6.9 8.2 9.1 10.2 10.7 11.1 11.4];

degrees = [1 2 5];
x_fine = linspace(min(x), max(x), 300);

rmse_values = zeros(size(degrees));
residual_store = zeros(numel(degrees), numel(x));
legend_entries = {"data"};

figure;
plot(x, y, "o", "MarkerSize", 7, "LineWidth", 1.5);
hold on;

for k = 1:numel(degrees)
    degree = degrees(k);
    p = polyfit(x, y, degree);

    yhat = polyval(p, x);
    residuals = y - yhat;
    rmse_values(k) = sqrt(mean(residuals.^2));
    residual_store(k, :) = residuals;

    y_fine = polyval(p, x_fine);
    plot(x_fine, y_fine, "LineWidth", 1.5);
    legend_entries{end + 1} = sprintf("degree %d fit", degree);
end

hold off;
grid on;
xlabel("x");
ylabel("y");
title("Data and candidate polynomial fits");
legend(legend_entries, "Location", "best");

figure;
for k = 1:numel(degrees)
    subplot(numel(degrees), 1, k);
    stem(x, residual_store(k, :), "filled");
    hold on;
    plot([min(x), max(x)], [0, 0], "k-");
    hold off;
    grid on;
    xlabel("x");
    ylabel("residual");
    title(sprintf("Residuals for degree %d", degrees(k)));
end

rmse_table = table(degrees(:), rmse_values(:), ...
    'VariableNames', {'Degree', 'RMSE'});

disp(rmse_table);

fprintf("Smallest RMSE is not the only model-selection rule.\n");
fprintf("Use the residual plots and the purpose of the model too.\n");
