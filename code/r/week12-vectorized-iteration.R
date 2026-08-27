# MATH 346 - guided lab starter
# Vectorization and typed iteration
# This file is intentionally incomplete. Follow the lab page and replace
# every TODO with your own code before consulting the worked solution.

# Given setup
library(dplyr)
data <- airquality |> mutate(day_id = row_number())
variables <- c("Ozone", "Solar.R", "Wind", "Temp")

# Task 1
# Use vectorization for an elementwise calculation.
# TODO: write and check your code here.

# Task 2
# Compare a preallocated loop with typed apply for repeated summaries.
# TODO: write and check your code here.

# Task 3
# Check output length, names, and types explicitly.
# TODO: write and check your code here.

# Reflection
# TODO: explain which evidence makes the result trustworthy.
