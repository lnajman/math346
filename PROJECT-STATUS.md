# MATH 346 Redesign Status

Last updated: 2026-07-22

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
is now considered validated as the model for the course. The agreed student
project package is complete: private synthetic data, beginner-oriented code
starters, fixed result contracts, editable report templates, customized release
ZIPs, and batch checkers are implemented. The release contract has been
rehearsed locally, and the complete assessment-sensitive package is backed up
in a private GitHub repository. The working assessment sequence remains visible
on the public site: Quiz 1 in Week 3, Quiz 2 in Week 6, the semester examination
(midterm) in Week 8, Quiz 3 in Week 9, and Quiz 4 in Week 13. Exact dates,
delivery arrangements, quiz formats, and the detailed midterm architecture are
intentionally deferred. The MATLAB project date is also deferred. Week 5 has
now been expanded using the validated Weeks 1-4 pattern and passes the complete
MATLAB validation harness. Week 6 has now been expanded into a beginner-safe
MATLAB-to-R transition with ordinary R scripts, checked visualizations, a
supplied reproducible-report scaffold, and an AI plot-review activity. Its R
scripts and embedded report code pass the course validation harness. Week 7 has
now been expanded around data transformation as question-answering using R's
built-in `airquality` data, explicit row accounting, grouped summaries, and an
AI question-drift audit. Its three R scripts pass the course validation
harness. Week 8 has now been expanded into a checked exploratory-data-analysis
cycle using `ggplot2::diamonds`: variable-type decisions, distributions,
covariation, overplotting, conditional views, data-quality anomalies, and an AI
interpretation audit. Its three R scripts pass the course validation harness.
Week 9 has now been expanded around a supplied synthetic campus-energy CSV,
explicit import schemas, parsing diagnostics, tidy observation structure,
`pivot_longer`, observation-key checks, and an AI reshape audit. Its three R
scripts and data contract pass the course validation harness. Week 10 has now
been expanded around a supplied synthetic building registry and service-event
log, explicit string normalization, ordered factors, time-zone-aware parsing,
unmatched-row audits, declared join relationships, composite keys, and an AI
row-multiplication audit. Its three R scripts and two data contracts pass the
course validation harness. Week 11 has now been expanded around readable
pipelines with named checkpoints, small functions with explicit contracts,
normal, boundary, missing, and invalid-input tests, and an AI refactor audit
that exposes behavior drift. Its three R scripts pass the complete course
validation harness. Week 12 has now been expanded around vectorized thinking,
typed iteration, preallocated loops, repeated workflows with one status row per
request, and an AI batch audit that exposes silently dropped failures and type
coercion. Its three R scripts pass the complete course validation harness.
Project 2 is introduced through its existing public and Blackboard workflow;
the exact due date remains deferred. The next content milestone is Week 13
model basics and diagnostics.

Weeks 13-15 remain outlines. They should not yet be described as complete course
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
- A deterministic private generator now produces 20 distinct Project 1 data
  files, 20 Project 2 training files, 20 withheld validation files, private
  reference results, and row-level ground truth.
- An independent quality report confirms that all 20 group packages meet the
  fixed schema, plausibility, distinctness, and comparability checks.
- Beginner-oriented MATLAB and R starter templates are customized into 20
  Project 1 ZIPs, 20 Project 2 training ZIPs, and 20 separately staged
  validation ZIPs.
- Fixed Project 1 and Project 2 result contracts are published. Private batch
  checkers rerun source code and independently verify results and predictions;
  both pass all 20 known-good reference submissions.
- Word templates for both project reports and an offline PDF data dictionary
  are complete, included in the appropriate starter ZIPs, and available from
  the public project pages.
- All 60 release ZIPs pass exact-content and source-fingerprint checks. Project
  2 training ZIPs contain no validation outcomes, and representative ZIPs pass
  a simulated Blackboard upload/download extraction cycle.
- Week 5 now has a two-meeting teaching plan, full slides, a main lab, an AI
  review lab, exercises, four MATLAB examples, and executable symbolic and
  numerical checks. It is developed and ready for review, but has not yet been
  designated a validated prototype.
- Week 6 now has a two-meeting MATLAB-to-R transition plan, full slides, a main
  lab, an AI plot-review lab, exercises, three R scripts, and a supplied report
  scaffold whose code is checked automatically. It is developed and ready for
  review, but has not yet been designated a validated prototype.
