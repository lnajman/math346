% MATH 346 - Week 2
% AI function review example
%
% This script is intentionally plausible but weak. Run it, critique it,
% and then repair the local function.

clear; clc;

r_scalar = 2;
area_scalar = circle_area_ai(r_scalar);
fprintf("Area for radius %.1f: %.4f\n", r_scalar, area_scalar);

r_vector = [0 1 2];
area_vector = circle_area_ai(r_vector);
disp(area_vector);

function area = circle_area_ai(radius)
    area = 3.14 * radius^2;
end

