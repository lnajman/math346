# MATH 346 - Week 7
# Data transformation as question-answering with dplyr

library(dplyr)
library(ggplot2)

# Daily New York air-quality measurements, May-September 1973.
air <- airquality |>
  as_tibble() |>
  rename(
    ozone_ppb = Ozone,
    solar_radiation_langleys = Solar.R,
    wind_mph = Wind,
    temp_f = Temp,
    month = Month,
    day = Day
  )

missing_audit <- air |>
  summarize(
    rows = n(),
    missing_ozone = sum(is.na(ozone_ppb)),
    missing_temperature = sum(is.na(temp_f))
  )

print(missing_audit)

# Question: How does observed ozone differ between cooler and warmer days?
# Only rows with both variables observed can answer this question.
analysis_days <- air |>
  filter(!is.na(ozone_ppb), !is.na(temp_f)) |>
  mutate(
    temp_c = (temp_f - 32) * 5 / 9,
    temperature_band = if_else(
      temp_f >= 80,
      "80 F or warmer",
      "below 80 F"
    ),
    temperature_band = factor(
      temperature_band,
      levels = c("below 80 F", "80 F or warmer")
    )
  ) |>
  select(
    month, day, ozone_ppb, temp_f, temp_c, wind_mph, temperature_band
  )

temperature_summary <- analysis_days |>
  group_by(temperature_band) |>
  summarize(
    n_days = n(),
    mean_ozone_ppb = mean(ozone_ppb),
    median_ozone_ppb = median(ozone_ppb),
    .groups = "drop"
  )

monthly_summary <- analysis_days |>
  group_by(month) |>
  summarize(
    n_days = n(),
    mean_ozone_ppb = mean(ozone_ppb),
    .groups = "drop"
  ) |>
  arrange(month)

print(temperature_summary)
print(monthly_summary)

stopifnot(
  nrow(air) == 153,
  missing_audit$missing_ozone == 37,
  missing_audit$missing_temperature == 0,
  nrow(analysis_days) == 116,
  sum(temperature_summary$n_days) == nrow(analysis_days),
  sum(monthly_summary$n_days) == nrow(analysis_days),
  nrow(temperature_summary) == 2,
  nrow(monthly_summary) == 5,
  !anyNA(temperature_summary),
  all(abs(analysis_days$temp_c - (analysis_days$temp_f - 32) * 5 / 9) < 1e-12)
)

summary_plot <- ggplot(
  temperature_summary,
  aes(x = temperature_band, y = mean_ozone_ppb)
) +
  geom_point(size = 4, color = "#2A6F97") +
  labs(
    title = "Observed ozone was higher on warmer days",
    subtitle = "Daily New York measurements with recorded ozone, May-September 1973",
    x = "Maximum daily temperature group",
    y = "Mean ozone (parts per billion)",
    caption = "Descriptive comparison only; 37 days without ozone measurements were excluded."
  ) +
  theme_minimal(base_size = 12)

plot_data <- ggplot_build(summary_plot)$data[[1]]
stopifnot(nrow(plot_data) == nrow(temperature_summary))

print(summary_plot)
cat("Rows retained for the question:", nrow(analysis_days), "of", nrow(air), "\n")
cat("All Week 7 transformation checks passed.\n")
