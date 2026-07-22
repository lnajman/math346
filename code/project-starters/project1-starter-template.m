%% MATH 346 Project 1 starter: MATLAB numerical investigation
% Replace every TODO with working MATLAB code. Do not type calculated values
% into the results CSV; this script must generate them.

clear;
clc;
close all;

group_id = "group-XX";
data_file = "group-XX-matlab-data.csv";
assignment_file = "group-XX-project-1-assignment.csv";
results_file = "group-XX-project1-results.csv";

series_figure_file = "group-XX-project1-series.png";
fit_figure_file = "group-XX-project1-fit.png";
residual_figure_file = "group-XX-project1-residuals.png";

%% 1. Import and verify the assigned files

data = readtable(data_file);
assignment = readtable(assignment_file, TextType = "string");

required_columns = [
    "observation_id", "date", "outdoor_temp_c", "heating_energy_kwh"
];
assert(isequal(string(data.Properties.VariableNames), required_columns), ...
    "The assigned data columns do not match the project contract.");
assert(height(assignment) == 1, "The assignment file must contain one row.");
assert(assignment.group_id == group_id, ...
    "The assignment file does not match this group.");

n_rows_raw = height(data);
usable_mask = ~ismissing(data.outdoor_temp_c) & ...
    ~ismissing(data.heating_energy_kwh);
usable = data(usable_mask, :);
n_rows_usable = height(usable);

temperature = usable.outdoor_temp_c;
energy = usable.heating_energy_kwh;
assigned_prediction_temp_c = assignment.assigned_prediction_temp_c;

assert(n_rows_raw == 121, "Unexpected raw row count.");
assert(n_rows_usable == 120, "Unexpected usable row count.");
assert(assigned_prediction_temp_c >= min(temperature) && ...
    assigned_prediction_temp_c <= max(temperature), ...
    "The assigned prediction must be interpolation.");

%% 2. Complete and test model_rmse.m

% The exact value of this hand-checkable test is sqrt(1/3).
rmse_test = model_rmse([1, 2, 3], [1, 2, 4]);
assert(abs(rmse_test - sqrt(1/3)) < 1e-12, ...
    "model_rmse.m did not pass the simple vector test.");

%% 3. Summaries and figures

% TODO: Calculate the two complete-case means.
mean_outdoor_temp_c = NaN;
mean_heating_energy_kwh = NaN;

% TODO: Create and save the required time/order figure.
% exportgraphics(gcf, series_figure_file, Resolution = 180);

% TODO: Create and save a labeled heating-versus-temperature figure.
% The fitted curves will be added after Section 4.

%% 4. Linear and quadratic fits

% polyfit returns coefficients in descending powers. Store the final result
% fields in mathematical order: intercept, temperature, temperature squared.
% TODO: Fit both models, calculate fitted values, residuals, RMSE, and R^2.

linear_intercept = NaN;
linear_temp_coefficient = NaN;
linear_fitted = NaN(size(energy));
linear_rmse_kwh = NaN;
linear_r_squared = NaN;

quadratic_intercept = NaN;
quadratic_temp_coefficient = NaN;
quadratic_temp2_coefficient = NaN;
quadratic_fitted = NaN(size(energy));
quadratic_rmse_kwh = NaN;
quadratic_r_squared = NaN;

% TODO: Finish and save the fitted-curve figure.
% exportgraphics(gcf, fit_figure_file, Resolution = 180);

% TODO: Create and save a labeled quadratic-residual figure with a zero line.
% exportgraphics(gcf, residual_figure_file, Resolution = 180);

%% 5. Assigned prediction and fixed sensitivity check

% TODO: Predict with the quadratic fit at assigned_prediction_temp_c.
assigned_prediction_kwh = NaN;

% TODO: Find the largest absolute quadratic residual, record its observation
% identifier, remove only that row, refit the quadratic model, and repeat the
% assigned prediction.
sensitivity_removed_observation_id = "TODO";
sensitivity_prediction_kwh = NaN;

%% 6. Validate and write the fixed one-row result contract

numeric_results = [
    n_rows_raw, n_rows_usable, mean_outdoor_temp_c, ...
    mean_heating_energy_kwh, linear_intercept, ...
    linear_temp_coefficient, linear_rmse_kwh, linear_r_squared, ...
    quadratic_intercept, quadratic_temp_coefficient, ...
    quadratic_temp2_coefficient, quadratic_rmse_kwh, ...
    quadratic_r_squared, assigned_prediction_temp_c, ...
    assigned_prediction_kwh, sensitivity_prediction_kwh
];
assert(all(isfinite(numeric_results)), ...
    "Complete every numerical TODO before writing the result file.");
assert(sensitivity_removed_observation_id ~= "TODO", ...
    "Record the sensitivity observation identifier.");

results = table( ...
    group_id, n_rows_raw, n_rows_usable, mean_outdoor_temp_c, ...
    mean_heating_energy_kwh, linear_intercept, ...
    linear_temp_coefficient, linear_rmse_kwh, linear_r_squared, ...
    quadratic_intercept, quadratic_temp_coefficient, ...
    quadratic_temp2_coefficient, quadratic_rmse_kwh, ...
    quadratic_r_squared, assigned_prediction_temp_c, ...
    assigned_prediction_kwh, sensitivity_removed_observation_id, ...
    sensitivity_prediction_kwh ...
);
writetable(results, results_file);

required_outputs = [
    results_file, series_figure_file, fit_figure_file, residual_figure_file
];
for output_file = required_outputs
    assert(isfile(output_file), "Missing generated output: %s", output_file);
end

disp(results);
fprintf("Project 1 outputs written for %s.\n", group_id);
