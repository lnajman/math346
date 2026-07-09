function validate_matlab_scripts
%VALIDATE_MATLAB_SCRIPTS Run course MATLAB scripts with expected outcomes.

repoRoot = fileparts(fileparts(mfilename('fullpath')));
cd(repoRoot);
set(0, 'DefaultFigureVisible', 'off');

mustPass = {
    'code/matlab/week01_arrays_plotting.m'
    'code/matlab/week01_matrix_systems.m'
    'code/matlab/week01_temperature_matrix.m'
    'code/matlab/week02_function_tests.m'
    'code/matlab/week02_piecewise_validation.m'
    'code/matlab/week02_loop_patterns.m'
    'code/matlab/week02_logical_indexing_switch.m'
    'code/matlab/week03_curve_fitting_validation.m'
    'code/matlab/week03_polynomial_tools.m'
    'code/matlab/week03_interpolation_vs_fit.m'
    'code/matlab/week04_root_integration_checks.m'
    'code/matlab/week04_ode_solver_check.m'
    'code/matlab/week04_surface_contour_visualization.m'
};

aiMustRun = {
    'code/matlab/week01_ai_plot_review.m'
    'code/matlab/week03_ai_overfit_review.m'
    'code/matlab/week04_ai_numeric_review.m'
};

expectedFailures = {
    'code/matlab/week02_ai_function_review.m', 'Incorrect dimensions'
};

failures = {};

fprintf('MATLAB executable starter scripts\n');
for k = 1:numel(mustPass)
    file = mustPass{k};
    [ok, report] = runOne(file);
    if ok
        fprintf('PASS %s\n', file);
    else
        fprintf(2, 'FAIL %s\n', file);
        failures{end + 1} = sprintf('%s failed:\n%s', file, report); %#ok<AGROW>
    end
end

fprintf('\nMATLAB AI critique scripts expected to run\n');
for k = 1:numel(aiMustRun)
    file = aiMustRun{k};
    [ok, report] = runOne(file);
    if ok
        fprintf('PASS %s\n', file);
    else
        fprintf(2, 'FAIL %s\n', file);
        failures{end + 1} = sprintf('%s failed:\n%s', file, report); %#ok<AGROW>
    end
end

fprintf('\nMATLAB AI critique scripts expected to fail\n');
for k = 1:size(expectedFailures, 1)
    file = expectedFailures{k, 1};
    expectedText = expectedFailures{k, 2};
    [ok, report] = runOne(file);
    if ok
        fprintf(2, 'FAIL %s\n', file);
        failures{end + 1} = sprintf('%s was expected to fail but ran successfully.', file); %#ok<AGROW>
    elseif contains(report, expectedText)
        fprintf('EXPECTED FAIL %s\n', file);
    else
        fprintf(2, 'FAIL %s\n', file);
        failures{end + 1} = sprintf('%s failed, but not with the expected message:\n%s', file, report); %#ok<AGROW>
    end
end

if ~isempty(failures)
    fprintf(2, '\nMATLAB validation failures:\n');
    for k = 1:numel(failures)
        fprintf(2, '\n%s\n', failures{k});
    end
    error('MATH346:ValidationFailed', '%d MATLAB validation check(s) failed.', numel(failures));
end

fprintf('\nMATLAB validation: ok\n');
end

function [ok, report] = runOne(file)
fprintf('\nRUN %s\n', file);
escapedFile = strrep(file, '''', '''''');
command = sprintf(['clear; clc; close all; ' ...
    'set(0,''DefaultFigureVisible'',''off''); ' ...
    'run(''%s''); close all;'], escapedFile);

try
    evalin('base', command);
    ok = true;
    report = '';
catch ME
    ok = false;
    report = getReport(ME, 'extended', 'hyperlinks', 'off');
end
end
