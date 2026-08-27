#!/usr/bin/env python3
"""Build intentionally incomplete starter scripts for the guided MATH 346 labs."""

from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


MATLAB = {
    "week01_arrays_plotting": (
        "Arrays, scripts, and 2D plotting",
        "n_points = 200;\n% TODO: create x on [0, 2*pi], then compute sin(x) and cos(x).",
        ["Plot both functions against x with labels and a legend.", "Compute the maximum error in sin(x)^2 + cos(x)^2 = 1.", "Repeat with a different domain and sample count."],
    ),
    "week01_temperature_matrix": (
        "Matrix columns as measured variables",
        "measurements = [\n    0 22.1 45; 1 22.7 44; 2 23.4 43; 3 24.0 41;\n    4 24.3 40; 5 24.1 42; 6 23.5 46\n];\n% Columns: time (hours), temperature (C), humidity (%).",
        ["Extract each column with indexing.", "Plot both measured variables against time and label the figure.", "Compute and report the mean temperature and maximum humidity."],
    ),
    "week01_matrix_systems": (
        "Matrix operations and linear-system checks",
        "A = [2 1; 1 3];\nb = [1; 2];\nB = [1 2; 3 4];\nC = [10 20; 30 40];",
        ["Solve A*x = b without forming inv(A).", "Compute and interpret a residual norm.", "Compare B*C with B.*C and select one row and one column."],
    ),
    "week02_function_tests": (
        "Functions, vectorized formulas, and tests",
        "values = [-2 -1 0 1 2];",
        ["Write a local quadratic-value function that accepts vector input.", "Call it on values and check a known value.", "Add normal, boundary, and vector-shape tests."],
    ),
    "week02_piecewise_validation": (
        "Piecewise rules and boundary tests",
        "test_ages = [0 5 6 17 18 64 65];\nexpected_prices = [0 0 20 20 35 35 25];",
        ["Write the ticket_price local function.", "Evaluate every boundary case.", "Compare actual and expected outputs and reject invalid input."],
    ),
    "week02_loop_patterns": (
        "Loops, accumulators, and vectorization checks",
        "values = [1 2 3 4 5];",
        ["Preallocate and fill a vector of squares with a for loop.", "Compute the same result vectorially and compare it.", "Use an accumulator, then test a while-loop stopping condition."],
    ),
    "week02_logical_indexing_switch": (
        "Logical indexing and switch patterns",
        "temperatures = [18 21 25 29 34 31 22];",
        ["Create a logical selector for hot days and extract the values.", "Check the selector has one value per observation.", "Use switch to produce a message for a supplied category."],
    ),
    "week03_curve_fitting_validation": (
        "Polynomial fits and residual evidence",
        "x = 0:10;\ny = [2.0 2.8 3.6 5.1 6.9 8.2 9.1 10.2 10.7 11.1 11.4];\ndegrees = [1 2 5];",
        ["Fit each candidate degree and retain predictions and residuals.", "Compute RMSE for each model.", "Plot the fits and residuals, then state why smallest training RMSE is insufficient."],
    ),
    "week03_interpolation_vs_fit": (
        "Interpolation compared with fitting",
        "x = 0:8;\ny = [3.0 3.8 4.3 5.9 6.5 7.1 7.8 8.0 8.4];\nx_query = [2.5 5.5];",
        ["Compute linear and shape-preserving interpolations.", "Fit a degree-2 polynomial and predict at the same points.", "Plot and compare the methods; check query points are inside the measured range."],
    ),
    "week03_polynomial_tools": (
        "Polynomial utility commands and checks",
        "roots_expected = [1 2 3];",
        ["Build polynomial coefficients from the roots and recover the roots.", "Evaluate the polynomial at the expected roots.", "Differentiate and integrate the coefficient vector and check a known value."],
    ),
    "week04_root_integration_checks": (
        "Numerical roots, integration, and validation",
        "f = @(x) x.*exp(-x) - 0.2;\ng = @(x) sin(x)./(1 + x.^2);",
        ["Plot f and locate two justified root brackets.", "Find both roots and check each residual.", "Compare integral with trapz on coarse and fine grids; interpret the differences."],
    ),
    "week04_ode_solver_check": (
        "ODE solver and initial-condition checks",
        "f = @(t, y) -y + sin(t);\ntspan = [0 10];\ny0 = 1;",
        ["Solve with ode45 and verify the initial condition.", "Plot the solution with labels.", "Request a specified output grid and compare the final values."],
    ),
    "week04_surface_contour_visualization": (
        "Surface and contour visualization checks",
        "x = linspace(-3, 3, 121);\ny = linspace(-3, 3, 121);",
        ["Use meshgrid to form compatible coordinate arrays.", "Evaluate the supplied surface formula from the lab.", "Create labeled surface and contour plots and check all array sizes."],
    ),
    "week05_symbolic_numeric_bridge": (
        "Exact symbolic input and numerical evidence",
        "syms x real",
        ["Compare exact one third with a finite decimal entered symbolically.", "Use vpa only after retaining the exact expression.", "Solve a symbolic equation numerically and check the residual."],
    ),
    "week05_symbolic_calculus_checks": (
        "Symbolic calculus with independent checks",
        "syms x real\nf = x^2 * exp(-x);",
        ["Differentiate and integrate f.", "Reverse each operation with simplify and record the result.", "Evaluate at a test value and compare with an independent numerical calculation."],
    ),
    "week05_tank_optimization": (
        "Fixed-volume cylindrical tank optimization",
        "syms r V positive",
        ["Derive height and surface area from the volume constraint.", "Find and classify the positive stationary point.", "Substitute a required volume and verify the minimum numerically."],
    ),
}


