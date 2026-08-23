%% MATH 346 MATLAB setup check
% Run this script on every computer that you plan to use for the course.
% A successful run ends with "MATLAB core check: PASS". Week 5 also needs
% the separate Symbolic Math Toolbox status to say PASS.

fprintf('MATH 346 MATLAB setup check\n');
fprintf('MATLAB: %s (%s)\n', version, version('-release'));

%% Core numerical work
x = (1:5)';
assert(isequal(size(x), [5 1]));
assert(abs(mean(x) - 3) < 1e-12);

%% CSV file round trip
temporary_csv = [tempname, '.csv'];
cleanup_csv = onCleanup(@() delete_if_present(temporary_csv));
original = table((1:3)', [12.5; 13.0; 14.5], ...
    'VariableNames', {'observation_id', 'value'});
writetable(original, temporary_csv);
reloaded = readtable(temporary_csv);
assert(isequal(reloaded.observation_id, original.observation_id));
assert(max(abs(reloaded.value - original.value)) < 1e-12);

%% Graphics
figure_handle = figure('Visible', 'off');
cleanup_figure = onCleanup(@() close_if_present(figure_handle));
plot(x, x.^2, 'o-');
xlabel('x');
ylabel('x^2');
title('MATH 346 setup check');
drawnow;

fprintf('MATLAB core check: PASS\n');

%% Week 5 symbolic capability
symbolic_information = ver('symbolic');
has_symbolic = ~isempty(symbolic_information) && ...
    license('test', 'Symbolic_Toolbox');

if has_symbolic
    syms z real
    derivative_check = simplify(diff(z^3, z) - 3*z^2);
    assert(isAlways(derivative_check == 0));
    fprintf('Symbolic Math Toolbox check: PASS (%s)\n', ...
        symbolic_information.Version);
else
    fprintf(2, ['Symbolic Math Toolbox check: ACTION REQUIRED. ', ...
        'Week 5 will not run on this computer.\n']);
end

fprintf(['Setup check complete. Keep this output if your instructor asks ', ...
    'for it.\n']);

function delete_if_present(filename)
if isfile(filename)
    delete(filename);
end
end

function close_if_present(handle)
if isgraphics(handle)
    close(handle);
end
end
