# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

library(readr)
library(dplyr)
library(stringr)
library(lubridate)

registry_path <- "data/week10-building-registry.csv"
events_path <- "data/week10-service-events.csv"
stopifnot(file.exists(registry_path), file.exists(events_path))

registry <- read_csv(
  registry_path,
  col_types = cols(
    building_id = col_character(),
    building_name = col_character(),
    campus_zone = col_character(),
    building_type = col_character()
  ),
  show_col_types = FALSE
)

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

events <- events_raw |>
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

registry_key_counts <- registry |>
  count(building_id, name = "registry_rows")

stopifnot(
  nrow(registry) == 6,
  nrow(registry_key_counts) == nrow(registry),
  all(registry_key_counts$registry_rows == 1),
  n_distinct(events$event_id) == nrow(events)
)

unmatched_events <- events |>
  anti_join(registry, by = "building_id")

buildings_without_events <- registry |>
  anti_join(events, by = "building_id")

event_buildings <- events |>
  left_join(
    registry,
    by = "building_id",
    relationship = "many-to-one"
  )

stopifnot(
  nrow(event_buildings) == nrow(events),
  n_distinct(event_buildings$event_id) == nrow(events),
  identical(unmatched_events$event_id, "EVT-008"),
  identical(buildings_without_events$building_id, "BLDG-06"),
  sum(is.na(event_buildings$building_name)) == 1,
  sum(!is.na(event_buildings$building_name)) == 8
)

zone_summary <- event_buildings |>
  mutate(campus_zone = coalesce(campus_zone, "unmatched")) |>
  count(campus_zone, name = "n_events") |>
  arrange(campus_zone)

stopifnot(sum(zone_summary$n_events) == nrow(events))

print(unmatched_events)
print(buildings_without_events)
print(zone_summary)
cat("Week 10 join contract passed without row multiplication.\n")
