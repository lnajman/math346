#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR" || exit 1

if [ -z "${MATLAB_BIN:-}" ]; then
  for candidate in /Applications/MATLAB*.app/bin/matlab; do
    if [ -x "$candidate" ]; then
      MATLAB_BIN="$candidate"
      break
    fi
  done
fi

if [ -z "${MATLAB_BIN:-}" ]; then
  MATLAB_BIN="$(command -v matlab || true)"
fi

if [ -z "${MATLAB_BIN:-}" ]; then
  echo "MATLAB was not found. Set MATLAB_BIN=/path/to/matlab." >&2
  exit 1
fi

matlab_args=()
matlab_root="$(cd "$(dirname "$MATLAB_BIN")/.." && pwd)"
if [ -d "$matlab_root/bin/maca64" ] && [ ! -d "$matlab_root/bin/maci64" ]; then
  matlab_args=(-maca64)
elif [ "$(uname -m)" = "arm64" ] && [ -d "$matlab_root/bin/maca64" ]; then
  matlab_args=(-maca64)
fi

echo "Using MATLAB: $MATLAB_BIN"
"$MATLAB_BIN" "${matlab_args[@]}" -batch "addpath('scripts'); validate_matlab_scripts"
