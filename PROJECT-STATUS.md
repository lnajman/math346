# MATH 346 Redesign Status

Last updated: 2026-08-25

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

The public site now has a student-first launch shell. Weeks 1-4 are the
launch-ready block; Weeks 5-15 remain visible as an evolving roadmap that can
be refined from student feedback during the opening weeks. Instructor review
and progress pages remain available by direct link but are no longer in the
primary navigation. Quiz 1 is the only assessment instrument finalized for
launch: it is an individual, 12-minute, in-class Blackboard quiz in Week 3
with six short code-reading and validation items, no AI or collaboration, and
no requirement to run MATLAB. Its calendar date remains a Blackboard
announcement. Later quiz and examination details are intentionally deferred.
The student glossary and three optional phase-recovery checkpoints are now
published, and the previously broken Quarto documentation link is corrected.
The student home and syllabus now also publish the instructor contact,
Banner/Blackboard/website roles, office-hour arrangement, missed-assessment
rules, late-project penalty, and the approved five-minute classroom lateness
threshold.

The developed Weeks 1-4 prototype has been sent to colleagues for feedback and
is now considered validated as the model for the course. The agreed student
project package is complete: private synthetic data, beginner-oriented code
starters, fixed result contracts, editable report templates, customized release
ZIPs, and batch checkers are implemented. The release contract has been
rehearsed locally, and the complete assessment-sensitive package is backed up
in a private GitHub repository. The working assessment sequence remains visible
on the public site: Quiz 1 in Week 3, Quiz 2 in Week 6, the semester examination
(midterm) in Week 8, Quiz 3 in Week 9, and Quiz 4 in Week 13. Quiz 1 now has a
fixed student contract; its date and the arrangements for later quizzes and
the midterm remain intentionally deferred. The MATLAB project date is also deferred. Week 5 has
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
the exact due date remains deferred. Week 13 has now been expanded around an
explicit complete-case modeling table, contextual regression formulas,
coefficient interpretation, baseline training comparisons, residual and
influence diagnostics, an additive model, and an AI interpretation audit. Its
three R scripts pass the complete course validation harness. Quiz 4 remains
visible as the working Week 13 marker without resolving its exact format. Week
14 has now been expanded around applying one fixed regression contract across
monthly subsets, retaining each fitted model with an aligned summary, and
comparing sample size, coefficient intervals, training metrics, diagnostics,
and sensitivity evidence without declaring a model winner. Its grouped
sensitivity workflow and AI model-ranking audit expose conclusions that change
after one difficult observation and rankings that ignore uncertainty and
validation. Its three R scripts pass the complete course validation harness.
Week 15 has now been expanded around an evidence-bundle workflow:
students generate exact results, row-aligned predictions, and a checked figure
from one R script; reconcile those artifacts with report claims; rehearse a
clean run; and audit AI-polished conclusions at the claim level. The classroom
example uses familiar `airquality` data and does not add a new Project 2
requirement. Its three R scripts pass the complete course validation harness.

The full 15-week sequence is now developed. Weeks 5-15 are ready for review but
have not been designated validated prototypes. A course-wide coherence,
beginner-workload, navigation, and publication audit is complete. It finds a
strong cumulative spine and healthy technical materials. Its workload
recommendation is now approved and published: one guided main-lab workflow,
4-6 core exercises per week, selected AI audits, explicit guided and extension
material, and approximately 90-120 minutes of routine website-based practice
outside class in an ordinary week. The remaining barriers to freezing the
later course calendar are assessment displacement, exact calendar placement of
the approved project gates, and completion of the live laboratory/Blackboard
readiness check. Recovery support and the student software contract are now
approved and published.

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
- Week 13 now has a two-meeting model-claims-and-diagnostics plan, full slides,
  a main lab, an AI interpretation-review lab, exercises, and three checked R
  scripts. It is developed and ready for review, but has not yet been
  designated a validated prototype.
- Week 14 now has a two-meeting many-models plan, full slides, a main lab, an AI
  model-ranking lab, exercises, and three checked R scripts. It is developed
  and ready for review, but has not yet been designated a validated prototype.
