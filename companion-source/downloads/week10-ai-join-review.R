library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)

events_path <- "data/week10-service-events.csv"
energy_path <- "data/week09-campus-energy-wide.csv"
stopifnot(file.exists(events_path), file.exists(energy_path))

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

energy_wide <- read_csv(
  energy_path,
  na = c("", "missing"),
  col_types = cols(
    building_id = col_character(),
    building_type = col_character(),
    area_m2 = col_double(),
    jan_kwh = col_double(),
    feb_kwh = col_double(),
    mar_kwh = col_double(),
    apr_kwh = col_double()
  ),
  show_col_types = FALSE
)

events <- events_raw |>
  transmute(
    event_id,
    building_id = str_to_upper(str_squish(building_key)),
    reported_at = ymd_hm(reported_at, tz = "Europe/Paris", quiet = TRUE),
    month = str_to_lower(format(reported_at, "%b")),
    response_hours
  )

energy_long <- energy_wide |>
  pivot_longer(
    cols = ends_with("_kwh"),
    names_to = "month",
    names_pattern = "(.*)_kwh",
    values_to = "energy_kwh"
  )

# Generated code accepts a many-to-many join and uses only building_id.
# Every matched event is therefore repeated once for each energy month.
generated_join <- events |>
  left_join(
    energy_long,
    by = "building_id",
    relationship = "many-to-many"
  )

generated_event_counts <- generated_join |>
  count(event_id, name = "rows_after_join")

stopifnot(
  nrow(events) == 9,
  nrow(generated_join) == 33,
  all(generated_event_counts$rows_after_join[generated_event_counts$event_id != "EVT-008"] == 4),
  generated_event_counts$rows_after_join[generated_event_counts$event_id == "EVT-008"] == 1
)

# The repaired join uses the full building-month observation key.
repaired_join <- events |>
  left_join(
    energy_long,
    by = c("building_id", "month"),
    relationship = "many-to-one"
  )

stopifnot(
  nrow(repaired_join) == nrow(events),
  n_distinct(repaired_join$event_id) == nrow(events),
  sum(is.na(repaired_join$building_type)) == 1,
  sum(is.na(repaired_join$energy_kwh)) == 1
)

print(generated_event_counts)
cat("The generated join expands 9 events to 33 rows.\n")
cat("The repaired building-month join preserves 9 event observations.\n")
