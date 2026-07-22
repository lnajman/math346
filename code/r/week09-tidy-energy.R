# MATH 346 - Week 9
# Reshape the supplied campus-energy data and validate its observation key

library(dplyr)
library(ggplot2)
library(readr)
library(tidyr)

data_path <- "data/week09-campus-energy-wide.csv"
stopifnot(file.exists(data_path))

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

month_order <- c("jan", "feb", "mar", "apr")

energy_tidy <- energy_wide |>
  pivot_longer(
    cols = ends_with("_kwh"),
    names_to = "month",
    names_pattern = "(.*)_kwh",
    values_to = "energy_kwh"
  ) |>
  mutate(month_number = match(month, month_order)) |>
  arrange(building_id, month_number) |>
  select(
    building_id, building_type, area_m2,
    month, month_number, energy_kwh
  )

key_counts <- energy_tidy |>
  count(building_id, month, name = "key_count")

monthly_summary <- energy_tidy |>
  group_by(month, month_number) |>
  summarize(
    expected_buildings = n(),
    observed_buildings = sum(!is.na(energy_kwh)),
    missing_buildings = sum(is.na(energy_kwh)),
    total_energy_kwh = sum(energy_kwh, na.rm = TRUE),
    .groups = "drop"
  ) |>
  arrange(month_number)

print(energy_tidy)
print(monthly_summary)

stopifnot(
  nrow(energy_tidy) == 24,
  ncol(energy_tidy) == 6,
  n_distinct(energy_tidy$building_id) == 6,
  identical(sort(unique(energy_tidy$month_number)), 1:4),
  !anyNA(energy_tidy$month_number),
  all(energy_tidy$energy_kwh > 0, na.rm = TRUE),
  all(key_counts$key_count == 1),
  nrow(key_counts) == nrow(energy_tidy),
  sum(is.na(energy_tidy$energy_kwh)) == 2,
  nrow(monthly_summary) == 4,
  all(monthly_summary$expected_buildings == 6),
  sum(monthly_summary$missing_buildings) == 2,
  all(monthly_summary$observed_buildings +
    monthly_summary$missing_buildings == 6)
)

monthly_plot <- ggplot(
  monthly_summary,
  aes(x = reorder(month, month_number), y = total_energy_kwh)
) +
  geom_col(fill = "#2A6F97") +
  labs(
    title = "Recorded campus energy total by month",
    subtitle = "Six fictional buildings; missing building-month values are not imputed",
    x = "Month",
    y = "Recorded energy total (kWh)",
    caption = "Synthetic teaching data. Monthly totals use available observations only."
  ) +
  theme_minimal(base_size = 12)

plot_data <- ggplot_build(monthly_plot)$data[[1]]
stopifnot(nrow(plot_data) == nrow(monthly_summary))

print(monthly_plot)
cat("Week 9 tidy-data checks passed.\n")