R = {
    "week06-r-basics": ("First R objects and checks", "cars <- mtcars\ncars$car <- rownames(mtcars)\nrownames(cars) <- NULL", ["Inspect class, dimensions, names, and missing values.", "Create and check a logical selector.", "Compute transparent group summaries and verify row accounting."]),
    "week06-ggplot-checks": ("Checked ggplot objects", "library(ggplot2)\ncars <- mtcars", ["Build a labeled scatterplot of weight and fuel efficiency.", "Build a histogram with a declared bin width.", "Use ggplot_build to check how many observations each plot represents."]),
    "week07-verb-checks": ("One transformation verb at a time", "library(dplyr)\nair <- as_tibble(airquality)", ["Rename variables and check names.", "Select, filter, and mutate one step at a time.", "After every verb, record the row or column invariant that should hold."]),
    "week07-dplyr-eda": ("A checked transformation pipeline", "library(dplyr)\nlibrary(ggplot2)\nair <- as_tibble(airquality)", ["Define the analysis rows before grouping.", "Create the temperature groups specified in the lab.", "Summarize ozone with explicit denominators and build a checked figure."]),
    "week08-eda-cycle": ("A checked exploratory-data-analysis cycle", "library(dplyr)\nlibrary(ggplot2)\ndiamonds_raw <- as_tibble(diamonds)", ["Create an EDA log and audit structure, missingness, and impossible dimensions.", "Explore price variation and carat-price covariation.", "Refine by a categorical variable and document anomalies and limitations."]),
    "week08-plot-checks": ("Executable checks for EDA plots", "library(dplyr)\nlibrary(ggplot2)\ndiamonds_eda <- as_tibble(diamonds)", ["Build a price histogram and verify the represented count.", "Build a carat-price plot that addresses overplotting.", "Check plot-layer rows and axis variables before interpretation."]),
    "week09-import-contract": ("Explicit CSV import contract", "library(dplyr)\nlibrary(readr)\ndata_path <- \"data/week09-campus-energy-wide.csv\"\nstopifnot(file.exists(data_path))", ["Declare the expected names and column types.", "Import the file and validate schema, row count, and key uniqueness.", "Make missingness and parsing problems visible."]),
    "week09-tidy-energy": ("Tidy-data reshaping and key checks", "library(dplyr)\nlibrary(ggplot2)\nlibrary(readr)\nlibrary(tidyr)\ndata_path <- \"data/week09-campus-energy-wide.csv\"", ["Import with the Week 9 contract.", "Reshape month columns to one observation per building-month.", "Check the observation key, summarize without hiding missingness, and make a checked plot."]),
    "week10-clean-types": ("Strings, factors, and date-times", "library(readr)\nlibrary(dplyr)\nlibrary(stringr)\nlibrary(lubridate)\nevents_path <- \"data/week10-service-events.csv\"", ["Import all raw fields with declared types.", "Normalize building identifiers and issue labels.", "Create the ordered severity factor, parse date-times, and validate every conversion."]),
    "week10-join-audit": ("Join contracts and unmatched rows", "library(readr)\nlibrary(dplyr)\nlibrary(stringr)\nlibrary(lubridate)\nregistry_path <- \"data/week10-building-registry.csv\"\nevents_path <- \"data/week10-service-events.csv\"", ["Check both keys before joining.", "Use anti_join to account for unmatched rows.", "Declare the relationship, join, and verify the observation unit and row count are preserved."]),
    "week11-readable-pipeline": ("Readable pipelines with checkpoints", "library(readr)\nlibrary(dplyr)\nlibrary(stringr)\nlibrary(lubridate)\nevents_path <- \"data/week10-service-events.csv\"", ["Name the raw, cleaned, typed, and analysis stages.", "Add a meaningful check after every stage.", "Rerun from a clean session and explain where the pipeline should stop on failure."]),
    "week11-function-contracts": ("Small functions with explicit contracts", "library(readr)\nlibrary(dplyr)\nlibrary(stringr)\nlibrary(lubridate)", ["Write the cleaning and validation functions specified in the lab.", "Test normal, boundary, missing, and invalid inputs.", "Confirm the refactored pipeline preserves the earlier behavior."]),
    "week12-vectorized-iteration": ("Vectorization and typed iteration", "library(dplyr)\ndata <- airquality |> mutate(day_id = row_number())\nvariables <- c(\"Ozone\", \"Solar.R\", \"Wind\", \"Temp\")", ["Use vectorization for an elementwise calculation.", "Compare a preallocated loop with typed apply for repeated summaries.", "Check output length, names, and types explicitly."]),
    "week12-repeated-workflow": ("Repeated workflows with visible failures", "library(dplyr)\ndata <- airquality |> mutate(month_label = month.abb[Month])", ["Write and test the single-variable summary function.", "Run it over a declared request list.", "Return one status row per request, including failures, and verify none disappear."]),
    "week13-simple-linear-model": ("A model contract and baseline comparison", "library(dplyr)\nlibrary(ggplot2)", ["Build a complete-case model table with a stable observation identifier.", "Fit ozone on temperature and retain row-aligned predictions and residuals.", "Compare training error with a mean baseline and write a bounded claim."]),
    "week13-model-diagnostics": ("Residual and influence evidence", "library(dplyr)\nlibrary(ggplot2)", ["Fit the declared additive model on a checked analysis table.", "Compute residual and influence diagnostics with row identifiers.", "Plot diagnostic evidence and state what changes your confidence."]),
    "week14-many-models": ("One fixed model contract across groups", "library(dplyr)\nlibrary(ggplot2)", ["Define one function that fits the fixed formula to one month.", "Apply it to every month while retaining each model and aligned summary.", "Compare coefficients with uncertainty; do not rank models by training error alone."]),
    "week14-grouped-sensitivity": ("Grouped diagnostics and sensitivity", "library(dplyr)", ["Repeat the same diagnostic contract for every monthly model.", "Run the declared sensitivity analysis without silently changing the model contract.", "Identify conclusions that are stable and conclusions that are fragile."]),
    "week15-evidence-bundle": ("Generate a reproducible evidence bundle", "library(dplyr)\nlibrary(ggplot2)", ["Fit the declared model from a clean analysis table.", "Generate exact results, row-aligned predictions, and a checked figure from one run.", "Write files only after validating their schemas and row counts."]),
    "week15-cross-artifact-audit": ("Reconcile results across artifacts", "library(dplyr)", ["Read or recreate the evidence bundle.", "Compare report claims with exact result values and row-level predictions.", "Flag disagreements in values, rounding, labels, captions, or observation counts."]),
}


