library(dplyr)

rmse <- function(observed, predicted) {
  sqrt(mean((observed - predicted)^2))
}

model_data <- airquality |>
  transmute(
    observation_id = row_number(),
    month = factor(month.abb[Month], levels = month.abb[5:9]),
    ozone_ppb = Ozone,
    temperature_f = Temp,
    wind_mph = Wind
  ) |>
  filter(complete.cases(ozone_ppb, temperature_f, wind_mph))

training <- model_data |> filter(month != "Sep")
validation <- model_data |> filter(month == "Sep")
fit <- lm(
  ozone_ppb ~ temperature_f + wind_mph,
  data = training
)

validation_predictions <- predict(fit, newdata = validation)
baseline_predictions <- rep(mean(training$ozone_ppb), nrow(validation))
sensitivity_index <- which.max(abs(rstandard(fit)))
sensitivity_fit <- lm(
  ozone_ppb ~ temperature_f + wind_mph,
  data = training[-sensitivity_index, ]
)
sensitivity_predictions <- predict(sensitivity_fit, newdata = validation)

validation_rmse <- rmse(validation$ozone_ppb, validation_predictions)
baseline_validation_rmse <- rmse(validation$ozone_ppb, baseline_predictions)
sensitivity_validation_rmse <- rmse(
  validation$ozone_ppb,
  sensitivity_predictions
)
largest_absolute_error <- max(abs(validation$ozone_ppb - validation_predictions))

generated_conclusion <- paste(
  "The model proves that hot, calm weather causes high ozone.",
  "Its validation RMSE is lower than the mean baseline, so every September",
  "day is predicted accurately and the model will generalize to all seasons.",
  "The sensitivity refit has lower validation RMSE and should replace the",
  "frozen model. The clear figure means that limitations are negligible."
)

claim_audit <- tibble(
  generated_claim = c(
    "weather causes high ozone",
    "validation RMSE is lower than the mean baseline",
    "every September day is predicted accurately",
    "the model will generalize to all seasons",
    "the sensitivity refit should replace the frozen model",
    "limitations are negligible"
  ),
  verdict = c(
    "unsupported",
    "supported",
    "contradicted",
    "unsupported",
    "unsupported",
    "unsupported"
  ),
  evidence = c(
    "observational regression supports association, not causation",
    sprintf(
      "model RMSE %.1f ppb is below baseline RMSE %.1f ppb",
      validation_rmse, baseline_validation_rmse
    ),
    sprintf("the largest absolute validation error is %.1f ppb", largest_absolute_error),
    "validation covers September observations from the same dataset only",
    sprintf(
      "the frozen plan remains primary; sensitivity RMSE is %.1f ppb",
      sensitivity_validation_rmse
    ),
    "missing outcomes, limited predictors, observational data, and one validation period remain"
  ),
  repair = c(
    "describe adjusted association",
    "retain with the two rounded values",
    "report average performance and the largest error",
    "limit the claim to the validation setting",
    "report sensitivity as robustness evidence",
    "state the material limitations"
  )
)

stopifnot(
  abs(validation_rmse - 17.93979) < 1e-5,
  validation_rmse < baseline_validation_rmse,
  sensitivity_validation_rmse < validation_rmse,
  largest_absolute_error > 40,
  sum(claim_audit$verdict == "supported") == 1,
  sum(claim_audit$verdict != "supported") == 5
)

cat(generated_conclusion, "\n\n")
print(claim_audit)
cat("Week 15 AI conclusion audit retained one claim and repaired five.\n")
