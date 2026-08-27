#!/usr/bin/env python3
"""Validate the public starter/solution contract for guided lab code."""

from pathlib import Path
import runpy


ROOT = Path(__file__).resolve().parents[1]
definitions = runpy.run_path(str(ROOT / "scripts" / "build_lab_starters.py"))
matlab = definitions["MATLAB"]
r_scripts = definitions["R"]
errors: list[str] = []


def check_pair(starter: Path, solution: Path, comment: str) -> None:
    if not starter.is_file():
        errors.append(f"missing starter: {starter.relative_to(ROOT)}")
        return
    if not solution.is_file():
        errors.append(f"missing solution: {solution.relative_to(ROOT)}")
        return

    starter_text = starter.read_text(encoding="utf-8")
    solution_text = solution.read_text(encoding="utf-8")
    if starter_text.count("TODO") < 4:
        errors.append(f"starter has too few TODO prompts: {starter.relative_to(ROOT)}")
    if "intentionally incomplete" not in starter_text:
        errors.append(f"starter is not labeled incomplete: {starter.relative_to(ROOT)}")
    if comment not in solution_text:
        errors.append(f"solution is not labeled: {solution.relative_to(ROOT)}")
    if starter_text == solution_text:
        errors.append(f"starter duplicates solution: {starter.relative_to(ROOT)}")


for stem in matlab:
    check_pair(
        ROOT / "code" / "matlab" / f"{stem}.m",
        ROOT / "code" / "matlab" / "solutions" / f"{stem}.m",
        "Possible worked solution",
    )

for stem in r_scripts:
    check_pair(
        ROOT / "code" / "r" / f"{stem}.R",
        ROOT / "code" / "r" / "solutions" / f"{stem}.R",
        "possible worked solution",
    )

code_index = (ROOT / "code" / "index.qmd").read_text(encoding="utf-8")
for stem in matlab:
    for expected in (f"matlab/{stem}.m", f"matlab/solutions/{stem}.m"):
        if expected not in code_index:
            errors.append(f"code index does not expose paired file: {expected}")
for stem in r_scripts:
    for expected in (f"r/{stem}.R", f"r/solutions/{stem}.R"):
        if expected not in code_index:
            errors.append(f"code index does not expose paired file: {expected}")

main_labs = [
    path
    for path in sorted((ROOT / "labs").glob("lab-*.qmd"))
    if "-ai-" not in path.name
]
main_lab_text = "\n".join(path.read_text(encoding="utf-8") for path in main_labs)
for lab in main_labs:
    text = lab.read_text(encoding="utf-8")
    if "include _starter-solution-note.qmd" not in text:
        errors.append(f"guided lab lacks starter/solution note: {lab.relative_to(ROOT)}")

for stem in matlab:
    expected = f"../code/matlab/solutions/{stem}.m"
    if expected not in main_lab_text:
        errors.append(f"guided labs do not link directly to solution: {expected}")

for lab in sorted((ROOT / "labs").glob("lab-*.qmd")):
    lines = lab.read_text(encoding="utf-8").splitlines()
    if "## Deliverable" in lines:
        errors.append(f"lab retains routine deliverable heading: {lab.relative_to(ROOT)}")
    if any(line.startswith("Submit") for line in lines):
        errors.append(f"lab retains routine submission instruction: {lab.relative_to(ROOT)}")

lab_index = (ROOT / "labs" / "index.qmd").read_text(encoding="utf-8")
if "Labs are not routinely submitted or graded" not in lab_index:
    errors.append("lab index does not state the formative non-submission policy")
for stem in r_scripts:
    expected = f"../code/r/solutions/{stem}.R"
    if expected not in main_lab_text:
        errors.append(f"guided labs do not link directly to solution: {expected}")

if errors:
    print("Starter/solution validation failed:")
    for error in errors:
        print(f"- {error}")
    raise SystemExit(1)

print(
    f"Starter/solution validation: {len(matlab)} MATLAB pairs, "
    f"{len(r_scripts)} R pairs, and {len(main_labs)} guided labs are consistent."
)
