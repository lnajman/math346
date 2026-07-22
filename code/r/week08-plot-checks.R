# MATH 346 - Week 8
# Distribution and covariation plots with executable data checks

library(dplyr)
library(ggplot2)

diamonds_eda <- diamonds |> as_tibble()

price_histogram <- ggplot(diamonds_eda, aes(x = price)) +
  geom_histogram(binwidth = 500, boundary = 0) +
  labs(x = "Price (US dollars)", y = "Number of diamonds")

cut_bar_plot <- ggplot(diamonds_eda, aes(x = cut)) +
  geom_bar() +
  labs(x = "Cut quality", y = "Number of diamonds")

carat_price_plot <- ggplot(diamonds_eda, aes(x = carat, y = price)) +
  geom_point(alpha = 0.08, size = 0.7) +
  labs(x = "Weight (carats)", y = "Price (US dollars)")

price_by_cut_plot <- ggplot(diamonds_eda, aes(x = cut, y = price)) +
  geom_boxplot(outlier.alpha = 0.15) +
  labs(x = "Cut quality", y = "Price (US dollars)")

histogram_data <- ggplot_build(price_histogram)$data[[1]]
bar_data <- ggplot_build(cut_bar_plot)$data[[1]]
scatter_data <- ggplot_build(carat_price_plot)$data[[1]]
boxplot_data <- ggplot_build(price_by_cut_plot)$data[[1]]

stopifnot(
  sum(histogram_data$count) == nrow(diamonds_eda),
  sum(bar_data$count) == nrow(diamonds_eda),
  nrow(bar_data) == nlevels(diamonds_eda$cut),
  nrow(scatter_data) == nrow(diamonds_eda),
  nrow(boxplot_data) == nlevels(diamonds_eda$cut),
  identical(carat_price_plot$labels$x, "Weight (carats)"),
  identical(carat_price_plot$labels$y, "Price (US dollars)")
)

print(price_histogram)
print(cut_bar_plot)
print(carat_price_plot)
print(price_by_cut_plot)

cat("Histogram observations counted:", sum(histogram_data$count), "\n")
cat("Scatterplot observations checked:", nrow(scatter_data), "\n")
cat("All Week 8 plot checks passed.\n")
