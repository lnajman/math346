# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

library(dplyr)

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
fit <- lm(
  ozone_ppb ~ temperature_f + wind_mph,
  data = training
)

validation_predictions <- predict(fit, newdata = validation)
baseline_value <- mean(training$ozone_ppb)
sensitivity_index <- which.max(abs(rstandard(fit)))

computed_values <- c(
  training_rows = nrow(training),
  validation_rows = nrow(validation),
  prediction_rows = length(validation_predictions),
  validation_rmse = rmse(validation$ozone_ppb, validation_predictions),
  validation_mae = mae(validation$ozone_ppb, validation_predictions),
  sensitivity_removed_id = training$observation_id[[sensitivity_index]],
  model_beats_baseline = as.numeric(
    rmse(validation$ozone_ppb, validation_predictions) <
      rmse(validation$ozone_ppb, baseline_value)
  )
)

# These values imitate a report assembled from several stale or mistyped sources.
reported_values <- c(
  training_rows = 116,
  validation_rows = 29,
  prediction_rows = 28,
  validation_rmse = 15.80,
  validation_mae = 14.89,
  sensitivity_removed_id = 117,
  model_beats_baseline = 1
)

tolerances <- c(
  training_rows = 0,
  validation_rows = 0,
  prediction_rows = 0,
  validation_rmse = 0.01,
  validation_mae = 0.01,
  sensitivity_removed_id = 0,
  model_beats_baseline = 0
)

source_artifact <- c(
  "PDF data section",
  "results CSV",
  "prediction CSV",
  "PDF conclusion",
  "figure caption",
  "sensitivity section",
  "PDF conclusion"
)

artifact_audit <- tibble(
  item = names(computed_values),
  source_artifact,
  reported_value = as.numeric(reported_values),
  computed_value = as.numeric(computed_values),
  tolerance = as.numeric(tolerances),
  difference = abs(reported_value - computed_value),
  status = if_else(difference <= tolerance, "agrees", "mismatch")
)

required_exact_items <- c(
  "training_rows", "validation_rows", "prediction_rows",
  "sensitivity_removed_id"
)

release_ready <- !any(
  artifact_audit$status == "mismatch" &
    artifact_audit$item %in% required_exact_items
)

stopifnot(
  identical(
    artifact_audit$status,
    c("mismatch", "agrees", "mismatch", "mismatch", "agrees", "agrees", "agrees")
  ),
  sum(artifact_audit$status == "mismatch") == 3,
  !release_ready,
  artifact_audit$computed_value[artifact_audit$item == "prediction_rows"] == 29,
  artifact_audit$computed_value[artifact_audit$item == "sensitivity_removed_id"] == 117
)

print(artifact_audit)
cat("Release ready:", release_ready, "\n")
cat("Week 15 cross-artifact audit found three deliberate inconsistencies.\n")
