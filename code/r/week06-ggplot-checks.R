# MATH 346 - Week 6
# A ggplot2 workflow with data, label, and interpretation checks

library(ggplot2)

cars <- mtcars
cars$car <- rownames(mtcars)
rownames(cars) <- NULL

scatter_plot <- ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point(size = 2.4, alpha = 0.8, color = "#2A6F97") +
  labs(
    title = "Heavier cars tend to have lower fuel efficiency",
    subtitle = "Thirty-two 1973-1974 car models in the mtcars data",
    x = "Weight (1000 lb)",
    y = "Fuel efficiency (miles per US gallon)",
    caption = "Association in this dataset; this plot does not establish causation."
  ) +
  theme_minimal(base_size = 12)

histogram_plot <- ggplot(cars, aes(x = mpg)) +
  geom_histogram(
    binwidth = 3,
    boundary = 0,
    color = "white",
    fill = "#E76F51"
  ) +
  labs(
    title = "Distribution of fuel efficiency",
    x = "Fuel efficiency (miles per US gallon)",
    y = "Number of car models"
  ) +
  theme_minimal(base_size = 12)

scatter_data <- ggplot_build(scatter_plot)$data[[1]]
histogram_data <- ggplot_build(histogram_plot)$data[[1]]

stopifnot(
  nrow(scatter_data) == nrow(cars),
  sum(scatter_data$x == cars$wt) == nrow(cars),
  sum(scatter_data$y == cars$mpg) == nrow(cars),
  identical(scatter_plot$labels$x, "Weight (1000 lb)"),
  identical(
    scatter_plot$labels$y,
    "Fuel efficiency (miles per US gallon)"
  ),
  sum(histogram_data$count) == nrow(cars)
)

print(scatter_plot)
print(histogram_plot)

cat("Scatterplot rows checked:", nrow(scatter_data), "\n")
cat("Histogram observations counted:", sum(histogram_data$count), "\n")
cat("All Week 6 ggplot checks passed.\n")
