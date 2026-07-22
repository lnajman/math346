library(dplyr)
library(ggplot2)

model_data <- airquality |>
  transmute(
    observation_id = row_number(),
    month = factor(month.abb[Month], levels = month.abb[5:9]),
    ozone_ppb = Ozone,
    temperature_f = Temp,
    wind_mph = Wind
  ) |>
  filter(complete.cases(ozone_ppb, temperature_f, wind_mph))

fixed_formula <- ozone_ppb ~ temperature_f + wind_mph
month_data <- split(model_data, model_data$month)

fit_one_month <- function(data, month_name, model_formula) {
  required <- c("month", "ozone_ppb", "temperature_f", "wind_mph")
  if (!is.data.frame(data) || !all(required %in% names(data))) {
    stop("group data do not satisfy the required column contract")
  }
  if (nrow(data) < 5 || length(unique(data$month)) != 1) {
    stop("each group needs one month and at least five observations")
  }
  if (sd(data$temperature_f) == 0 || sd(data$wind_mph) == 0) {
    stop("each predictor must vary within the group")
  }

  fit <- lm(model_formula, data = data)
  intervals <- confint(fit)
  predictions <- predict(fit)

  summary_row <- tibble(
    month = month_name,
    n_observations = nrow(data),
    temperature_slope = coef(fit)[["temperature_f"]],
    temperature_low = intervals["temperature_f", 1],
    temperature_high = intervals["temperature_f", 2],
    wind_slope = coef(fit)[["wind_mph"]],
    training_rmse_ppb = sqrt(mean((data$ozone_ppb - predictions)^2)),
    r_squared = summary(fit)$r.squared
  )

  list(
    month = month_name,
    formula = model_formula,
    fit = fit,
    summary = summary_row
  )
}

model_results <- lapply(
  names(month_data),
  function(month_name) {
    fit_one_month(month_data[[month_name]], month_name, fixed_formula)
  }
)
names(model_results) <- names(month_data)

model_summary <- bind_rows(lapply(model_results, function(result) result$summary))
formula_text <- vapply(
  model_results,
  function(result) paste(deparse(result$formula), collapse = " "),
  character(1)
)

expected_slopes <- c(
  May = 1.642119,
  Jun = 1.637785,
  Jul = 3.743456,
  Aug = 1.974714,
  Sep = 2.027110
)

stopifnot(
  identical(names(model_results), month.abb[5:9]),
  identical(model_summary$month, month.abb[5:9]),
  identical(model_summary$n_observations, c(26L, 9L, 26L, 26L, 29L)),
  sum(model_summary$n_observations) == nrow(model_data),
  length(unique(formula_text)) == 1,
  all(model_summary$temperature_low < model_summary$temperature_slope),
  all(model_summary$temperature_slope < model_summary$temperature_high),
  max(abs(model_summary$temperature_slope - expected_slopes)) < 1e-6,
  all(vapply(model_results, function(result) inherits(result$fit, "lm"), logical(1)))
)

coefficient_plot <- ggplot(
  model_summary,
  aes(x = month, y = temperature_slope)
) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_errorbar(
    aes(ymin = temperature_low, ymax = temperature_high),
    width = 0.15
  ) +
  geom_point(size = 2) +
  labs(
    x = "Month",
    y = "Temperature coefficient (ozone ppb per degree F)"
  )

coefficient_build <- ggplot_build(coefficient_plot)
stopifnot(nrow(coefficient_build$data[[3]]) == nrow(model_summary))

print(model_summary)
cat("Week 14 fitted one checked model for every requested month.\n")
