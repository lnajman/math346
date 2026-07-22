library(readr)
library(dplyr)
library(stringr)

events <- read_csv(
  "data/week10-service-events.csv",
  col_types = cols(
    event_id = col_character(),
    building_key = col_character(),
    reported_at = col_character(),
    issue_label = col_character(),
    severity = col_character(),
    response_hours = col_double()
  ),
  show_col_types = FALSE
) |>
  transmute(
    event_id,
    issue = str_to_lower(str_squish(issue_label)),
    response_hours
  )

within_target_correct <- function(response_hours, target_hours = 12) {
  !is.na(response_hours) & response_hours <= target_hours
}

# Generated refactor: changes <= to < and lets missing input remain NA.
within_target_ai <- function(response_hours, target_hours = 12) {
  response_hours < target_hours
}

ordinary_input <- 4.5
boundary_and_missing <- c(12, NA_real_)

stopifnot(
  identical(within_target_ai(ordinary_input), TRUE),
  identical(
    within_target_correct(boundary_and_missing),
    c(TRUE, FALSE)
  ),
  identical(
    within_target_ai(boundary_and_missing),
    c(FALSE, NA)
  )
)

summarize_issue_correct <- function(data, issue_name) {
  data |>
    filter(issue == issue_name) |>
    summarize(
      n_events = n(),
      mean_response_hours = mean(response_hours)
    )
}

# Generated refactor: accepts issue_name but silently hard-codes "hvac".
summarize_issue_ai <- function(data, issue_name) {
  data |>
    filter(issue == "hvac") |>
    summarize(
      n_events = n(),
      mean_response_hours = mean(response_hours)
    )
}

correct_hvac <- summarize_issue_correct(events, "hvac")
generated_hvac <- summarize_issue_ai(events, "hvac")
correct_access <- summarize_issue_correct(events, "access")
generated_access <- summarize_issue_ai(events, "access")

stopifnot(
  isTRUE(all.equal(correct_hvac, generated_hvac)),
  !isTRUE(all.equal(correct_access, generated_access)),
  correct_access$n_events == 2,
  generated_access$n_events == 3
)

cat("The generated target function passes an ordinary case but fails the boundary and missing-value cases.\n")
cat("The generated summary passes for hvac but ignores the access argument.\n")
