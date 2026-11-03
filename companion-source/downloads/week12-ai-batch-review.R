library(dplyr)

data <- airquality |>
  mutate(month_label = month.abb[Month])

checked_mean <- function(data, variable_name) {
  if (!variable_name %in% names(data)) {
    stop("requested variable is not present")
  }

  values <- data[[variable_name]]
  if (!is.numeric(values)) {
    stop("requested variable must be numeric")
  }

  mean(values, na.rm = TRUE)
}

requested_variables <- c(
  "Ozone",
  "month_label",
  "not_a_column",
  "Temp"
)

# Generated batch code: an error becomes NULL and disappears in bind_rows().
generated_results <- bind_rows(lapply(
  requested_variables,
  function(variable_name) {
    tryCatch(
      tibble(
        variable = variable_name,
        mean = checked_mean(data, variable_name)
      ),
      error = function(error) NULL
    )
  }
))

stopifnot(
  nrow(generated_results) == 2,
  identical(generated_results$variable, c("Ozone", "Temp")),
  !all(requested_variables %in% generated_results$variable)
)

# Generated simplification: error messages force every numeric mean to text.
generated_mixed <- sapply(
  requested_variables,
  function(variable_name) {
    tryCatch(
      checked_mean(data, variable_name),
      error = function(error) conditionMessage(error)
    )
  }
)

stopifnot(
  is.character(generated_mixed),
  length(generated_mixed) == length(requested_variables),
  identical(names(generated_mixed), requested_variables),
  identical(generated_mixed[["not_a_column"]],
            "requested variable is not present")
)

cat("The generated batch silently drops two failed requests.\n")
cat("The generated simplification coerces valid numeric means to text.\n")
