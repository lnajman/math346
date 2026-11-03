% MATH 346 - Week 5
% AI symbolic-answer critique starter
%
% This script intentionally imitates a plausible but under-justified answer.
% Your task is to add the evidence needed to support or repair its claim.

clear; clc; close all;

syms r positive
V = 1;
surface_area = 2*pi*r^2 + 2*V/r;
candidate = solve(diff(surface_area, r) == 0, r);
radius = double(candidate);

fprintf("Generated-code claim:\n");
fprintf("The optimal tank radius is %.4f m.\n", radius);

% Review questions:
% 1. What physical domain is assumed, and where is it recorded?
% 2. Does a stationary point automatically prove a minimum?
% 3. What is the derivative residual at the candidate?
% 4. What does the second derivative show?
% 5. Does a numerical plot or fminbnd calculation agree?
% 6. What height corresponds to this radius?
% 7. What happens to the surface area as r approaches 0 or infinity?
