#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR" || exit 1

export LANG="${MATH346_LANG:-en_US.UTF-8}"
export LC_ALL="${MATH346_LC_ALL:-en_US.UTF-8}"

if ! command -v Rscript >/dev/null 2>&1; then
  echo "Rscript was not found on PATH." >&2
  exit 1
fi

scripts=(code/r/solutions/*.R code/r/week*-ai-*.R)
if [ ! -e "${scripts[0]}" ]; then
  echo "No R scripts found in code/r."
  exit 0
fi

status=0

for script in "${scripts[@]}"; do
  echo "RUN $script"
  Rscript --vanilla -e '
args <- commandArgs(TRUE)
options(device = function(...) grDevices::pdf(file = tempfile(fileext = ".pdf")))
source(args[[1]], chdir = FALSE)
' "$script"
  rc=$?
  if [ "$rc" -eq 0 ]; then
    echo "PASS $script"
  else
    echo "FAIL $script" >&2
    status=1
  fi
done

setup_check="code/setup/check-r-setup.R"
if [ -f "$setup_check" ]; then
  echo "RUN $setup_check"
  Rscript --vanilla "$setup_check"
  rc=$?
  if [ "$rc" -eq 0 ]; then
    echo "PASS $setup_check"
  else
    echo "FAIL $setup_check" >&2
    status=1
  fi
fi

report_validator="scripts/validate_week06_report.R"
if [ -f "$report_validator" ]; then
  echo "RUN $report_validator"
  Rscript --vanilla "$report_validator"
  rc=$?
  if [ "$rc" -eq 0 ]; then
    echo "PASS $report_validator"
  else
    echo "FAIL $report_validator" >&2
    status=1
  fi
fi

rm -f Rplots.pdf
exit "$status"
