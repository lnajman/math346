# MATH 346: Mathematical and Statistical Software

This repository contains the public course website for MATH 346.

The site is built with [Quarto](https://quarto.org/) and is intended for GitHub Pages at:

https://lnajman.github.io/math346/

## Repository Policy

This repository should contain only materials that can be redistributed publicly:

- original course notes
- original Quarto slides
- original labs and assignments
- starter code
- public-domain or openly licensed datasets
- links to official references

Do not commit copyrighted textbook PDFs, publisher slides, answer keys, exams, quiz solutions, or private student material.

## Local Preview

After installing Quarto:

```bash
quarto preview
```

To render the site:

```bash
quarto render
```

## Code Validation

To run the executable course-code checks locally:

```bash
scripts/validate_course_code.sh
```

Useful variants:

```bash
scripts/validate_course_code.sh --r-only
scripts/validate_course_code.sh --matlab-only
MATLAB_BIN=/Applications/MATLAB_R2026a.app/bin/matlab scripts/validate_course_code.sh --matlab-only
```

The validation harness separates ordinary starter scripts from intentionally
weak AI critique scripts. In particular, `week02_ai_function_review.m` is
expected to fail on vector input because that failure is the point of the
debugging activity.
