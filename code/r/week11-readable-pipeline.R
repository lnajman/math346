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

stopifnot(
  nrow(events_raw) == 9,
  n_distinct(events_raw$event_id) == 9,
  nrow(problems(events_raw)) == 0
)

# Named checkpoints keep one pipeline from becoming an opaque block.
events_clean <- events_raw |>
  transmute(
    event_id,
    building_id = str_to_upper(str_squish(building_key)),
    reported_at = ymd_hm(reported_at, tz = "Europe/Paris", quiet = TRUE),
    issue = str_to_lower(str_squish(issue_label)),
    severity = factor(
      str_to_lower(str_squish(severity)),
      levels = c("low", "medium", "high"),
      ordered = TRUE
    ),
    response_hours
  )

stopifnot(
  nrow(events_clean) == nrow(events_raw),
  n_distinct(events_clean$event_id) == nrow(events_clean),
  !any(is.na(events_clean$reported_at)),
  !any(is.na(events_clean$severity))
)

events_analysis <- events_clean |>
  mutate(
    within_12_hours = !is.na(response_hours) & response_hours <= 12,
    response_days = response_hours / 24
  )

stopifnot(
  nrow(events_analysis) == nrow(events_clean),
  sum(events_analysis$within_12_hours) == 5,
  all(events_analysis$response_days > 0)
)

issue_summary <- events_analysis |>
  group_by(issue) |>
  summarize(
    n_events = n(),
    observed_responses = sum(!is.na(response_hours)),
    mean_response_hours = mean(response_hours, na.rm = TRUE),
    within_target_rate = mean(within_12_hours),
    .groups = "drop"
  ) |>
  arrange(desc(n_events), issue)

stopifnot(
  nrow(issue_summary) == 4,
  sum(issue_summary$n_events) == nrow(events_analysis),
  sum(issue_summary$observed_responses) == nrow(events_analysis),
  all(issue_summary$within_target_rate >= 0),
  all(issue_summary$within_target_rate <= 1)
)

print(events_analysis)
print(issue_summary)
cat("Week 11 readable-pipeline checks passed.\n")
