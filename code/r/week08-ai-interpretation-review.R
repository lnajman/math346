# MATH 346 - Week 8
# AI interpretation critique starter
#
# The plot runs, but its design and the generated interpretation need review.

library(ggplot2)

generated_plot <- ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  labs(
    title = "Carat determines diamond price",
    x = "Carat",
    y = "Price"
  )

print(generated_plot)

generated_interpretation <- paste(
  "The plot proves that increasing carat causes price to rise by a fixed amount.",
  "All diamonds follow the same pattern, so cut, color, and clarity do not matter.",
  "There are no unusual observations or data-quality concerns."
)

cat(generated_interpretation, "\n")

plot_data <- ggplot_build(generated_plot)$data[[1]]
stopifnot(nrow(plot_data) == nrow(diamonds))

# Review questions:
# 1. Does a scatterplot establish causation or a fixed rate of change?
# 2. What variation remains among diamonds with similar carat values?
# 3. How does overplotting hide density in the generated figure?
# 4. Which additional variables might refine the question?
# 5. Do zero recorded dimensions or extreme measurements require inspection?
# 6. Which claims should be rewritten as observations, questions, or doubts?
