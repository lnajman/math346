# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

library(dplyr)
library(ggplot2)

rmse <- function(observed, predicted) {
  sqrt(mean((observed - predicted)^2))
}

mae <- function(observed, predicted) {
  mean(abs(observed - predicted))
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
frozen_formula <- ozone_ppb ~ temperature_f + wind_mph

fit <- lm(frozen_formula, data = training)
training_predictions <- predict(fit)
validation_predictions <- predict(fit, newdata = validation)
baseline_value <- mean(training$ozone_ppb)

sensitivity_index <- which.max(abs(rstandard(fit)))
sensitivity_removed_id <- training$observation_id[[sensitivity_index]]
sensitivity_fit <- lm(frozen_formula, data = training[-sensitivity_index, ])
sensitivity_predictions <- predict(sensitivity_fit, newdata = validation)

results <- tibble(
  n_training_rows = nrow(training),
  n_validation_rows = nrow(validation),
  formula = paste(deparse(frozen_formula), collapse = " "),
  baseline_validation_rmse_ppb = rmse(validation$ozone_ppb, baseline_value),
  training_rmse_ppb = rmse(training$ozone_ppb, training_predictions),
  validation_rmse_ppb = rmse(validation$ozone_ppb, validation_predictions),
  validation_mae_ppb = mae(validation$ozone_ppb, validation_predictions),
  sensitivity_removed_observation_id = sensitivity_removed_id,
  sensitivity_validation_rmse_ppb = rmse(
    validation$ozone_ppb,
    sensitivity_predictions
  )
)

prediction_table <- validation |>
  transmute(
    observation_id,
    observed_ozone_ppb = ozone_ppb,
    prediction_ppb = as.numeric(validation_predictions),
    residual_ppb = observed_ozone_ppb - prediction_ppb
  )

largest_error <- prediction_table |>
  slice_max(abs(residual_ppb), n = 1, with_ties = FALSE)

validation_plot <- ggplot(
  prediction_table,
  aes(x = observed_ozone_ppb, y = prediction_ppb)
) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  geom_point(size = 2) +
  geom_text(
    data = largest_error,
    aes(label = paste("ID", observation_id)),
    nudge_y = 4
  ) +
  coord_equal() +
  labs(
    title = "Frozen-model predictions for September",
    subtitle = "The dashed line marks perfect observed-predicted agreement",
    x = "Observed ozone (ppb)",
    y = "Predicted ozone (ppb)",
    caption = paste(
      "Each point is one of", nrow(validation),
      "complete September observations; ID marks the largest absolute error."
    )
  )

bundle_directory <- file.path(tempdir(), "math346-week15-evidence")
dir.create(bundle_directory, showWarnings = FALSE)

results_path <- file.path(bundle_directory, "week15-results.csv")
predictions_path <- file.path(bundle_directory, "week15-predictions.csv")
figure_path <- file.path(bundle_directory, "week15-validation-figure.png")
manifest_path <- file.path(bundle_directory, "week15-manifest.csv")

write.csv(results, results_path, row.names = FALSE)
write.csv(prediction_table, predictions_path, row.names = FALSE)
ggsave(figure_path, validation_plot, width = 7, height = 6, dpi = 120)

manifest <- tibble(
  artifact = basename(c(results_path, predictions_path, figure_path)),
  role = c(
    "exact summary values",
    "one prediction per validation observation",
    "visual prediction evidence"
  ),
  generated_by = "week15-evidence-bundle.R"
)
write.csv(manifest, manifest_path, row.names = FALSE)

results_check <- read.csv(results_path, check.names = FALSE)
predictions_check <- read.csv(predictions_path, check.names = FALSE)
manifest_check <- read.csv(manifest_path, check.names = FALSE)
plot_build <- ggplot_build(validation_plot)

stopifnot(
  nrow(training) == 87,
  nrow(validation) == 29,
  sensitivity_removed_id == 117,
  abs(results$validation_rmse_ppb - 17.93979) < 1e-5,
  abs(results$validation_mae_ppb - 14.89114) < 1e-5,
  results$validation_rmse_ppb < results$baseline_validation_rmse_ppb,
  identical(prediction_table$observation_id, validation$observation_id),
  nrow(results_check) == 1,
  nrow(predictions_check) == nrow(validation),
  nrow(manifest_check) == 3,
  nrow(plot_build$data[[2]]) == nrow(validation),
  file.info(figure_path)$size > 1000
)

print(results)
print(manifest)
cat("Week 15 evidence bundle passed row, value, alignment, and file checks.\n")
