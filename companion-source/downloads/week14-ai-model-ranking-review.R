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

summarize_model <- function(data, month_name) {
  fit <- lm(ozone_ppb ~ temperature_f + wind_mph, data = data)
  intervals <- confint(fit)
  standardized <- rstandard(fit)
  cook <- cooks.distance(fit)
  removed_index <- which.max(abs(standardized))
  sensitivity_fit <- lm(
    ozone_ppb ~ temperature_f + wind_mph,
    data = data[-removed_index, , drop = FALSE]
  )

  tibble(
    month = month_name,
    n_observations = nrow(data),
    r_squared = summary(fit)$r.squared,
    wind_slope = coef(fit)[["wind_mph"]],
    wind_low = intervals["wind_mph", 1],
    wind_high = intervals["wind_mph", 2],
    diagnostic_flags =
      sum(abs(standardized) > 2 | cook > 4 / nrow(data)),
    temperature_slope_change_percent = 100 *
      (coef(sensitivity_fit)[["temperature_f"]] -
         coef(fit)[["temperature_f"]]) /
      abs(coef(fit)[["temperature_f"]])
  )
}

evidence <- bind_rows(lapply(
  names(month_data),
  function(month_name) summarize_model(month_data[[month_name]], month_name)
))

# Generated ranking: different group-specific models are treated as competitors
# and only training R-squared is considered.
generated_ranking <- evidence |>
  arrange(desc(r_squared)) |>
  transmute(rank = row_number(), month, r_squared)

generated_claim <- paste(
  "September is the best model because it has the highest R-squared.",
  "June proves that higher wind increases ozone.",
  "The ranking will hold for future observations, and diagnostics do not",
  "change the conclusion."
)

june <- evidence |>
  filter(month == "Jun")

audit <- tibble(
  generated_claim = c(
    "September is the best model",
    "June proves wind increases ozone",
    "training ranking will hold for future observations",
    "diagnostics do not affect the conclusion"
  ),
  verdict = rep("unsupported", 4),
  evidence = c(
    "each monthly model is fitted to a different subset rather than competing on the same rows",
    "June has nine rows and its wind interval includes zero",
    "all ranking metrics are calculated on training subsets",
    "every month has diagnostic flags and three slopes change by over 40 percent in sensitivity fits"
  )
)

stopifnot(
  identical(generated_ranking$month, c("Sep", "Jul", "Jun", "Aug", "May")),
  june$n_observations == 9,
  june$wind_low < 0,
  june$wind_high > 0,
  all(evidence$diagnostic_flags > 0),
  sum(abs(evidence$temperature_slope_change_percent) > 40) == 3,
  nrow(audit) == 4
)

print(generated_ranking)
cat(generated_claim, "\n\n")
print(audit)
cat("Week 14 AI model-ranking audit passed.\n")
