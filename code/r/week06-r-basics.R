# MATH 346 - Week 6
# First R objects, vectors, data frames, and explicit checks

cars <- mtcars
cars$car <- rownames(mtcars)
rownames(cars) <- NULL

cat("Object class:", class(cars), "\n")
cat("Rows:", nrow(cars), "Columns:", ncol(cars), "\n")
print(names(cars))

mpg <- cars$mpg
weight <- cars$wt

summary_values <- data.frame(
  quantity = c(
    "number of cars",
    "missing mpg values",
    "mean mpg",
    "median weight (1000 lb)"
  ),
  value = c(
    length(mpg),
    sum(is.na(mpg)),
    mean(mpg),
    median(weight)
  )
)

print(summary_values)

median_weight <- median(weight)
lighter <- weight <= median_weight
heavier <- weight > median_weight

mean_mpg_lighter <- mean(mpg[lighter])
mean_mpg_heavier <- mean(mpg[heavier])

comparison <- data.frame(
  group = c("at or below median weight", "above median weight"),
  n = c(sum(lighter), sum(heavier)),
  mean_mpg = c(mean_mpg_lighter, mean_mpg_heavier)
)

print(comparison)

stopifnot(
  nrow(cars) == 32,
  length(mpg) == nrow(cars),
  sum(is.na(mpg)) == 0,
  all(weight > 0),
  sum(lighter) + sum(heavier) == nrow(cars),
  mean_mpg_lighter > mean_mpg_heavier
)

plot(
  weight,
  mpg,
  pch = 19,
  xlab = "Weight (1000 lb)",
  ylab = "Fuel efficiency (miles per US gallon)",
  main = "Fuel Efficiency And Vehicle Weight"
)

cat("All Week 6 basic R checks passed.\n")
