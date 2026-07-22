library(dplyr)
library(ggplot2)

model_data <- airquality |>
  transmute(
    observation_id = row_number(),
    ozone_ppb = Ozone,
    temperature_f = Temp
  ) |>
  filter(complete.cases(ozone_ppb, temperature_f))

stopifnot(
  nrow(model_data) == 116,
  identical(range(model_data$temperature_f), c(57L, 97L)),
  !anyNA(model_data)
)

relationship_plot <- ggplot(
  model_data,
  aes(x = temperature_f, y = ozone_ppb)
) +
  geom_point(alpha = 0.65) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    x = "Temperature (degrees F)",
    y = "Ozone (ppb)"
  )

relationship_build <- ggplot_build(relationship_plot)
stopifnot(nrow(relationship_build$data[[1]]) == nrow(model_data))

ozone_fit <- lm(ozone_ppb ~ temperature_f, data = model_data)

model_data <- model_data |>
  mutate(
    fitted_ozone_ppb = fitted(ozone_fit),
    residual_ppb = residuals(ozone_fit)
  )

rmse <- function(observed, predicted) {
  stopifnot(
    is.numeric(observed),
    is.numeric(predicted),
    length(observed) == length(predicted),
    !anyNA(observed),
    !anyNA(predicted)
  )

  sqrt(mean((observed - predicted)^2))
}

baseline_prediction <- mean(model_data$ozone_ppb)
baseline_rmse <- rmse(
  model_data$ozone_ppb,
  rep(baseline_prediction, nrow(model_data))
)
model_rmse <- rmse(
  model_data$ozone_ppb,
  model_data$fitted_ozone_ppb
)

coefficients <- coef(ozone_fit)
model_r_squared <- summary(ozone_fit)$r.squared

stopifnot(
  abs(coefficients[["(Intercept)"]] - (-146.995491)) < 1e-6,
  abs(coefficients[["temperature_f"]] - 2.428703) < 1e-6,
  abs(model_r_squared - 0.4877072) < 1e-6,
  abs(mean(model_data$residual_ppb)) < 1e-12,
  model_rmse < baseline_rmse
)

prediction_inputs <- tibble(temperature_f = c(70, 80, 90))
prediction_outputs <- prediction_inputs |>
  mutate(predicted_ozone_ppb = predict(ozone_fit, newdata = prediction_inputs))

stopifnot(
  nrow(prediction_outputs) == 3,
  all(prediction_outputs$temperature_f >= min(model_data$temperature_f)),
  all(prediction_outputs$temperature_f <= max(model_data$temperature_f))
)

model_summary <- tibble(
  quantity = c(
    "observations used",
    "temperature slope (ppb per degree F)",
    "R-squared",
    "baseline training RMSE (ppb)",
    "model training RMSE (ppb)"
  ),
  value = c(
    nrow(model_data),
    coefficients[["temperature_f"]],
    model_r_squared,
    baseline_rmse,
    model_rmse
  )
)

print(model_summary)
print(prediction_outputs)
cat("Week 13 simple-linear-model checks passed.\n")
