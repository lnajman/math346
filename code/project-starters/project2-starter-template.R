# MATH 346 Project 2 starter: R modeling and validation
# Replace every TODO with working R code. Calculated CSV values must be written
# by this script, never typed or edited manually.

options(stringsAsFactors = FALSE)

group_id <- "group-XX"
training_file <- "group-XX-r-training.csv"
validation_file <- "group-XX-r-validation.csv"
results_file <- "group-XX-project2-results.csv"
predictions_file <- "group-XX-validation-predictions.csv"

distribution_figure_file <- "group-XX-project2-distribution.png"
relationship_figure_file <- "group-XX-project2-relationships.png"
residual_figure_file <- "group-XX-project2-residuals.png"

rmse <- function(observed, predicted) {
  stopifnot(is.numeric(observed), is.numeric(predicted))
  stopifnot(length(observed) == length(predicted))
  sqrt(mean((observed - predicted)^2))
}

mae <- function(observed, predicted) {
  stopifnot(is.numeric(observed), is.numeric(predicted))
  stopifnot(length(observed) == length(predicted))
  mean(abs(observed - predicted))
}

# 1. Import and apply the fixed cleaning contract ----------------------------

training_raw <- read.csv(training_file, check.names = FALSE)
required_columns <- c(
  "observation_id", "date", "outdoor_temp_c", "occupancy_count",
  "wind_speed_m_s", "day_type", "heating_energy_kwh"
)
stopifnot(identical(names(training_raw), required_columns))

n_training_rows_raw <- nrow(training_raw)
training_unique <- training_raw[!duplicated(training_raw$observation_id), ]
n_training_rows_unique <- nrow(training_unique)
training <- training_unique[complete.cases(training_unique), ]
training$day_type <- factor(training$day_type, levels = c("weekday", "weekend"))
n_training_rows_usable <- nrow(training)

stopifnot(n_training_rows_raw == 301L)
stopifnot(n_training_rows_unique == 300L)
stopifnot(n_training_rows_usable == 295L)

# 2. Summaries and training figures -----------------------------------------

# TODO: Produce grouped summaries that will be used in the PDF.
# TODO: Create and save a distribution figure.
# png(distribution_figure_file, width = 1200, height = 800, res = 140)
# ... plotting code ...
# dev.off()

# TODO: Create and save a relationship figure.
# png(relationship_figure_file, width = 1200, height = 800, res = 140)
# ... plotting code ...
# dev.off()

# 3. Freeze, fit, and diagnose the model ------------------------------------

# Record the formula before opening the validation file. An example common
# comparison formula is shown below; use the formula approved in the model plan.
# model_formula <- heating_energy_kwh ~ outdoor_temp_c +
#   I(outdoor_temp_c^2) + occupancy_count + wind_speed_m_s + day_type
model_formula <- NULL # TODO
if (is.null(model_formula)) stop("TODO: record the frozen model formula")

# TODO: Fit the model with lm(), calculate training predictions and metrics,
# and select one coefficient for interpretation using its exact R name.
fitted_model <- NULL
training_predictions <- rep(NA_real_, nrow(training))
training_rmse_kwh <- NA_real_
training_mae_kwh <- NA_real_
training_r_squared <- NA_real_
primary_coefficient_name <- "TODO"
primary_coefficient_estimate <- NA_real_

# TODO: Create and save a residual diagnostic figure.
# png(residual_figure_file, width = 1200, height = 800, res = 140)
# ... plotting code ...
# dev.off()

# The script must run successfully before validation release. It stops here
# normally when the assigned validation file is not yet present.
if (!file.exists(validation_file)) {
  message("Training stage complete. Validation file has not been released.")
  quit(save = "no", status = 0L)
}

# 4. Apply the frozen model to validation data -------------------------------

validation <- read.csv(validation_file, check.names = FALSE)
stopifnot(identical(names(validation), required_columns))
stopifnot(!anyNA(validation))
validation$day_type <- factor(validation$day_type, levels = c("weekday", "weekend"))
n_validation_rows <- nrow(validation)

# TODO: Calculate the baseline, model predictions, and all validation metrics.
baseline_value_kwh <- NA_real_
baseline_validation_rmse_kwh <- NA_real_
validation_predictions <- rep(NA_real_, n_validation_rows)
validation_rmse_kwh <- NA_real_
validation_mae_kwh <- NA_real_

# 5. Fixed sensitivity procedure --------------------------------------------

# TODO: Find the largest absolute standardized residual in the training fit,
# remove only that row, refit the same formula, predict validation again, and
# calculate the sensitivity validation RMSE.
sensitivity_removed_observation_id <- "TODO"
sensitivity_validation_rmse_kwh <- NA_real_

# 6. Validate and write the exact output contracts --------------------------

numeric_results <- c(
  n_training_rows_raw, n_training_rows_unique, n_training_rows_usable,
  n_validation_rows, primary_coefficient_estimate, baseline_value_kwh,
  baseline_validation_rmse_kwh, training_rmse_kwh, training_mae_kwh,
  training_r_squared, validation_rmse_kwh, validation_mae_kwh,
  sensitivity_validation_rmse_kwh
)
stopifnot(all(is.finite(numeric_results)))
stopifnot(!is.null(fitted_model))
stopifnot(primary_coefficient_name != "TODO")
stopifnot(sensitivity_removed_observation_id != "TODO")

model_formula_text <- paste(deparse(model_formula), collapse = " ")
results <- data.frame(
  group_id = group_id,
  n_training_rows_raw = n_training_rows_raw,
  n_training_rows_unique = n_training_rows_unique,
  n_training_rows_usable = n_training_rows_usable,
  n_validation_rows = n_validation_rows,
  model_formula = model_formula_text,
  primary_coefficient_name = primary_coefficient_name,
  primary_coefficient_estimate = primary_coefficient_estimate,
  baseline_value_kwh = baseline_value_kwh,
  baseline_validation_rmse_kwh = baseline_validation_rmse_kwh,
  training_rmse_kwh = training_rmse_kwh,
  training_mae_kwh = training_mae_kwh,
  training_r_squared = training_r_squared,
  validation_rmse_kwh = validation_rmse_kwh,
  validation_mae_kwh = validation_mae_kwh,
  sensitivity_removed_observation_id = sensitivity_removed_observation_id,
  sensitivity_validation_rmse_kwh = sensitivity_validation_rmse_kwh,
  check.names = FALSE
)

validation_output <- data.frame(
  observation_id = validation$observation_id,
  prediction_kwh = validation_predictions,
  check.names = FALSE
)

write.csv(results, results_file, row.names = FALSE, na = "")
write.csv(validation_output, predictions_file, row.names = FALSE, na = "")

required_outputs <- c(
  results_file, predictions_file, distribution_figure_file,
  relationship_figure_file, residual_figure_file
)
stopifnot(all(file.exists(required_outputs)))

print(results)
message("Project 2 outputs written for ", group_id, ".")
