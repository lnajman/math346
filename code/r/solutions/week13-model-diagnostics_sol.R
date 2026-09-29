# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

library(dplyr)
library(ggplot2)

model_data <- airquality |>
  transmute(
    observation_id = row_number(),
    ozone_ppb = Ozone,
    temperature_f = Temp,
    wind_mph = Wind
  ) |>
  filter(complete.cases(ozone_ppb, temperature_f, wind_mph))

stopifnot(nrow(model_data) == 116, !anyNA(model_data))

simple_fit <- lm(
  ozone_ppb ~ temperature_f,
  data = model_data
)
additive_fit <- lm(
  ozone_ppb ~ temperature_f + wind_mph,
  data = model_data
)

model_data <- model_data |>
  mutate(
    simple_prediction = predict(simple_fit),
    additive_prediction = predict(additive_fit),
    additive_residual = residuals(additive_fit),
    standardized_residual = rstandard(additive_fit),
    cooks_distance = cooks.distance(additive_fit)
  )

rmse <- function(observed, predicted) {
  stopifnot(length(observed) == length(predicted), !anyNA(observed), !anyNA(predicted))
  sqrt(mean((observed - predicted)^2))
}

baseline_prediction <- mean(model_data$ozone_ppb)
comparison <- tibble(
  model = c("mean baseline", "temperature", "temperature + wind"),
  training_rmse_ppb = c(
    rmse(model_data$ozone_ppb, rep(baseline_prediction, nrow(model_data))),
    rmse(model_data$ozone_ppb, model_data$simple_prediction),
    rmse(model_data$ozone_ppb, model_data$additive_prediction)
  ),
  r_squared = c(
    NA_real_,
    summary(simple_fit)$r.squared,
    summary(additive_fit)$r.squared
  )
)

residual_plot <- ggplot(
  model_data,
  aes(x = additive_prediction, y = additive_residual)
) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_point(alpha = 0.65) +
  labs(
    x = "Fitted ozone (ppb)",
    y = "Residual (ppb)"
  )

residual_build <- ggplot_build(residual_plot)
stopifnot(nrow(residual_build$data[[2]]) == nrow(model_data))

influence_threshold <- 4 / nrow(model_data)
flagged <- model_data |>
  filter(
    abs(standardized_residual) > 2 |
      cooks_distance > influence_threshold
  ) |>
  arrange(desc(cooks_distance))

additive_coefficients <- coef(additive_fit)

stopifnot(
  abs(additive_coefficients[["temperature_f"]] - 1.840179) < 1e-6,
  abs(additive_coefficients[["wind_mph"]] - (-3.055491)) < 1e-6,
  abs(summary(additive_fit)$r.squared - 0.5687097) < 1e-6,
  abs(mean(model_data$additive_residual)) < 1e-12,
  comparison$training_rmse_ppb[[3]] < comparison$training_rmse_ppb[[2]],
  comparison$training_rmse_ppb[[2]] < comparison$training_rmse_ppb[[1]],
  sum(model_data$cooks_distance > influence_threshold) == 7,
  sum(abs(model_data$standardized_residual) > 2) == 4,
  flagged$observation_id[[1]] == 117
)

print(comparison)
print(flagged)
cat("Week 13 diagnostic flags are prompts for investigation, not automatic deletion rules.\n")
cat("Week 13 model-diagnostic checks passed.\n")
