# MATH 346 - Week 9
# AI tidy-data critique starter
#
# The generated result has 24 rows, but it loses the observation key and keeps
# energy values as character text.

library(dplyr)
library(readr)
library(tidyr)

data_path <- "data/week09-campus-energy-wide.csv"
stopifnot(file.exists(data_path))

ai_import <- read_csv(data_path, show_col_types = FALSE)

ai_tidy <- ai_import |>
  pivot_longer(
    cols = jan_kwh:apr_kwh,
    names_to = "measurement",
    values_to = "energy_kwh",
    values_transform = list(energy_kwh = as.character)
  ) |>
  select(building_type, measurement, energy_kwh)

print(ai_tidy)

stopifnot(
  nrow(ai_tidy) == 24,
  is.character(ai_tidy$energy_kwh),
  !"building_id" %in% names(ai_tidy),
  !"area_m2" %in% names(ai_tidy)
)

cat("The generated reshape runs and returns 24 rows.\n")
cat("It drops the building identifier and area, fuses month with the unit, and stores energy as text.\n")

# Review questions:
# 1. What should one tidy row represent?
# 2. Which variables form the observation key?
# 3. Why must energy_kwh be numeric?
# 4. Which columns were discarded even though later questions may need them?
# 5. How should the month names be separated from the _kwh unit suffix?
# 6. Which checks would detect duplicated or missing building-month keys?
