% MATH 346 - Week 2
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Logical indexing and switch patterns

clear; clc; close all;

temperatures = [18 21 25 29 34 31 22];

hot_mask = temperatures >= 30;
hot_values = temperatures(hot_mask);

fprintf("Number of hot days: %d\n", nnz(hot_mask));
disp("Hot temperatures:");
disp(hot_values);

adjusted = temperatures;
adjusted(hot_mask) = 30;

disp(table(temperatures.', hot_mask.', adjusted.', ...
    'VariableNames', {'Original', 'IsHot', 'Capped'}));

unit = "F";
value = 77;

switch unit
    case "C"
        celsius = value;
    case "F"
        celsius = (value - 32) * 5/9;
    otherwise
        error("Unknown unit.");
end

fprintf("%.1f %s is %.2f C\n", value, unit, celsius);