- Week 7 now has a two-meeting data-transformation plan, full slides, a main
  lab, an AI pipeline-review lab, exercises, and three checked R scripts. It is
  developed and ready for review, but has not yet been designated a validated
  prototype.
- Week 8 now has a two-meeting exploratory-data-analysis plan, full slides, a
  main lab, an AI interpretation-review lab, exercises, and three checked R
  scripts. It is developed and ready for review, but has not yet been
  designated a validated prototype.
- Week 9 now has a two-meeting import-and-tidy plan, a supplied synthetic CSV,
  full slides, a main lab, an AI tidy-structure lab, exercises, and three
  checked R scripts. It is developed and ready for review, but has not yet been
  designated a validated prototype.
- Week 10 now has a two-meeting relational-and-typed-data plan, two supplied
  synthetic CSVs, full slides, a main lab, an AI join-review lab, exercises,
  and three checked R scripts. It is developed and ready for review, but has
  not yet been designated a validated prototype.
- Week 11 now has a two-meeting readable-pipelines-and-functions plan, full
  slides, a main lab, an AI refactor-review lab, exercises, and three checked R
  scripts. It is developed and ready for review, but has not yet been
  designated a validated prototype.
- Week 12 now has a two-meeting vectorization-and-iteration plan, full slides,
  a main lab, an AI batch-review lab, exercises, and three checked R scripts. It
  is developed and ready for review, but has not yet been designated a
  validated prototype.
- Weeks 13-15 have short week pages and slide outlines, but very little of the
  supporting lab, exercise, and code material available for Weeks 1-12.

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
- The public working schedule retains Quiz 1 in Week 3, Quiz 2 in Week 6, the
  semester examination (midterm) in Week 8, Quiz 3 in Week 9, and Quiz 4 in
  Week 13. These placements remain visible while detailed arrangements are
  discussed.
- There is no mandatory individual project examination. A brief verification
  may be requested for a small random sample or when submitted evidence contains
  a material inconsistency.
- A project–examination grade difference may prompt review but is not sufficient
  evidence of misconduct by itself.
- Blackboard is the course platform for group setup, release, submission, and
  grading.

## Open Decisions

These ideas have been discussed but are **not yet approved course policy**:

1. The exact calendar dates, delivery arrangements, duration, and format of the
   four quizzes; their working Week 3, 6, 9, and 13 placement remains visible.
2. The exact timing and balance of code reading, implementation, and validation
   in the Week 8 semester examination (midterm).
3. The exact due date for the MATLAB project and its relationship to the quiz
   schedule.

These decisions remain open and are intentionally deferred until later course
planning. A detailed implementation draft is available in `projects/`, and the
agreed core project architecture is incorporated into the syllabus.

## Evidence Map

| Area | Evidence | State |
|---|---|---|
| Course purpose | `index.qmd`, `syllabus/index.qmd` | Developed |
| Responsible AI policy | `syllabus/ai-policy.qmd` | Developed; still revisable |
| Colleague review gateway | `instructor-preview.qmd` | Published and shared |
| Colleague feedback | Responses are external to the repository | Requested; synthesis pending |
| Weeks 1-4 | `weeks/`, `slides/`, `labs/`, `code/matlab/` | Validated prototype |
| Week 5 | `weeks/week-05.qmd`; `slides/week-05.qmd`; two labs; exercises; four checked MATLAB scripts | Developed; ready for review |
| Week 6 | `weeks/week-06.qmd`; `slides/week-06.qmd`; two labs; exercises; three checked R scripts; checked report scaffold | Developed; ready for review |
| Week 7 | `weeks/week-07.qmd`; `slides/week-07.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 8 | `weeks/week-08.qmd`; `slides/week-08.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 9 | `weeks/week-09.qmd`; `slides/week-09.qmd`; two labs; exercises; supplied CSV; three checked R scripts | Developed; ready for review |
| Week 10 | `weeks/week-10.qmd`; `slides/week-10.qmd`; two labs; exercises; two supplied CSVs; three checked R scripts | Developed; ready for review |
| Week 11 | `weeks/week-11.qmd`; `slides/week-11.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 12 | `weeks/week-12.qmd`; `slides/week-12.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Weeks 13-15 | week and slide pages | Outline |
| Projects | `projects/`; `code/project-starters/`; private Git-ignored package and private GitHub backup | Complete student release package; all 60 ZIP contracts and both checker suites rehearsed and backed up |
| Code checks | `scripts/`, `.github/workflows/validate-code.yml` | Implemented |

