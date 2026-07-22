library(readr)
library(dplyr)
library(stringr)
library(lubridate)

events_path <- "data/week10-service-events.csv"
stopifnot(file.exists(events_path))

events_raw <- read_csv(
  events_path,
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

expected_raw_names <- c(
  "event_id", "building_key", "reported_at",
  "issue_label", "severity", "response_hours"
)

stopifnot(
  identical(names(events_raw), expected_raw_names),
  nrow(events_raw) == 9,
  n_distinct(events_raw$event_id) == 9,
  nrow(problems(events_raw)) == 0
)

severity_levels <- c("low", "medium", "high")

events <- events_raw |>
  mutate(
    building_id = str_to_upper(str_squish(building_key)),
    issue = str_to_lower(str_squish(issue_label)),
    severity_text = str_to_lower(str_squish(severity)),
    severity = factor(
      severity_text,
      levels = severity_levels,
      ordered = TRUE
    ),
    reported_at = ymd_hm(reported_at, tz = "Europe/Paris", quiet = TRUE),
    report_date = as_date(reported_at),
    report_hour = hour(reported_at),
    month = str_to_lower(format(reported_at, "%b"))
  ) |>
  select(
    event_id, building_id, reported_at, report_date, report_hour,
    month, issue, severity, response_hours
  )

expected_issues <- c("access", "hvac", "lighting", "water leak")

stopifnot(
  all(str_detect(events$building_id, "^BLDG-[0-9]{2}$")),
  identical(sort(unique(events$issue)), sort(expected_issues)),
  is.ordered(events$severity),
  identical(levels(events$severity), severity_levels),
  !any(is.na(events$severity)),
  !any(is.na(events$reported_at)),
  all(events$report_hour >= 0 & events$report_hour <= 23),
  identical(sort(unique(events$month)), c("apr", "feb", "jan", "mar")),
  all(events$response_hours > 0)
)

severity_summary <- events |>
  group_by(severity) |>
  summarize(
    n_events = n(),
    mean_response_hours = mean(response_hours),
    .groups = "drop"
  )

print(events)
print(severity_summary)
cat("Week 10 string, factor, and date-time checks passed.\n")
