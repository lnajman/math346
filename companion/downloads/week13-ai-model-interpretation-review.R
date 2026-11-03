library(dplyr)

model_data <- airquality |>
  transmute(
    observation_id = row_number(),
    ozone_ppb = Ozone,
    temperature_f = Temp
  ) |>
  filter(complete.cases(ozone_ppb, temperature_f))

ozone_fit <- lm(ozone_ppb ~ temperature_f, data = model_data)

generated_interpretation <- paste(
  "Increasing temperature by one degree causes ozone to rise by",
  "2.43 ppb. The intercept predicts ozone at 0 F.",
  "An R-squared of 0.49 means 49% of observations are predicted correctly.",
  "The low training error proves the model will predict new days well,",
  "and the residuals show no unusual observations."
)

coefficients <- coef(ozone_fit)
r_squared <- summary(ozone_fit)$r.squared
standardized_residuals <- rstandard(ozone_fit)
cooks_distances <- cooks.distance(ozone_fit)

rmse <- function(observed, predicted) {
  sqrt(mean((observed - predicted)^2))
}

baseline_rmse <- rmse(
  model_data$ozone_ppb,
  rep(mean(model_data$ozone_ppb), nrow(model_data))
)
training_rmse <- rmse(model_data$ozone_ppb, predict(ozone_fit))

audit <- tibble(
  generated_claim = c(
    "temperature causes ozone to rise",
    "the intercept is a meaningful prediction at 0 F",
    "R-squared is the percentage predicted correctly",
    "training error proves performance on new days",
    "there are no unusual observations"
  ),
  verdict = rep("unsupported or incorrect", 5),
  evidence = c(
    "the fitted observational association does not establish causation",
    paste("observed temperatures range from", min(model_data$temperature_f),
          "to", max(model_data$temperature_f), "F"),
    "R-squared describes variation accounted for by the fitted model",
    "training predictions reuse the same observations used for fitting",
    paste(sum(abs(standardized_residuals) > 2),
          "standardized residuals exceed 2 in absolute value")
  )
)

stopifnot(
  nrow(model_data) == 116,
  abs(coefficients[["temperature_f"]] - 2.428703) < 1e-6,
  min(model_data$temperature_f) == 57,
  max(model_data$temperature_f) == 97,
  abs(r_squared - 0.4877072) < 1e-6,
  training_rmse < baseline_rmse,
  sum(abs(standardized_residuals) > 2) == 5,
  sum(cooks_distances > 4 / nrow(model_data)) == 5,
  nrow(audit) == 5
)

cat(generated_interpretation, "\n\n")
print(audit)
cat("Week 13 AI model-interpretation audit passed.\n")