- Week 15 now has a two-meeting communication-and-synthesis plan, full slides,
  a main lab, an AI conclusion-review lab, exercises, and three checked R
  scripts. It is developed and ready for review, but has not yet been
  designated a validated prototype.
- The course-wide audit reviews all 15 weeks, 30 planned meetings, 31 labs, 137
  exercises, 227 learning goals, 21 MATLAB scripts, and 30 R scripts. It
  confirms conceptual and technical coherence while flagging the missing
  required-versus-extension distinction and assessment-week time conflicts.
- The student workload guide resolves the first audit finding without deleting
  the resource bank. Every exercise set now identifies core, guided, and where
  useful extension work; main labs and AI labs have distinct workload roles.
- The public project milestone map now fixes the preview, package release,
  readiness or frozen-plan gate, validation release, and completion sequence
  for both projects without fixing calendar dates.
- A public software matrix now distinguishes required access, the scaffolded
  one-week Quarto use, and optional tools. Runnable MATLAB and R checks cover
  the actual toolbox/package dependencies, and an instructor checklist defines
  the remaining live laboratory and Blackboard verification.

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
- The primary public navigation and home page are student-facing. Instructor
  review pages remain published only as direct-link resources.
- Weeks 1-4 are the launch-ready teaching block. Weeks 5-15 remain a visible
  roadmap and may be refined from student feedback before their use.
- Quiz 1 is an individual, 12-minute, in-class Blackboard quiz in Week 3. It
  contains six short code-reading and validation items, requires no MATLAB
  execution, and permits no AI, collaboration, notes, or web resources. The
  calendar date is announced in Blackboard.
- Only Quiz 1 must be operational at launch. Quiz 2-4 and examination
  architectures remain deferred.
- There is no mandatory individual project examination. A brief verification
  may be requested for a small random sample or when submitted evidence contains
  a material inconsistency.
- A project–examination grade difference may prompt review but is not sufficient
  evidence of misconduct by itself.
- Blackboard is the course platform for group setup, release, submission, and
  grading.
- The public website is a resource bank, not a declaration that every visible
  activity is due. In an ordinary week, the default student workload is the
  two class meetings, instructor-selected checkpoints from one guided main
  lab, 4-6 core exercises, and a short in-class exit check.
- AI-review labs are embedded or assigned selectively and are not an automatic
  second weekly submission. Lab 4A is an extension or alternate activity.
- Routine website-based practice outside class targets approximately 90-120
  minutes in an ordinary week, excluding separately announced project and
  quiz/examination preparation. Assessment weeks receive a reduced selection
  when an assessment displaces class time.
- Project 1 is previewed in Week 3, its group MATLAB package is released in Week
  4, and its readiness checkpoint occurs in Week 5. Its completion window opens
  after Week 5; the exact deadline remains coordinated with Quiz 2.
- Project 2 is previewed in Weeks 9-10, its group training package is released
  in Week 12, its model plan is frozen after Week 13, its validation package is
  released in a common Week 14 window, and its completion window is Week 15.
  Exact Blackboard closing times remain deferred.
- Project 2 validation data are never included in the training package and are
  not released before the common frozen-plan gate. Later changes are recorded
  as deviations or sensitivity analysis rather than silently replacing the
  frozen plan.
- Students need reliable access—not necessarily a personal installation—to
  MATLAB for Weeks 1-5 and Project 1 and R for Weeks 6-15 and Project 2.
- Symbolic Math Toolbox is required for Week 5. The R block requires `dplyr`,
  `ggplot2`, `readr`, `tidyr`, `stringr`, and `lubridate` plus one supported R
  editor.
- Quarto is required only to edit and render the supplied Week 6 scaffold.
  Word/Google Docs-compatible editing and PDF export are used for project
  reports. Git/GitHub and paid generative-AI accounts are not required.
- Institutional access routes and installed versions must be verified on the
  live student systems before they are announced as available.
- Laurent Alain Najman is the instructor; class meetings and rooms follow
  Banner on the Main Campus. Office hours are arranged on demand; because the
  instructor's office is on the SAN Campus, the meeting time and location are
  agreed by email for each appointment.
- A student arriving more than five minutes after the scheduled class start is
  recorded absent but should enter quietly and participate in the remainder.
