"""Rebuild and validate the approved Week 11 companion's public HTML bundle.

Run from any directory with Python 3, Quarto, R and the course R packages.
Only the rendered HTML and six allowlisted teaching downloads are published.
The standalone source project stays outside the website render inputs.
"""
from pathlib import Path
import os
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent
SOURCE = ROOT / "companion-review"
PUBLIC = ROOT / "companion"
env = dict(os.environ, LANG="en_US.UTF-8", LC_ALL="en_US.UTF-8")
subprocess.run(["quarto", "render", str(SOURCE)], cwd=ROOT, env=env, check=True)
subprocess.run([sys.executable, str(SOURCE / "check_pilot.py")], cwd=ROOT, check=True)
files = ["week-11.html", "downloads/week10-service-events.csv",
         "downloads/week11-readable-pipeline.R", "downloads/week11-function-contracts.R",
         "downloads/week11-ai-refactor-review.R",
         "downloads/solutions/week11-readable-pipeline_sol.R",
         "downloads/solutions/week11-function-contracts_sol.R"]
for name in files:
    destination = PUBLIC / name
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(SOURCE / "_preview" / name, destination)
actual = {str(p.relative_to(PUBLIC)) for p in PUBLIC.rglob("*") if p.is_file()}
assert actual == set(files), f"Unexpected public companion files: {actual - set(files)}"
print("Prepared companion/week-11.html and six public teaching downloads.")
