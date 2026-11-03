# MATH 346 - possible worked solution
# Compare only after attempting the starter; other correct implementations are possible.

# MATH 346 - Week 7
# One transformation verb at a time, with a check after every step

library(dplyr)

air <- airquality |>
  as_tibble() |>
  rename(
    ozone_ppb = Ozone,
    wind_mph = Wind,
    temp_f = Temp,
    month = Month,
    day = Day
  )

selected <- air |>
  select(month, day, ozone_ppb, temp_f, wind_mph)

warm_days <- selected |>
  filter(temp_f >= 80)

with_celsius <- warm_days |>
  mutate(temp_c = (temp_f - 32) * 5 / 9)

ordered_ozone <- with_celsius |>
  arrange(desc(ozone_ppb))

warm_month_counts <- with_celsius |>
  count(month, name = "n_warm_days") |>
  arrange(month)

stopifnot(
  nrow(selected) == nrow(air),
  identical(names(selected), c("month", "day", "ozone_ppb", "temp_f", "wind_mph")),
  nrow(warm_days) <= nrow(selected),
  nrow(warm_days) == 73,
  nrow(with_celsius) == nrow(warm_days),
  "temp_c" %in% names(with_celsius),
  all(abs(with_celsius$temp_c - (with_celsius$temp_f - 32) * 5 / 9) < 1e-12),
  sum(warm_month_counts$n_warm_days) == nrow(warm_days),
  all(diff(ordered_ozone$ozone_ppb[!is.na(ordered_ozone$ozone_ppb)]) <= 0)
)

print(warm_month_counts)
cat("select: rows preserved =", nrow(selected), "\n")
cat("filter: warm rows retained =", nrow(warm_days), "\n")
cat("mutate: Celsius variable checked for every retained row.\n")
cat("arrange: observed ozone values are in descending order.\n")
cat("All one-verb checks passed.\n")
