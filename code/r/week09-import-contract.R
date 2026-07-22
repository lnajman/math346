# MATH 346 - Week 9
# Import an external CSV using an explicit, checked contract

library(dplyr)
library(readr)

data_path <- "data/week09-campus-energy-wide.csv"
stopifnot(file.exists(data_path))

expected_columns <- c(
  "building_id", "building_type", "area_m2",
  "jan_kwh", "feb_kwh", "mar_kwh", "apr_kwh"
)

energy_wide <- read_csv(
  data_path,
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

parse_issues <- problems(energy_wide)
monthly_columns <- c("jan_kwh", "feb_kwh", "mar_kwh", "apr_kwh")

import_audit <- data.frame(
  quantity = c(
    "rows",
    "columns",
    "unique building identifiers",
    "missing monthly energy values",
    "parsing problems"
  ),
  value = c(
    nrow(energy_wide),
    ncol(energy_wide),
    n_distinct(energy_wide$building_id),
    sum(is.na(energy_wide[monthly_columns])),
    nrow(parse_issues)
  )
)

print(import_audit)
glimpse(energy_wide)

stopifnot(
  identical(names(energy_wide), expected_columns),
  nrow(energy_wide) == 6,
  ncol(energy_wide) == 7,
  n_distinct(energy_wide$building_id) == nrow(energy_wide),
  all(energy_wide$area_m2 > 0),
  all(vapply(energy_wide[monthly_columns], is.double, logical(1))),
  all(unlist(energy_wide[monthly_columns]) > 0, na.rm = TRUE),
  sum(is.na(energy_wide[monthly_columns])) == 2,
  nrow(parse_issues) == 0
)

cat("Week 9 import contract passed.\n")