## Next Actions

1. Record and synthesize the colleague feedback that is not currently stored in
   the repository.
2. Expand Week 13 and then the remaining R sequence using the validated weekly
   pattern.
3. Perform a short setup check in the live Blackboard course before student
   release, including Groups, staged availability, and downloaded filenames.
4. Decide the MATLAB project date later, when the teaching calendar is ready.
5. Decide the exact quiz and midterm dates, delivery arrangements, and formats
   later without removing their working weekly placement from the public site.
6. Update the syllabus after the remaining assessment decisions are approved.
7. Update both this record and `instructor-progress.qmd` after each decision or
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
- **2026-07-22:** The deterministic private project-data package was generated
  for 20 groups. All MATLAB, R training, and withheld validation files passed
  structural, plausibility, distinctness, and comparability checks; private
  reference results and row-level ground truth were retained for checking.
- **2026-07-22:** Beginner-oriented MATLAB and R starters, fixed CSV result
  contracts, 60 staged release ZIPs, and private batch checkers were completed.
  MATLAB and R checker suites each passed all 20 known-good submissions.
- **2026-07-22:** Word/Google Docs report templates and an offline PDF data
  dictionary were completed and added to every appropriate starter ZIP. All 60
  release ZIPs passed exact-content checks, validation-separation checks, and a
  representative upload/download extraction rehearsal.
- **2026-07-22:** The complete assessment-sensitive project package was backed
  up in a separate private GitHub repository. Project scheduling and the
  remaining quiz and midterm architecture were intentionally deferred; Week 5
  became the next content milestone.
- **2026-07-22:** Week 5 was expanded into a complete symbolic-mathematics unit
  with a two-meeting plan, slides, two labs, exercises, four MATLAB scripts, an
  AI-answer audit, and exact-versus-numerical verification. The full MATLAB
  course harness passed.
- **2026-07-22:** Week 6 was expanded into a deliberate MATLAB-to-R transition
  with first-script foundations, `ggplot2`, two labs, exercises, three R
  scripts, a supplied reproducible-report scaffold, and an AI plot-claim
  audit. The R scripts and report code pass the course validation harness.
- **2026-07-22:** Week 7 was expanded around data transformation as
  question-answering with one-verb invariants, explicit missing-row accounting,
  grouped summaries, two labs, exercises, three R scripts, and an AI pipeline
  question-drift audit. The complete R validation harness passed.
- **2026-07-22:** Week 8 was expanded into a checked EDA cycle using the
  `diamonds` data, with variable-type decisions, distribution and covariation
  plots, overplotting, conditional comparisons, anomaly review, two labs,
  exercises, three R scripts, and an AI interpretation audit. The complete R
  validation harness passed.
- **2026-07-22:** Week 9 was expanded around a supplied synthetic wide campus-
  energy CSV, explicit `readr` schemas, missing-value encodings, parsing
  diagnostics, `pivot_longer`, observation-key checks, two labs, exercises,
  three R scripts, and an AI tidy-structure audit. The complete R validation
  harness passed.
- **2026-07-22:** The original working assessment sequence was restored and
  made explicit on the public course pages: quizzes in Weeks 3, 6, 9, and 13,
  with the semester examination (midterm) in Week 8. Exact dates, delivery,
  and formats remain open for later discussion.
- **2026-07-22:** Week 10 was expanded around a supplied synthetic building
  registry and service-event log, string and factor contracts, time-zone-aware
  date-time parsing, key uniqueness, unmatched rows in both directions,
  declared many-to-one joins, composite building-month keys, two labs,
  exercises, three R scripts, and an AI partial-key join audit. The complete R
  validation harness passed.
- **2026-07-22:** Week 11 was expanded around readable pipelines with named
  checkpoints, explicit row and key invariants, small reusable functions,
  input/output contracts, normal and edge-case tests, two labs, exercises,
  three R scripts, and an AI refactor audit that catches changed boundary,
  missing-value, and argument behavior. The complete R validation harness
  passed.
- **2026-07-22:** Week 12 was expanded around vectorized operations,
  programmatic column selection, `lapply`, typed `vapply`, preallocated loops,
  complete batch status logs, two labs, exercises, three R scripts, and an AI
  audit for silently dropped failures and type coercion. Project 2 is assigned
  through the existing two-stage workflow; its due date remains deferred. The
  complete R validation harness passed.
