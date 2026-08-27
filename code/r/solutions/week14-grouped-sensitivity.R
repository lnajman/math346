# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

library(dplyr)

model_data <- airquality |>
  transmute(
    observation_id = row_number(),
    month = factor(month.abb[Month], levels = month.abb[5:9]),
    ozone_ppb = Ozone,
    temperature_f = Temp,
    wind_mph = Wind
  ) |>
  filter(complete.cases(ozone_ppb, temperature_f, wind_mph))

month_data <- split(model_data, model_data$month)
fixed_formula <- ozone_ppb ~ temperature_f + wind_mph

rmse <- function(observed, predicted) {
  stopifnot(length(observed) == length(predicted), !anyNA(observed), !anyNA(predicted))
  sqrt(mean((observed - predicted)^2))
}

diagnose_one_month <- function(data, month_name) {
  fit <- lm(fixed_formula, data = data)
  standardized <- rstandard(fit)
  cook <- cooks.distance(fit)
  removed_index <- which.max(abs(standardized))

  sensitivity_data <- data[-removed_index, , drop = FALSE]
  sensitivity_fit <- lm(fixed_formula, data = sensitivity_data)

  original_slope <- coef(fit)[["temperature_f"]]
  sensitivity_slope <- coef(sensitivity_fit)[["temperature_f"]]

  tibble(
    month = month_name,
    n_observations = nrow(data),
    standardized_residual_flags = sum(abs(standardized) > 2),
    cooks_distance_flags = sum(cook > 4 / nrow(data)),
    sensitivity_removed_observation_id = data$observation_id[[removed_index]],
    original_temperature_slope = original_slope,
    sensitivity_temperature_slope = sensitivity_slope,
    slope_change_percent =
      100 * (sensitivity_slope - original_slope) / abs(original_slope),
    original_training_rmse_ppb = rmse(data$ozone_ppb, predict(fit)),
    sensitivity_training_rmse_ppb =
      rmse(sensitivity_data$ozone_ppb, predict(sensitivity_fit))
  )
}

sensitivity_table <- bind_rows(lapply(
  names(month_data),
  function(month_name) {
    diagnose_one_month(month_data[[month_name]], month_name)
  }
))

stopifnot(
  nrow(sensitivity_table) == length(month_data),
  identical(sensitivity_table$month, month.abb[5:9]),
  identical(
    sensitivity_table$standardized_residual_flags,
    c(1L, 1L, 2L, 1L, 2L)
  ),
  identical(
    sensitivity_table$cooks_distance_flags,
    c(2L, 2L, 2L, 1L, 3L)
  ),
  identical(
    sensitivity_table$sensitivity_removed_observation_id,
    c(30L, 49L, 62L, 117L, 124L)
  ),
  all(sensitivity_table$sensitivity_training_rmse_ppb <
        sensitivity_table$original_training_rmse_ppb),
  sum(abs(sensitivity_table$slope_change_percent) > 40) == 3
)

print(sensitivity_table)
cat("Lower sensitivity training error follows removal of a difficult row; it is not new-data validation.\n")
cat("Week 14 grouped sensitivity checks passed.\n")
