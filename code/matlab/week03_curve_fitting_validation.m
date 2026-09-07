% MATH 346 - guided lab starter
% Polynomial fits and residual evidence
% This file is intentionally incomplete. Follow the lab page and replace
% every TODO with your own code before consulting the worked solution.

clear; clc; close all;

%% Given setup
x = linspace(-1, 1, 15);
y = [0.03 0.58 1.15 1.50 1.86 2.31 2.70 3.02 3.24 3.59 ...
     3.86 3.94 3.88 3.99 4.04];
degrees = [1 2 7];

%% Task 1
% Fit each candidate degree and retain predictions and residuals.
% TODO: write and check your code here.

%% Task 2
% Compute RMSE for each model.
% TODO: write and check your code here.

%% Task 3
% Plot the fits and residuals, then state why smallest training RMSE is insufficient.
% TODO: write and check your code here.

%% Task 4 - Meeting 2: observations not used for fitting
% Make one fixed alternating split before fitting any candidate model.
% Fit each degree on the fit observations only, then calculate separate fit
% and check RMSE values without refitting on the check observations.
% TODO: write and check your code here.

%% Reflection
% TODO: explain which evidence makes the result trustworthy.
