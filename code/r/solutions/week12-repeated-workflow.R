# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

library(dplyr)

data <- airquality |>
  mutate(month_label = month.abb[Month])

summarize_numeric <- function(data, variable_name) {
  if (!is.data.frame(data)) {
    stop("data must be a data frame")
  }
  if (!is.character(variable_name) || length(variable_name) != 1) {
    stop("variable_name must be one character value")
  }
  if (!variable_name %in% names(data)) {
    stop("requested variable is not present")
  }

  values <- data[[variable_name]]
  if (!is.numeric(values)) {
    stop("requested variable must be numeric")
  }
  if (all(is.na(values))) {
    stop("requested variable has no observed values")
  }

  tibble(
    variable = variable_name,
    status = "ok",
    n_total = length(values),
    n_missing = sum(is.na(values)),
    mean = mean(values, na.rm = TRUE),
    error_message = NA_character_
  )
}

# Every request produces one status row, including failures.
safe_summarize_numeric <- function(data, variable_name) {
  tryCatch(
    summarize_numeric(data, variable_name),
    error = function(error) {
      tibble(
        variable = variable_name,
        status = "error",
        n_total = NA_integer_,
        n_missing = NA_integer_,
        mean = NA_real_,
        error_message = conditionMessage(error)
      )
    }
  )
}

requested_variables <- c(
  "Ozone",
  "month_label",
  "not_a_column",
  "Temp"
)

run_log <- bind_rows(lapply(
  requested_variables,
  function(variable_name) {
    safe_summarize_numeric(data, variable_name)
  }
))

stopifnot(
  nrow(run_log) == length(requested_variables),
  identical(run_log$variable, requested_variables),
  identical(run_log$status, c("ok", "error", "error", "ok")),
  all(nchar(run_log$error_message[run_log$status == "error"]) > 0),
  all(is.finite(run_log$mean[run_log$status == "ok"]))
)

successful_results <- run_log |>
  filter(status == "ok")

stopifnot(
  nrow(successful_results) == 2,
  identical(successful_results$variable, c("Ozone", "Temp"))
)

print(run_log)
cat("Week 12 repeated-workflow log preserves every request and failure.\n")
