% MATH 346 - Week 3
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Compare polynomial fits with residual checks

clear; clc; close all;

x = linspace(-1, 1, 15);
y = [0.03 0.58 1.15 1.50 1.86 2.31 2.70 3.02 3.24 3.59 ...
     3.86 3.94 3.88 3.99 4.04];

degrees = [1 2 7];
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

%% Meeting 2: check on observations not used for fitting
fit_idx = 1:2:numel(x);
check_idx = 2:2:numel(x);

fit_rmse_values = zeros(size(degrees));
check_rmse_values = zeros(size(degrees));
legend_entries = {"fit observations", "check observations"};

figure;
plot(x(fit_idx), y(fit_idx), "o", "MarkerSize", 7, "LineWidth", 1.5);
hold on;
plot(x(check_idx), y(check_idx), "s", "MarkerSize", 7, "LineWidth", 1.5);

for k = 1:numel(degrees)
    degree = degrees(k);
    p = polyfit(x(fit_idx), y(fit_idx), degree);

    fit_predictions = polyval(p, x(fit_idx));
    check_predictions = polyval(p, x(check_idx));
    fit_rmse_values(k) = sqrt(mean((y(fit_idx) - fit_predictions).^2));
    check_rmse_values(k) = sqrt(mean((y(check_idx) - check_predictions).^2));

    plot(x_fine, polyval(p, x_fine), "LineWidth", 1.5);
    legend_entries{end + 1} = sprintf("degree %d fit", degree);
end

hold off;
grid on;
xlabel("x");
ylabel("y");
title("Candidate models fitted without the check observations");
legend(legend_entries, "Location", "best");

check_table = table(degrees(:), fit_rmse_values(:), check_rmse_values(:), ...
    'VariableNames', {'Degree', 'FitRMSE', 'CheckRMSE'});
disp(check_table);

[~, best_fit_index] = min(fit_rmse_values);
[~, best_check_index] = min(check_rmse_values);
fprintf("Smallest fit RMSE: degree %d.\n", degrees(best_fit_index));
fprintf("Smallest check RMSE: degree %d.\n", degrees(best_check_index));
fprintf("Check observations were not used to estimate any coefficients.\n");
