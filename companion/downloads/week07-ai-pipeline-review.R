# MATH 346 - Week 7
# AI pipeline critique starter
#
# Prompt: "Compare observed ozone on cooler and warmer days."
# The generated code runs, but it answers a different question.

library(dplyr)

ai_pipeline <- airquality |>
  as_tibble() |>
  filter(Temp >= 80, !is.na(Ozone)) |>
  group_by(Month) |>
  summarize(
    n_days = n(),
    mean_ozone = mean(Ozone),
    .groups = "drop"
  )

print(ai_pipeline)

stopifnot(
  nrow(ai_pipeline) > 0,
  !anyNA(ai_pipeline),
  sum(ai_pipeline$n_days) == 57
)

cat("The generated pipeline runs and produces plausible numbers.\n")
cat("It keeps only warmer days and groups by month, so it cannot compare cooler and warmer days.\n")

# Review questions:
# 1. Which rows were removed before any comparison was made?
# 2. Is Month the grouping variable requested by the prompt?
# 3. What derived variable would represent the two requested groups?
# 4. How many rows have missing ozone, and where should that be documented?
# 5. Which counts should add back to the number of usable rows?
