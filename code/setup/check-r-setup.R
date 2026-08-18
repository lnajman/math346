# MATH 346 R and Quarto setup check
# Run this script on every computer that you plan to use for the course.

cat("MATH 346 R setup check\n")
cat("R:", R.version.string, "\n")

required_packages <- c(
  "dplyr", "ggplot2", "readr", "tidyr", "stringr", "lubridate"
)

available <- vapply(
  required_packages,
  requireNamespace,
  quietly = TRUE,
  FUN.VALUE = logical(1)
)

if (!all(available)) {
  missing_packages <- required_packages[!available]
  cat("R package check: ACTION REQUIRED\n")
  cat("Missing:", paste(missing_packages, collapse = ", "), "\n")
  cat(
    "Install them with:\ninstall.packages(c(",
    paste(sprintf('"%s"', missing_packages), collapse = ", "),
    "))\n",
    sep = ""
  )
  stop("Install the missing packages, then run this check again.", call. = FALSE)
}

# Exercise the operations the course needs rather than only loading packages.
temporary_csv <- tempfile(fileext = ".csv")
temporary_plot <- tempfile(fileext = ".png")
on.exit(unlink(c(temporary_csv, temporary_plot)), add = TRUE)

original <- data.frame(
  observation_id = 1:4,
  building = c("A", "A", "B", "B"),
  month = c("Jan", "Feb", "Jan", "Feb"),
  energy_kwh = c(110, 105, 140, 132)
)
readr::write_csv(original, temporary_csv)
reloaded <- readr::read_csv(temporary_csv, show_col_types = FALSE)

summary_table <- reloaded |>
  dplyr::group_by(building) |>
  dplyr::summarise(mean_energy_kwh = mean(energy_kwh), .groups = "drop")

stopifnot(
  nrow(reloaded) == 4,
  nrow(summary_table) == 2,
  identical(stringr::str_to_lower("READY"), "ready"),
  lubridate::month(lubridate::ymd("2026-08-18")) == 8
)

wide <- tidyr::pivot_wider(
  dplyr::select(reloaded, -observation_id),
  names_from = month,
  values_from = energy_kwh
)
stopifnot(nrow(wide) == 2)

setup_plot <- ggplot2::ggplot(
  reloaded,
  ggplot2::aes(x = month, y = energy_kwh, group = building)
) +
  ggplot2::geom_line()
ggplot2::ggsave(temporary_plot, setup_plot, width = 4, height = 3, dpi = 100)
stopifnot(file.exists(temporary_plot), file.info(temporary_plot)$size > 0)

cat("R and required package check: PASS\n")
for (package in required_packages) {
  cat(sprintf("  %-10s %s\n", package, as.character(packageVersion(package))))
}

quarto_path <- Sys.which("quarto")
if (nzchar(quarto_path)) {
  quarto_version <- suppressWarnings(
    system2(quarto_path, "--version", stdout = TRUE, stderr = TRUE)
  )
  cat("Quarto check: PASS (", quarto_version[[1]], ")\n", sep = "")
} else {
  cat(
    "Quarto check: ACTION REQUIRED for the supplied Week 6 report scaffold.\n"
  )
}

cat("Setup check complete. Keep this output if your instructor asks for it.\n")
