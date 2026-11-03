% MATH 346 - Week 1
% AI code critique example
%
% This script is intentionally plausible but weak. Run it, critique it,
% and then repair it.

clear; clc; close all;

x = 0:2*pi;
y1 = sin(x);
y2 = cos(x);

figure;
plot(y1, y2);
title("Sine and cosine");

