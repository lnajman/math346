library(dplyr)

data <- airquality |>
  mutate(day_id = row_number())

variables <- c("Ozone", "Solar.R", "Wind", "Temp")

# Vectorize an elementwise calculation instead of looping over observations.
temperature_c <- (data$Temp - 32) * 5 / 9

stopifnot(
  length(temperature_c) == nrow(data),
  abs(temperature_c[1] - 19.4444444444444) < 1e-10,
  !any(is.na(temperature_c))
)

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

  observed <- values[!is.na(values)]
  if (length(observed) == 0) {
    stop("requested variable has no observed values")
  }

  tibble(
    variable = variable_name,
    n_total = length(values),
    n_missing = sum(is.na(values)),
    mean = mean(observed),
    standard_deviation = sd(observed)
  )
}

# lapply keeps one result object for every requested input.
summary_list <- lapply(
  variables,
  function(variable_name) summarize_numeric(data, variable_name)
)
summary_table <- bind_rows(summary_list)

stopifnot(
  nrow(summary_table) == length(variables),
  identical(summary_table$variable, variables),
  identical(summary_table$n_missing, c(37L, 7L, 0L, 0L))
)

# vapply states that every iteration must return exactly one number.
means_vapply <- vapply(
  variables,
  function(variable_name) mean(data[[variable_name]], na.rm = TRUE),
  numeric(1)
)

# A preallocated loop makes the same repeated calculation explicit.
means_loop <- setNames(numeric(length(variables)), variables)
for (variable_name in variables) {
  means_loop[[variable_name]] <- mean(
    data[[variable_name]],
    na.rm = TRUE
  )
}

stopifnot(
  identical(names(means_vapply), variables),
  isTRUE(all.equal(means_vapply, means_loop)),
  isTRUE(all.equal(unname(means_vapply), summary_table$mean))
)

print(summary_table)
print(means_vapply)
cat("Week 12 vectorization and typed-iteration checks passed.\n")
