# MATH 346 Redesign Status

Last updated: 2026-07-10

This is the durable handoff record for the course redesign. Read this file before
starting new work. A clean Git tree describes repository state; it does not
describe pedagogical progress.

## Restart Checklist

1. Read `instructor-preview.qmd` for the purpose and teaching philosophy.
2. Read `instructor-progress.qmd` for the shareable progress snapshot.
3. Read this file for decisions, constraints, and unresolved questions.
4. Inspect the latest commits and working-tree status.
5. Continue from **Next Actions** below; do not infer that an unstarted item has
   been approved.

## Current Phase

The developed Weeks 1-4 prototype has been sent to colleagues for feedback and
is now considered validated as the model for the course. The active work is
implementing the agreed project architecture and preparing synthetic datasets,
starter files, and checkers.

Weeks 5-15 remain outlines. They should not yet be described as complete course
materials.

## Confirmed Progress

- The public Quarto course-site structure is in place and deployed through
  GitHub Pages.
- The instructor preview was published and shared with colleagues to request
  feedback.
- Weeks 1-4 have developed week pages, slides, labs, exercises, and MATLAB code.
- Weeks 1-4 have been validated as the prototype pattern to continue.
- A validation harness checks the executable MATLAB and R course code and runs
  in GitHub Actions.
- Weeks 5-15 have short week pages and slide outlines, but very little of the
  supporting lab, exercise, and code material available for Weeks 1-4.

## Established Decisions and Constraints

- The course teaches MATLAB and R in an LLM-rich environment; it is not an AI
  course.
- Students must learn to test, interpret, validate, and communicate results,
  including results produced with AI assistance.
- Assessment must establish individual competence as well as support
  authentic project work.
- The anticipated enrollment is about 60 students.
- Individual oral project defenses are not operationally reasonable at that
  enrollment.
- Project 1 uses MATLAB and Project 2 uses R.
- Students receive instructor-generated, group-specific synthetic data based on
  a realistic building-energy problem.
- Students are not required to find or collect datasets.
- The readable report is a PDF. Students also submit executable source code and
  machine-readable results; Quarto and HTML are not required.
- Projects are assessed as group work. Individual competence is established by
  quizzes, the semester examination, and the final examination, totaling 80%
  of the course grade.
- There is no mandatory individual project examination. A brief verification
  may be requested for a small random sample or when submitted evidence contains
  a material inconsistency.
- A project–examination grade difference may prompt review but is not sufficient
  evidence of misconduct by itself.
- Blackboard is the course platform for group setup, release, submission, and
  grading.

## Open Decisions

These ideas have been discussed but are **not yet approved course policy**:

1. The number, timing, and exact format of the quizzes.
2. The balance of code reading, implementation, and validation in the midterm.
3. The exact due date for the MATLAB project and its relationship to the quiz
   schedule.

A detailed implementation draft is available in `projects/`. The agreed core
architecture is incorporated into the syllabus; the MATLAB project date remains
open.

## Evidence Map

| Area | Evidence | State |
|---|---|---|
| Course purpose | `index.qmd`, `syllabus/index.qmd` | Developed |
| Responsible AI policy | `syllabus/ai-policy.qmd` | Developed; still revisable |
| Colleague review gateway | `instructor-preview.qmd` | Published and shared |
| Colleague feedback | Responses are external to the repository | Requested; synthesis pending |
| Weeks 1-4 | `weeks/`, `slides/`, `labs/`, `code/matlab/` | Validated prototype |
| Week 5 | week and slide pages | Outline |
| Weeks 6-12 | week and slide pages; limited R lab/code | Outline/early scaffold |
| Weeks 13-15 | week and slide pages | Outline |
| Projects | `projects/` | Core architecture agreed; data and starter implementation pending |
| Code checks | `scripts/`, `.github/workflows/validate-code.yml` | Implemented |

## Next Actions

1. Record and synthesize the colleague feedback that is not currently stored in
   the repository.
2. Generate and quality-check the 20 synthetic building datasets and withheld
   validation files.
3. Build scaffolded MATLAB and R starter scripts, fixed result schemas, and
   batch checkers.
4. Create the Word/Google Docs report template used to export PDF.
5. Decide the MATLAB project date.
6. Decide the remaining quiz and midterm architecture.
7. Update the syllabus after the remaining assessment decisions are approved.
8. Expand Week 5 and then the R sequence using the validated Weeks 1-4 pattern.
9. Update both this record and `instructor-progress.qmd` after each decision or
   major milestone.

## Update Protocol

After substantive feedback, a course-design decision, or a major content
milestone:

- change the date at the top;
- move resolved questions from **Open Decisions** to **Established Decisions**;
- update the evidence map and next actions;
- add a short entry to the public progress page when the change is suitable for
  colleagues to see.

## History

- **2026-07-08:** Instructor preview added and used as the colleague-review
  entry point.
- **2026-07-08 to 2026-07-09:** Weeks 1-4 expanded into the developed prototype.
- **2026-07-09:** Course-code validation harness added.
- **2026-07-10:** Weeks 1-4 recorded as validated; assessment design identified
  as the active phase; 60-student scalability and the impracticality of oral
  defenses recorded as constraints.
- **2026-07-10:** A detailed two-stage project design, student templates, and
  instructor implementation workflow were drafted for review.
- **2026-07-10:** Project 1 was confirmed as MATLAB and Project 2 as R. The
  synthetic building-energy scenario, group-specific datasets, and PDF plus
  source-code submission format were approved as the core architecture.
- **2026-07-10:** Projects were confirmed as group-assessed. Mandatory
  individual project examinations were removed; brief random or evidence-
  triggered verification remains available when needed.
