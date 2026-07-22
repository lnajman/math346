# MATH 346 - Week 8
# A checked exploratory data analysis cycle using ggplot2::diamonds

library(dplyr)
library(ggplot2)

diamonds_raw <- diamonds |> as_tibble()

diamonds_eda <- diamonds_raw |>
  mutate(
    dimension_issue = x <= 0 | y <= 0 | z <= 0
  )

structure_audit <- data.frame(
  quantity = c(
    "rows",
    "original variables",
    "missing values",
    "rows with a nonpositive dimension"
  ),
  value = c(
    nrow(diamonds_eda),
    ncol(diamonds_raw),
    sum(is.na(diamonds_raw)),
    sum(diamonds_eda$dimension_issue)
  )
)

price_summary <- diamonds_eda |>
  summarize(
    n = n(),
    minimum_usd = min(price),
    first_quartile_usd = quantile(price, 0.25),
    median_usd = median(price),
    mean_usd = mean(price),
    third_quartile_usd = quantile(price, 0.75),
    maximum_usd = max(price)
  )

cut_summary <- diamonds_eda |>
  count(cut, name = "n_diamonds") |>
  mutate(proportion = n_diamonds / sum(n_diamonds))

price_by_cut <- diamonds_eda |>
  group_by(cut) |>
  summarize(
    n_diamonds = n(),
    median_carat = median(carat),
    median_price_usd = median(price),
    .groups = "drop"
  )

dimension_issues <- diamonds_eda |>
  filter(dimension_issue) |>
  select(carat, price, cut, x, y, z)

print(structure_audit)
print(price_summary)
print(cut_summary)
print(price_by_cut)
print(dimension_issues)

price_histogram <- ggplot(diamonds_eda, aes(x = price)) +
  geom_histogram(binwidth = 500, boundary = 0, color = "white", fill = "#2A6F97") +
  labs(
    title = "Diamond prices are strongly right-skewed",
    x = "Price (US dollars)",
    y = "Number of diamonds",
    caption = "Bin width: $500. Data: ggplot2::diamonds."
  ) +
  theme_minimal(base_size = 12)

carat_price_plot <- ggplot(diamonds_eda, aes(x = carat, y = price)) +
  geom_point(alpha = 0.08, size = 0.7, color = "#264653") +
  labs(
    title = "Price generally increases with carat, with substantial variation",
    x = "Weight (carats)",
    y = "Price (US dollars)",
    caption = "Transparency reveals point density; the plot is descriptive, not causal."
  ) +
  theme_minimal(base_size = 12)

histogram_data <- ggplot_build(price_histogram)$data[[1]]
scatter_data <- ggplot_build(carat_price_plot)$data[[1]]

stopifnot(
  nrow(diamonds_eda) == 53940,
  ncol(diamonds_raw) == 10,
  ncol(diamonds_eda) == 11,
  sum(is.na(diamonds_eda)) == 0,
  sum(diamonds_eda$dimension_issue) == 20,
  nrow(cut_summary) == 5,
  sum(cut_summary$n_diamonds) == nrow(diamonds_eda),
  abs(sum(cut_summary$proportion) - 1) < 1e-12,
  nrow(price_by_cut) == 5,
  sum(price_by_cut$n_diamonds) == nrow(diamonds_eda),
  sum(histogram_data$count) == nrow(diamonds_eda),
  nrow(scatter_data) == nrow(diamonds_eda)
)

print(price_histogram)
print(carat_price_plot)
cat("Rows with nonpositive dimensions:", nrow(dimension_issues), "\n")
cat("All Week 8 EDA checks passed.\n")
