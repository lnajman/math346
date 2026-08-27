% MATH 346 - guided lab starter
% ODE solver and initial-condition checks
% This file is intentionally incomplete. Follow the lab page and replace
% every TODO with your own code before consulting the worked solution.

clear; clc; close all;

%% Given setup
f = @(t, y) -y + sin(t);
tspan = [0 10];
y0 = 1;

%% Task 1
% Solve with ode45 and verify the initial condition.
% TODO: write and check your code here.

%% Task 2
% Plot the solution with labels.
% TODO: write and check your code here.

%% Task 3
% Request a specified output grid and compare the final values.
% TODO: write and check your code here.

%% Reflection
% TODO: explain which evidence makes the result trustworthy.
