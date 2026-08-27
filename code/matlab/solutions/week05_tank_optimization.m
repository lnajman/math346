% MATH 346 - Week 5
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Exact and numerical checks for a fixed-volume cylindrical tank

clear; clc; close all;

syms r V positive

height = V / (pi * r^2);
surface_area = 2*pi*r^2 + 2*pi*r*height;
surface_area = simplify(surface_area);

d_surface = simplify(diff(surface_area, r));
d2_surface = simplify(diff(surface_area, r, 2));
r_star = simplify(solve(d_surface == 0, r));

stationarity_check = simplify(subs(d_surface, r, r_star));
curvature_at_candidate = simplify(subs(d2_surface, r, r_star));

assert(isAlways(stationarity_check == 0));
assert(isAlways(curvature_at_candidate > 0));

V_value = 1;  % cubic metre = 1000 litres
r_symbolic_value = subs(r_star, V, V_value);
r_numeric = double(r_symbolic_value);
height_numeric = double(subs(height, [r V], [r_numeric V_value]));
surface_numeric = double(subs(surface_area, [r V], [r_numeric V_value]));

assert(abs(height_numeric - 2*r_numeric) < 1e-10);

surface_handle = matlabFunction(surface_area, 'Vars', [r V]);
objective = @(radius) surface_handle(radius, V_value);
solver_options = optimset('TolX', 1e-12);
[r_fminbnd, surface_fminbnd] = fminbnd( ...
    objective, 0.05, 2.0, solver_options);

assert(abs(r_numeric - r_fminbnd) < 1e-8);
assert(abs(surface_numeric - surface_fminbnd) < 1e-10);

disp("Simplified surface-area expression:");
disp(surface_area);
disp("Exact positive stationary radius:");
disp(r_star);
disp("Second derivative at the candidate:");
disp(curvature_at_candidate);

fprintf("For V = 1 m^3:\n");
fprintf("  symbolic radius = %.8f m\n", r_numeric);
fprintf("  symbolic height = %.8f m\n", height_numeric);
fprintf("  surface area = %.8f m^2\n", surface_numeric);
fprintf("  fminbnd radius = %.8f m\n", r_fminbnd);
fprintf("  radius difference = %.3e m\n", abs(r_numeric - r_fminbnd));

r_grid = linspace(0.2, 1.4, 300);

figure;
plot(r_grid, objective(r_grid), "LineWidth", 1.5);
hold on;
plot(r_numeric, surface_numeric, "o", "MarkerSize", 8, "LineWidth", 1.5);
hold off;
grid on;
xlabel("radius (m)");
ylabel("surface area (m^2)");
title("Closed Cylindrical Tank With Volume 1 m^3");
legend("surface area", "checked symbolic candidate", "Location", "best");
