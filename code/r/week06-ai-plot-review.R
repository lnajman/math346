# MATH 346 - Week 6
# AI plot critique starter
#
# This plot runs, but its labels and conclusion are not yet defensible.

library(ggplot2)

generated_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "red") +
  labs(
    title = "Heavy cars cause poor fuel economy",
    x = "Weight",
    y = "Efficiency"
  )

print(generated_plot)

cat("Generated-code claim: heavy cars cause poor fuel economy.\n")

# Review questions:
# 1. What units are missing from the axes?
# 2. Does an observational scatterplot establish causation?
# 3. Which cars and years does mtcars describe?
# 4. Were missing values, row count, and variable ranges checked?
# 5. What caption would accurately describe only what the plot supports?
