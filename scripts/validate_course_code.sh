#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR" || exit 1

export LANG="${MATH346_LANG:-en_US.UTF-8}"
export LC_ALL="${MATH346_LC_ALL:-en_US.UTF-8}"

run_r=1
run_matlab=1

usage() {
  cat <<'USAGE'
Usage: scripts/validate_course_code.sh [--r-only|--matlab-only|--skip-r|--skip-matlab]

Runs the executable course-code checks:
  - R scripts in code/r
  - MATLAB starter scripts in code/matlab

The MATLAB validator separates ordinary starter scripts from intentionally
weak AI critique scripts.
USAGE
}

for arg in "$@"; do
  case "$arg" in
    --r-only)
      run_r=1
      run_matlab=0
      ;;
    --matlab-only)
      run_r=0
      run_matlab=1
      ;;
    --skip-r)
      run_r=0
      ;;
    --skip-matlab)
      run_matlab=0
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      usage >&2
      exit 2
      ;;
  esac
done

status=0

if [ "$run_r" -eq 1 ]; then
  echo "== R validation =="
  scripts/validate_r_scripts.sh || status=1
fi

if [ "$run_matlab" -eq 1 ]; then
  echo "== MATLAB validation =="
  scripts/validate_matlab_scripts.sh || status=1
fi

if [ "$status" -eq 0 ]; then
  echo "Course-code validation: ok"
else
  echo "Course-code validation: failed" >&2
fi

exit "$status"