- There are no make-up quizzes or semester examination. Unapproved absences
  receive zero; Registrar-approved quiz absences use the midterm grade before
  the midterm and the final grade afterward, while an approved midterm absence
  uses the final grade. At most 40% of the course grade can be compensated by
  these substitutions.
- Late projects lose 10% per day or part of a day, with late days rounded up.

## Open Decisions

These ideas have been discussed but are **not yet approved course policy**:

1. The exact calendar dates, delivery arrangements, duration, and format of
   Quizzes 2-4; their working Week 6, 9, and 13 placement remains visible. The
   exact calendar date of the approved Week 3 Quiz 1 also remains to be placed
   in Blackboard.
2. The exact timing and balance of code reading, implementation, and validation
   in the Week 8 semester examination (midterm), including whether it replaces
   one or both normal teaching meetings.
3. The exact due date for the MATLAB project within its approved post-Week-5
   completion window and its relationship to Quiz 2.
4. The exact Blackboard opening and closing times for the approved Project 2
   training, frozen-plan, validation, and completion gates.
These decisions remain open and are intentionally deferred until later course
planning. A detailed implementation draft is available in `projects/`, and the
agreed core project architecture is incorporated into the syllabus.

## Evidence Map

| Area | Evidence | State |
|---|---|---|
| Course purpose | `index.qmd`, `syllabus/index.qmd` | Developed |
| Course administration and classroom policy | `index.qmd`; `syllabus/index.qmd`; `assessments/quiz-01.qmd` | Instructor/contact/platform roles and approved attendance, missed-assessment, and late-project rules published |
| Student launch shell | `index.qmd`; `_quarto.yml`; `weeks/index.qmd` | Weeks 1-4 launch-ready; Weeks 5-15 presented as an evolving roadmap |
| Quiz 1 | `assessments/quiz-01.qmd`; private Blackboard blueprint and question bank | Student contract and private instrument complete; live Blackboard rehearsal pending |
| Glossary and recovery | `resources/glossary.qmd`; three `weeks/recovery-*.qmd` pages | Published as optional support |
| Responsible AI policy | `syllabus/ai-policy.qmd` | Developed; still revisable |
| Colleague review gateway | `instructor-preview.qmd` | Published and shared |
| Colleague feedback | Responses are external to the repository | Requested; synthesis pending |
| Course-wide audit | `instructor-course-audit.qmd` | Completed; workload recommendation implemented, other recommendations remain open |
| Student workload contract | `weeks/workload-guide.qmd`; 15 exercise pages; `labs/index.qmd` | Approved and published |
| Project milestones | `projects/project-milestones.qmd`; both project pages; weekly markers; instructor implementation | Approved week-relative sequence; exact dates deferred |
| Software and access | `resources/software-requirements.qmd`; `resources/instructor-setup-checklist.qmd`; `code/setup/` | Requirements approved and published; live systems not yet verified |
| Weeks 1-4 | `weeks/`, `slides/`, `labs/`, `code/matlab/` | Validated prototype |
| Week 5 | `weeks/week-05.qmd`; `slides/week-05.qmd`; two labs; exercises; four checked MATLAB scripts | Developed; ready for review |
| Week 6 | `weeks/week-06.qmd`; `slides/week-06.qmd`; two labs; exercises; three checked R scripts; checked report scaffold | Developed; ready for review |
| Week 7 | `weeks/week-07.qmd`; `slides/week-07.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 8 | `weeks/week-08.qmd`; `slides/week-08.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 9 | `weeks/week-09.qmd`; `slides/week-09.qmd`; two labs; exercises; supplied CSV; three checked R scripts | Developed; ready for review |
| Week 10 | `weeks/week-10.qmd`; `slides/week-10.qmd`; two labs; exercises; two supplied CSVs; three checked R scripts | Developed; ready for review |
| Week 11 | `weeks/week-11.qmd`; `slides/week-11.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 12 | `weeks/week-12.qmd`; `slides/week-12.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 13 | `weeks/week-13.qmd`; `slides/week-13.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 14 | `weeks/week-14.qmd`; `slides/week-14.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Week 15 | `weeks/week-15.qmd`; `slides/week-15.qmd`; two labs; exercises; three checked R scripts | Developed; ready for review |
| Projects | `projects/`; `code/project-starters/`; private Git-ignored package and private GitHub backup | Complete student release package; all 60 ZIP contracts and both checker suites rehearsed and backed up |
| Code checks | `scripts/`, `.github/workflows/validate-code.yml` | Implemented |

