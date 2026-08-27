# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

library(readr)
library(dplyr)
library(stringr)
library(lubridate)

clean_building_id <- function(x) {
  if (!is.character(x)) {
    stop("x must be a character vector")
  }

  result <- str_to_upper(str_squish(x))

  if (!all(str_detect(result, "^BLDG-[0-9]{2}$"))) {
    stop("every cleaned key must match BLDG- followed by two digits")
  }

  stopifnot(length(result) == length(x))
  result
}

parse_reported_at <- function(x, tz = "Europe/Paris") {
  if (!is.character(x) || !is.character(tz) || length(tz) != 1) {
    stop("x must be character and tz must be one time-zone string")
  }

  result <- ymd_hm(x, tz = tz, quiet = TRUE)

  if (any(is.na(result))) {
    stop("every timestamp must parse")
  }

  stopifnot(length(result) == length(x))
  result
}

within_target <- function(response_hours, target_hours = 12) {
  if (!is.numeric(response_hours)) {
    stop("response_hours must be numeric")
  }
  if (!is.numeric(target_hours) || length(target_hours) != 1 ||
      !is.finite(target_hours) || target_hours < 0) {
    stop("target_hours must be one finite nonnegative number")
  }

  result <- !is.na(response_hours) & response_hours <= target_hours
  stopifnot(length(result) == length(response_hours), !any(is.na(result)))
  result
}

summarize_issue <- function(data, issue_name, target_hours = 12) {
  required <- c("issue", "response_hours")
  if (!is.data.frame(data) || !all(required %in% names(data))) {
    stop("data must contain issue and response_hours")
  }
  if (!is.character(issue_name) || length(issue_name) != 1) {
    stop("issue_name must be one character value")
  }

  selected <- data |>
    filter(issue == issue_name)

  if (nrow(selected) == 0 || !any(!is.na(selected$response_hours))) {
    stop("the requested issue needs at least one observed response")
  }

  selected |>
    summarize(
      issue = issue_name,
      n_events = n(),
      observed_responses = sum(!is.na(response_hours)),
      mean_response_hours = mean(response_hours, na.rm = TRUE),
      within_target_rate = mean(
        within_target(response_hours, target_hours)
      )
    )
}

# Small known-answer tests before using the functions on the full table.
stopifnot(
  identical(
    clean_building_id(c(" bldg-01 ", "BLDG-02")),
    c("BLDG-01", "BLDG-02")
  ),
  identical(
    within_target(c(11, 12, 13, NA_real_), 12),
    c(TRUE, TRUE, FALSE, FALSE)
  )
)

invalid_key <- tryCatch(
  clean_building_id("room 5"),
  error = function(error) error
)
invalid_time <- tryCatch(
  parse_reported_at("not a timestamp"),
  error = function(error) error
)

stopifnot(inherits(invalid_key, "error"), inherits(invalid_time, "error"))

events_raw <- read_csv(
  "data/week10-service-events.csv",
  col_types = cols(
    event_id = col_character(),
    building_key = col_character(),
    reported_at = col_character(),
    issue_label = col_character(),
    severity = col_character(),
    response_hours = col_double()
  ),
  show_col_types = FALSE
)

events <- events_raw |>
  transmute(
    event_id,
    building_id = clean_building_id(building_key),
    reported_at = parse_reported_at(reported_at),
    issue = str_to_lower(str_squish(issue_label)),
    response_hours,
    within_12_hours = within_target(response_hours)
  )

hvac_summary <- summarize_issue(events, "hvac")
access_summary <- summarize_issue(events, "access")

stopifnot(
  nrow(events) == 9,
  sum(events$within_12_hours) == 5,
  hvac_summary$n_events == 3,
  abs(hvac_summary$mean_response_hours - (4.5 + 11 + 9) / 3) < 1e-12,
  access_summary$n_events == 2,
  abs(access_summary$mean_response_hours - 19.5) < 1e-12
)

print(hvac_summary)
print(access_summary)
cat("Week 11 function contracts and edge-case tests passed.\n")
