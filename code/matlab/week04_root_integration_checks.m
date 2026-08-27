% MATH 346 - guided lab starter
% Numerical roots, integration, and validation
% This file is intentionally incomplete. Follow the lab page and replace
% every TODO with your own code before consulting the worked solution.

clear; clc; close all;

%% Given setup
f = @(x) x.*exp(-x) - 0.2;
g = @(x) sin(x)./(1 + x.^2);

%% Task 1
% Plot f and locate two justified root brackets.
% TODO: write and check your code here.

%% Task 2
% Find both roots and check each residual.
% TODO: write and check your code here.

%% Task 3
% Compare integral with trapz on coarse and fine grids; interpret the differences.
% TODO: write and check your code here.

%% Reflection
% TODO: explain which evidence makes the result trustworthy.
