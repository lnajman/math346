# MATH 346 - Week 7
# Data transformation with dplyr

library(dplyr)
library(ggplot2)

summary_by_cyl <- mtcars |>
  as_tibble(rownames = "car") |>
  group_by(cyl) |>
  summarize(
    n = n(),
    mean_mpg = mean(mpg),
    median_hp = median(hp),
    .groups = "drop"
  )

print(summary_by_cyl)

ggplot(summary_by_cyl, aes(x = factor(cyl), y = mean_mpg)) +
  geom_col() +
  labs(
    title = "Mean fuel efficiency by cylinder count",
    x = "Cylinders",
    y = "Mean miles per gallon"
  )