def matlab_text(title: str, setup: str, tasks: list[str]) -> str:
    lines = [
        "% MATH 346 - guided lab starter",
        f"% {title}",
        "% This file is intentionally incomplete. Follow the lab page and replace",
        "% every TODO with your own code before consulting the worked solution.",
        "",
        "clear; clc; close all;",
        "",
        "%% Given setup",
        setup,
    ]
    for number, task in enumerate(tasks, 1):
        lines.extend(["", f"%% Task {number}", f"% {task}", "% TODO: write and check your code here."])
    lines.extend(["", "%% Reflection", "% TODO: explain which evidence makes the result trustworthy.", ""])
    return "\n".join(lines)


def r_text(title: str, setup: str, tasks: list[str]) -> str:
    lines = [
        "# MATH 346 - guided lab starter",
        f"# {title}",
        "# This file is intentionally incomplete. Follow the lab page and replace",
        "# every TODO with your own code before consulting the worked solution.",
        "",
        "# Given setup",
        setup,
    ]
    for number, task in enumerate(tasks, 1):
        lines.extend(["", f"# Task {number}", f"# {task}", "# TODO: write and check your code here."])
    lines.extend(["", "# Reflection", "# TODO: explain which evidence makes the result trustworthy.", ""])
    return "\n".join(lines)


def main() -> None:
    matlab_dir = ROOT / "code" / "matlab"
    r_dir = ROOT / "code" / "r"
    matlab_dir.mkdir(parents=True, exist_ok=True)
    r_dir.mkdir(parents=True, exist_ok=True)

    for stem, values in MATLAB.items():
        target = matlab_dir / f"{stem}.m"
        target.write_text(matlab_text(*values), encoding="utf-8")

    for stem, values in R.items():
        target = r_dir / f"{stem}.R"
        target.write_text(r_text(*values), encoding="utf-8")

    print(f"Built {len(MATLAB)} MATLAB and {len(R)} R lab starters.")


if __name__ == "__main__":
    main()
