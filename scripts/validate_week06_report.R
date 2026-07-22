report_path <- "code/r/week06-first-report.qmd.txt"
lines <- readLines(report_path, warn = FALSE)

in_r_chunk <- FALSE
code <- character()

for (line in lines) {
  if (!in_r_chunk && grepl("^```\\{r", line)) {
    in_r_chunk <- TRUE
    next
  }

  if (in_r_chunk && grepl("^```\\s*$", line)) {
    in_r_chunk <- FALSE
    code <- c(code, "")
    next
  }

  if (in_r_chunk && !grepl("^#\\|", line)) {
    code <- c(code, line)
  }
}

stopifnot(
  length(code) > 0,
  !in_r_chunk
)

options(device = function(...) grDevices::pdf(file = tempfile(fileext = ".pdf")))
report_environment <- new.env(parent = globalenv())
eval(parse(text = paste(code, collapse = "\n")), envir = report_environment)

cat("Week 6 starter report code passed.\n")
