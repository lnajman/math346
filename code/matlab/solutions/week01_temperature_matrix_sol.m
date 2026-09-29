% MATH 346 - Week 1
% Possible worked solution - compare only after attempting the starter.
% Other correct implementations are possible.
% Matrix columns as measured variables

clear; clc; close all;

% Columns: time in hours, temperature in Celsius, humidity in percent
measurements = [
    0   22.1   45
    1   22.7   44
    2   23.4   43
    3   24.0   41
    4   24.3   40
    5   24.1   42
    6   23.5   46
];

time_hours = measurements(:, 1);
temperature_c = measurements(:, 2);
humidity_percent = measurements(:, 3);

figure;
plot(time_hours, temperature_c, "-o", "LineWidth", 1.5);
hold on;
plot(time_hours, humidity_percent, "-s", "LineWidth", 1.5);
hold off;

xlabel("time (hours)");
ylabel("measured value");
title("Temperature and humidity measurements");
legend("temperature (C)", "humidity (%)", "Location", "best");
grid on;

mean_temperature = mean(temperature_c);
maximum_humidity = max(humidity_percent);

fprintf("Mean temperature: %.2f C\n", mean_temperature);
fprintf("Maximum humidity: %.1f percent\n", maximum_humidity);