## Next Actions

1. Perform the live laboratory check and build/dry-run Quiz 1 in Blackboard,
   including Student Preview, timer, feedback, and accommodations.
2. Collect student feedback during Weeks 1-4 and record concrete changes before
   freezing each later block.
3. Reconcile Quizzes 2-4 and semester-examination delivery with the teaching
   minutes available in Weeks 6, 8, 9, and 13.
4. Place the approved project gates on exact Blackboard dates only after the
   assessment-time conflicts are resolved.
5. Record and synthesize colleague feedback that is not currently stored in
   the repository.
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

- **2026-08-25:** The office-hours wording on the student home page and syllabus
  was clarified: classes meet on the Main Campus, the instructor's office is on
  the SAN Campus, and both the appointment time and meeting location are agreed
  by email.

- **2026-08-19:** Instructor contact and office-hour information, platform
  roles, missed-assessment substitutions, the late-project penalty, and the
  five-minute lateness/absence rule were added to the student website.

- **2026-08-18:** The public site was converted to a student-first launch
  presentation. Weeks 1-4 were designated launch-ready, later weeks were
  presented as an evolving roadmap, Quiz 1 received a public contract and
  private Blackboard question bank, three recovery checkpoints and a glossary
  were added, and the broken Quarto documentation link was corrected.

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
- **2026-07-22:** Week 13 was expanded around complete-case row accounting,
  regression formulas, slope and intercept interpretation, mean-baseline
  comparisons, residual and influence diagnostics, an additive model, two
  labs, exercises, three R scripts, and an AI audit for causal language,
  extrapolation, R-squared misuse, and training/validation confusion. Quiz 4
  remains the working Week 13 marker with its details deferred. The complete R
  validation harness passed.
- **2026-07-22:** Week 14 was expanded around a fixed model contract applied to
  monthly subsets, named split/list workflows, aligned summaries, coefficient
  intervals, training metrics, diagnostics, and grouped sensitivity checks.
  Two labs, exercises, three R scripts, and an AI audit for unsupported model
  ranking were added. The complete R validation harness passed.
- **2026-07-22:** Week 15 was expanded around figure and caption contracts,
  generated evidence bundles, clean-run rehearsal, cross-artifact
  reconciliation, claim-evidence-limitation ledgers, group sign-off, and an AI
  conclusion audit. Two labs, exercises, three R scripts, and full slides were
  added. The complete R validation harness passed, completing the developed
  15-week sequence.
- **2026-07-22:** A course-wide coherence and beginner-workload audit reviewed
  all 15 weeks and supporting materials. It confirmed the cumulative course
  spine, AI progression, executable-code health, navigation, and publication;
  it identified workload labeling, assessment displacement, project
  milestones, and software requirements as the decisions needed before student
  release.
- **2026-07-22:** The workload model was approved and implemented. A public
  guide now defines one guided main-lab workflow, 4-6 core exercises per week,
  selected AI audits, guided and extension material, a 90-120 minute ordinary-
  week practice target, and proportional reduction in assessment weeks. All 15
  exercise sets and the lab index expose these roles while preserving the full
  resource bank.
- **2026-07-22:** A week-relative project milestone map was approved and
  published. Project 1 now moves from Week 3 preview to Week 4 package release,
  Week 5 readiness, and a post-Week-5 completion window. Project 2 moves from
  Weeks 9-10 preview to Week 12 training release, a post-Week-13 frozen-plan
  gate, common Week 14 validation release, and Week 15 completion. Exact dates
  remain deferred.
- **2026-08-18:** The student software and access contract was approved and
  published. It requires reliable MATLAB and R access, Symbolic Math Toolbox
  for Week 5, six named R packages, one R editor, and scaffolded Quarto access
  for Week 6; it makes Git/GitHub and paid AI accounts optional. Runnable setup
  checks and a live laboratory/Blackboard readiness checklist were added. Live
  institutional availability remains to be verified rather than assumed.
