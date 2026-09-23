# MATH 346 Redesign Status

Last updated: 2026-09-23

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

The full student-facing 15-week course sequence is published. Completed weeks
remain available for review, and each upcoming week receives a final delivery
check before use. Instructor review and progress pages remain available by
direct link but are not in the primary navigation. Quiz 1 was delivered as an
individual, 15-minute, in-class Blackboard quiz in Week 4
with six content blocks and two independently scored one-point questions per
block (ten multiple-choice and two one-sentence responses), one
student-prepared handwritten A4 sheet (both sides), no AI or collaboration,
and no requirement to run MATLAB. Two
equivalent private forms, answer rationales, calibration notes, two validated
QTI 2.1 question-bank ZIPs, and a Blackboard import/build checklist are
complete. Its Week 4 calendar date and meeting remain a Blackboard
announcement. Quiz 2 is now fixed for Week 6 on Wednesday, 30 September, and
Thursday, 1 October, with the section order reversed relative to Quiz 1. It is
a 15-minute in-class quiz near the beginning of the meeting and covers material
through Week 5, not material first taught in Week 6. Its public student guide,
two equivalent private 12-point forms, answer rationales, 0/0.5/1 written
rubrics, two validated QTI 2.1 banks, and Blackboard checklist are complete.
Each form has nine conceptual/code-reading multiple-choice questions and three
one-sentence written responses. Form A is code-first; Form B was redesigned as
an evidence-first form with different representations and solution routes to
reduce cross-day leakage. A separate ungraded audit-style practice quiz and
validated QTI bank rehearse the same reasoning standard without reproducing
either live form. Following a failed Blackboard import on 20 September, all
three Quiz 2 QTI packages were repaired to serialize assessment items in the
default QTI namespace, given descriptive filenames and meaningful identifiers,
and revalidated as 12-item banks. A repeat live import remains required. The
common midterm is fixed
for Saturday, 10 October 2026, from 12:00 to 13:30, outside normal class hours
so both sections sit it simultaneously. The detailed midterm architecture
remains to be prepared.
The student glossary and three optional phase-recovery checkpoints are now
published, and the previously broken Quarto documentation link is corrected.
The student home and syllabus now also publish the instructor contact,
Banner/Blackboard/website roles, office-hour arrangement, missed-assessment
rules, late-project penalty, and the approved five-minute classroom lateness
threshold. A separate public LLM-use statement now discloses how OpenAI Codex
assisted course development, distinguishes that disclosure from the student AI
policy, and confirms that course authority and final responsibility remain
with the instructor.

Detailed instructor scripts for both Week 4 sessions are now prepared as
separate PDFs. Each preserves the complete 75-minute teaching sequence and
adds an explicit quiz-day overlay: three minutes for launch, the full
15-minute Quiz 1 timer, and a compressed teaching route that retains the
essential numerical checks and exit ticket. This supports the two-section
schedule in which Quiz 1 occurs in a different meeting for each section.

All 36 guided lab workflows now use a two-file teaching contract. The original,
canonical script URLs deliver intentionally incomplete starters; completed
versions live only under dedicated `solutions/` paths. Students therefore
download a starter first, then compare their attempt with a separately labeled
possible solution. The 15 AI-review programs remain deliberately weak critique
targets rather than answer keys. Lab pages and weekly material links point to
the canonical starters, the code library pairs both versions, and the
validation harness checks that every pair and label remains present.
Each guided lab page also provides direct possible-solution download links at
the end of the activity, with an explicit instruction to attempt and validate
the starter first.
Labs are now explicitly formative: their former `Deliverable` and `Submit`
language has been replaced by `What You Should Have Completed`. Students keep
the resulting scripts and notes unless a particular checkpoint is explicitly
announced in Blackboard; short in-class exit checks remain separately
collectable.

The developed Weeks 1-4 prototype has been sent to colleagues for feedback and
is now considered validated as the model for the course. The student project
package now provides 66 configurable candidate groups: private synthetic data,
beginner-oriented
code starters, fixed result contracts, editable report templates, customized
release ZIPs, and batch checkers are implemented. The release contract has been
rehearsed locally, and the assessment-sensitive package is backed up in a
private GitHub repository. The actual registered teams will use only the first
required packages. The final roster accounts for all 66 enrolled students in
33 groups, identified continuously as `group-01` through `group-33`. These
identifiers map directly to the first 33 validated candidate packages. Any
later correction is limited to a confirmed clerical or roster error. The working assessment sequence remains visible
on the public site: Quiz 1 in Week 4, Quiz 2 in Week 6, the common Saturday
midterm after Week 7, Quiz 3 in Week 9, and Quiz 4 in Week 13. Quiz 1 has a
fixed student contract; Quiz 2 and the midterm now have confirmed calendar
placement, while their remaining content and delivery details are still being
prepared. Project 1 is due Thursday, 24 September 2026, at 23:55 UAE time;
its readiness checkpoint is in the first Week 5 session. Week 5 has
now been expanded using the validated Weeks 1-4 pattern and passes the complete
MATLAB validation harness. Separate classroom-ready instructor PDFs now cover
both Week 5 sessions. Session 1 integrates the seven-minute Quiz 1 follow-up,
a five-minute evidence-based response to all 35 Week 4 Meeting 2 exit tickets,
and the Project 1 readiness checkpoint without dropping the symbolic-calculus
checks. The response reinforces substitution/residual, refinement, and known-
value checks while correcting three weak standards: a plot alone, an undefined
"small error," and agreement with an initial guess. Session 2 uses the released
time for a fuller numerical comparison and AI-claim repair after the fixed-
volume tank evidence chain.
Both scripts provide exact wording, slide-to-MATLAB transitions, TA actions,
timed student work, Blackboard exit questions, and time-loss contingencies.
Week 6 has now been expanded into a beginner-safe
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
- Separate Week 4 Session 1 and Session 2 instructor scripts now provide
  exact slide-to-MATLAB transitions, suggested wording, TA actions,
  Blackboard exit-ticket text, and optional quiz-day timing overlays.
- Week 3 Meeting 2 now introduces a fixed fit/check split before the later
  training/validation terminology. Students see that training residuals are
  warning evidence rather than proof: a degree-7 polynomial can minimize fit
  error while a degree-2 polynomial performs better on withheld observations.
- A validation harness checks the executable MATLAB and R course code and runs
  in GitHub Actions.
- Sixteen MATLAB and twenty R guided workflows now have paired incomplete
  starters and labeled possible solutions; all main lab pages lead with the
  starters and provide direct solution links afterward, while AI-review scripts
  remain unpaired critique material.
- A configurable deterministic private generator now produces 66 distinct
  Project 1 data files, 66 Project 2 training files, 66 withheld validation
  files, private
  reference results, and row-level ground truth.
- An independent quality report confirms that all 66 candidate packages meet the
  fixed schema, plausibility, distinctness, and comparability checks.
- Beginner-oriented MATLAB and R starter templates are customized into 66
  Project 1 ZIPs, 66 Project 2 training ZIPs, and 66 separately staged
  validation ZIPs.
- Fixed Project 1 and Project 2 result contracts are published. Private batch
  checkers rerun source code and independently verify results and predictions;
  both pass all 66 known-good reference submissions.
- Word templates for both project reports and an offline PDF data dictionary
  are complete, included in the appropriate starter ZIPs, and available from
  the public project pages.
- All 198 release ZIPs pass exact-content and source-fingerprint checks. Project
  2 training ZIPs contain no validation outcomes, and representative ZIPs pass
  a simulated Blackboard upload/download extraction cycle.
- Week 5 now has a two-meeting teaching plan, full slides, a main lab, an AI
  review lab, exercises, four MATLAB examples, executable symbolic and
  numerical checks, and two detailed instructor scripts. Session 1 includes
  the Quiz 1 evidence review and Project 1 readiness checkpoint; Session 2
  uses the resulting time for numerical comparison and AI-claim repair. It is
  classroom-ready, but has not yet been designated a validated prototype.
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
- The current enrollment is 66 students: 37 in one section and 29 in the other.
- Project teams may contain one, two, or three students. Three is the maximum;
  pairs and one-person teams are allowed.
- Project teams may include students from either class session. Each
  cross-session team uses one course-wide group identifier, dataset,
  submission, and group grade; students still attend their registered session.
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
- The public working schedule places Quiz 1 in Week 4, Quiz 2 in Week 6, the
  common Saturday midterm after Week 7, Quiz 3 in Week 9, and Quiz 4 in Week
  13. Quiz 2 is scheduled for 30 September and 1 October, with the section
  order reversed relative to Quiz 1. The midterm is scheduled for Saturday,
  10 October 2026, from 12:00 to 13:30 so both sections take it simultaneously.
- The primary public navigation and home page are student-facing. Instructor
  review pages remain published only as direct-link resources.
- Weeks 1-4 established the teaching pattern. The full 15-week sequence is
  published, with each upcoming week receiving a final delivery check before
  use.
- Quiz 1 is an individual, 15-minute, in-class Blackboard quiz in Week 4. Its
  six content blocks each contain two independently scored one-point questions:
  ten multiple-choice and two one-sentence responses (12 questions and 12
  points in total). Each student may use one A4 sheet,
  handwritten by them on both sides, but no printed or additional reference
  material. The quiz requires no MATLAB execution and permits no AI,
  collaboration, or web resources. Two equivalent forms and their answer
  rationales are complete. The Week 4 calendar date and meeting are announced
  in Blackboard.
- Quiz 2 is a 15-minute in-class assessment near the beginning of the meeting.
  It covers material through Week 5; Week 6 material is excluded because both
  sections must have completed all assessed teaching before either form is
  administered. Its public guide and two equivalent section packages are
  complete; live Blackboard import and Student Preview remain.
- The midterm runs for 90 minutes outside regular class hours and therefore
  does not replace either normal Week 7 teaching meeting. Its detailed content
  and question architecture remain to be prepared.
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
- Labs are formative practice and are not routinely submitted or graded. A
  lab checkpoint is collected only when explicitly announced in Blackboard;
  ordinary lab pages describe what students should have completed and retained.
- Guided lab code is released in two versions: an incomplete starter for the
  attempt and a separately labeled possible solution for comparison afterward.
  Possible solutions are examples, not unique required implementations.
- Routine website-based practice outside class targets approximately 90-120
  minutes in an ordinary week, excluding separately announced project and
  quiz/examination preparation. Assessment weeks receive a reduced selection
  when an assessment displaces class time.
- Project 1 is previewed in Week 3, its group MATLAB package is released in Week
  4, and its readiness checkpoint occurs in the first Week 5 session. The
  complete group package is due Thursday, 24 September 2026, at 23:55 UAE
  time. No material first taught in the second Week 5 session is required.
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
- Muhammad Ismail Yunus is the Teaching Assistant. He supports students during
  class and outside class; students arrange outside-class support by email at
  `100063760@ku.ac.ae`.
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

1. The exact formats and content of Quizzes 3-4 remain open. Quiz 2 is fully
   specified; its live Blackboard import and Student Preview remain operational
   checks rather than design decisions.
2. The exact balance of code reading, implementation, and validation in the
   common Saturday midterm remains open. Its date, 90-minute duration, and
   simultaneous two-section administration are approved; it does not replace
   a normal teaching meeting.
3. The exact Blackboard opening and closing times for the approved Project 2
   training, frozen-plan, validation, and completion gates.
These decisions remain open and are intentionally deferred until later course
planning. A detailed implementation draft is available in `projects/`, and the
agreed core project architecture is incorporated into the syllabus.

## Evidence Map

| Area | Evidence | State |
|---|---|---|
| Course purpose | `index.qmd`, `syllabus/index.qmd` | Developed |
| Course administration and classroom policy | `index.qmd`; `syllabus/index.qmd`; `assessments/quiz-01.qmd` | Instructor/contact/platform roles and approved attendance, missed-assessment, and late-project rules published |
| Student-facing course site | `index.qmd`; `_quarto.yml`; `weeks/index.qmd` | Full 15-week sequence published; completed weeks retained for review; Blackboard authoritative for logistics |
| Quiz 1 | `assessments/quiz-01.qmd`; two private forms, answer-keyed bank, calibration notes, two validated QTI 2.1 ZIPs, and Blackboard checklist | Student contract and two equivalent 12-point import packages complete; live Blackboard import and rehearsal pending |
| Quiz 2 | `assessments/quiz-02.qmd`; two structurally distinct private forms, answer-keyed bank, calibration notes, two validated QTI 2.1 ZIPs, audit-style practice form and validated practice QTI, and Blackboard checklists | Student contract, two equivalent live packages, and ungraded practice package complete; live Blackboard import and rehearsal pending |
| Glossary and recovery | `resources/glossary.qmd`; three `weeks/recovery-*.qmd` pages | Published as optional support |
| Responsible AI policy | `syllabus/ai-policy.qmd` | Developed; still revisable |
| Course-development LLM disclosure | `llm-use.qmd`; primary navigation and home-page link | Published; distinguishes development assistance from rules for student work |
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
| Projects | `projects/`; `code/project-starters/`; private Git-ignored package and private GitHub backup | Final roster: all 66 students in 33 groups, `group-01` through `group-33`; corresponding candidate packages are validated |
| Code checks | `scripts/`, `.github/workflows/validate-code.yml` | Implemented |

## Next Actions

1. Perform the live laboratory check and build/dry-run Quiz 1 in Blackboard,
   including Student Preview, timer, feedback, and accommodations.
2. Continue collecting weekly student evidence and record concrete changes
   before each upcoming block is taught.
3. Deliver the two Week 5 sessions, collect their exit responses and Project 1
   readiness blockers, and record any revision needed before the R transition.
4. Import and rehearse both Quiz 2 forms plus the ungraded practice form in
   Blackboard for 30 September and 1 October, then design the common 90-minute
   midterm for 10 October; retain both regular Week 7 meetings for teaching and
   review.
5. Verify the Project 1 Blackboard Group Assignment, one-submission-per-group
   workflow, receipt visibility, and 24 September 23:55 UAE closing time.
6. Place the remaining Project 2 gates on exact Blackboard dates after the
   remaining assessment conflicts are resolved.
7. Record and synthesize colleague feedback that is not currently stored in
   the repository.
8. Update the syllabus after the remaining assessment decisions are approved.
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

- **2026-09-23:** Project 1's deadline was extended to Thursday, 24 September
  2026, at 23:55 UAE time. Current website references and the Week 5 slides
  were aligned. The Session 2 exit slide now asks what evidence supports a
  material-minimizing tank design, with an individual 3-5 sentence response.
- **2026-09-20:** The first live Blackboard import exposed a QTI serialization
  defect in both Quiz 2 forms and the practice bank: every assessment item used
  an `ns0:` prefix and Blackboard rejected all 12 resources. The generators
  now restore the default QTI namespace for every item, reject prefixed output,
  assign descriptive package filenames and meaningful manifest/resource/item
  identifiers, and validate both descriptive and compatibility copies. A
  repeat live import and student preview remain pending.
- **2026-09-20:** Both Week 5 instructor scripts were regenerated and visually
  checked after reconciling 35 Week 4 Meeting 2 exit tickets across the two
  Blackboard exports. Session 1 now gives an anonymous five-minute response
  built around answer, check, interpretation, and limitation; the Quiz 1
  follow-up, symbolic lesson, Project 1 readiness checkpoint, and exit ticket
  remain within the 75-minute plan.
- **2026-09-19:** Quiz 2 Form B was redesigned to reduce cross-day leakage.
  Form A remains code-first, while Form B now uses matrix indexing, competing
  function contracts, an error-curve description, sign and derivative tables,
  symbolic-to-numeric conversion, and physical-domain evidence. Both retain
  the same six competencies, 9-MCQ/3-written structure, 12 points, and
  15-minute target. A third, ungraded audit-style practice quiz was completed
  with its own answer feedback, Blackboard instructions, and validated QTI 2.1
  package; it does not reproduce either live form.
- **2026-09-18:** A public LLM-use statement was added to the primary
  navigation and home page. It discloses how OpenAI Codex assisted with course
  development, records the instructor's authority and responsibility, explains
  the iterative review process and its limitations, and points students to the
  separate Responsible AI Use policy for rules governing their own work.
- **2026-09-17:** Pre-semester "launch block" and "later roadmap" wording was
  removed from the live website. The home page and weekly index now present the
  complete 15-week course sequence, retain completed weeks for review, and
  direct students to current pages plus Blackboard for assigned work and
  logistics. The syllabus, assessment index, and Week 7-8 pages were also
  aligned with the common Saturday midterm after Week 7.
- **2026-09-17:** Project 1 was fixed for Thursday, 24 September 2026, at 9:00
  AM UAE time. The formative readiness checkpoint moved to the first Week 5
  session so groups have time to resolve blockers. The Week 5 page, slides,
  project pages, milestone map, syllabus, implementation guide, and both
  instructor scripts were aligned. Session 2 now uses the released time for a
  fuller numerical comparison and AI-claim repair.
- **2026-09-17:** Two classroom-ready Week 5 instructor scripts were completed.
  Session 1 integrates the seven-minute Quiz 1 follow-up into the exact
  expressions, assumptions, symbolic calculus, equation-solving, and exit
  sequence. Session 2 develops the fixed-volume tank minimum claim through
  domain, stationarity, curvature, boundary, numerical, and plotting evidence,
  followed by an AI audit and exit question. The readiness checkpoint was
  subsequently moved into Session 1 when the project deadline was fixed.
- **2026-09-17:** Quiz 2 was fixed as a 15-minute in-class assessment near the
  beginning of the Week 6 meeting, on 30 September and 1 October with the
  section order reversed relative to Quiz 1. It covers material through Week
  5. The common midterm was fixed for Saturday, 10 October 2026, from 12:00 to
  13:30, outside regular class hours so both sections take it simultaneously.
- **2026-09-17:** Quiz 2 received a complete student and instructor package.
  Each equivalent form has 12 independently scored one-point items: nine
  conceptual/code-reading multiple-choice questions and three one-sentence
  written responses across arrays, functions, fit/check evidence, numerical
  validation, symbolic mathematics, and minimum evidence. The public guide,
  private keys and 0/0.5/1 rubrics, two validated QTI 2.1 banks, and Blackboard
  import/preview checklist are complete. Live Blackboard rehearsal remains.
- **2026-09-16:** The project roster was finalized, subject only to correction
  of a confirmed clerical or roster error. All 66 students are assigned to 33
  groups with continuous identifiers from `group-01` through `group-33`, which
  map directly to the first 33 validated candidate data packages. A final
  web-shareable workbook replaces the provisional presentation.

- **2026-09-16:** Three additional project teams were recorded from seven
  students who had previously appeared in provisional one-person teams. The
  roster still accounts for all 66 students and now contains 33 provisional
  teams, with team sizes between one and three. Official gradebook names and
  IDs remain the roster authority.

- **2026-09-14:** Following student requests, Quiz 1 was extended from 12 to
  15 minutes for both sections. The three additional minutes protect the
  assessment from Blackboard loading and navigation delays when its 12 scored
  items are displayed one at a time. The content, points, permitted A4 sheet,
  and individual-work rules are unchanged. The public guide, private build
  instructions, printable forms, and Week 4 quiz-day overlays were updated.

- **2026-09-14:** The provisional project roster was reconciled against both
  official gradebooks. All 66 enrolled students are now listed in 37
  provisional teams. The 15 students not covered by a submitted or
  instructor-added registration were assigned ordinary one-person teams. Team
  changes remain open until 16 September 2026 at 8:00 a.m. UAE time; final
  identifiers and dataset assignments follow the deadline.

- **2026-09-13:** Two private QTI 2.1 question-bank ZIPs were generated for
  direct Blackboard Ultra import, one for each Quiz 1 form. Each package has 12
  self-contained one-point items (10 multiple choice and 2 manually graded
  written responses), including repeated code or table context where a
  one-question-at-a-time display would otherwise be ambiguous. A deterministic
  generator, structural validator, and exact import/preview checklist accompany
  the packages. Live import in the KU Blackboard course remains pending.
- **2026-09-12:** Quiz 1 was calibrated against the undergraduate grade bands
  without imposing a distribution quota. Its six content blocks now contain
  two independently scored one-point questions each, avoiding coarse score
  jumps while preserving the 12-minute limit. Two equivalent Week 4 forms,
  answer rationales, calibration notes, and exact Blackboard checks are
  complete. Each form now uses ten multiple-choice questions and two distinct
  one-sentence responses, with simple 0/1 rubrics, so students must produce as
  well as recognize validation reasoning. Students may use one self-prepared
  handwritten A4 sheet, both sides, but no other reference material. The live
  Blackboard rehearsal remains pending.
- **2026-09-07:** The private project system was made configurable through one
  group-count setting and expanded to 66 candidate groups. All 66 synthetic
  datasets passed the structural, plausibility, distinctness, and comparability
  gates; all 198 staged ZIPs passed allowlist and validation-separation checks;
  and both the MATLAB and R checker suites passed 66/66 known-good submissions.

- **2026-09-07:** Cross-session project teams were approved. Students from the
  two class sessions may form one team, which receives one course-wide group
  identifier, dataset, submission, and grade. Students continue attending their
  registered sessions. The Blackboard dry run must verify cross-session access
  or, if the sessions use separate course shells, the manual cross-shell
  workflow.

- **2026-09-07:** Week 3 overfitting instruction was made evidentially precise.
  Residual plots, model complexity, and instability are now described as
  warning signs rather than proof of overfitting. Meeting 2 adds a fixed
  fit/check split, separate RMSE calculations, a MATLAB starter/solution
  extension, lab questions, and slides that bridge to the formal Week 12-13
  training/validation terminology.

- **2026-09-06:** Project teams were limited to a maximum of three students.
  Teams of two and one-person teams were explicitly approved. With 66 students
  across sections of 37 and 29, the final dataset-package count will be fixed
  after team registration; the existing 20-group package must then be expanded.

- **2026-09-06:** Quiz 1 was moved from Week 3 to Week 4. Its approved
  12-minute individual Blackboard format is unchanged; the exact Week 4
  calendar date and meeting remain a Blackboard announcement. Week 3 Meeting 2
  was restored to a full interpolation, fitting, and AI-claim review session.

- **2026-08-27:** Muhammad Ismail Yunus was added to the public home, syllabus,
  and lab pages as the course Teaching Assistant. His role includes student
  support during class and outside class, with outside-class arrangements made
  by email at `100063760@ku.ac.ae`.
- **2026-08-27:** Routine lab submission was removed from the public course
  contract. All main and AI-review lab `Deliverable` sections became
  `What You Should Have Completed` checklists, and the lab index now states
  that students retain their work unless a checkpoint is explicitly announced
  in Blackboard.

- **2026-08-27:** Direct possible-solution download links were added to every
  guided lab page. Students are instructed to attempt and validate the starter
  first, but no longer need to navigate through the general code library to
  locate the comparison file.

- **2026-08-26:** All guided lab code was separated into 16 MATLAB and 20 R
  starter/solution pairs. Existing public script URLs now contain the
  incomplete starters, while completed files moved into dedicated `solutions/`
  paths. Student-facing lab and week links therefore open starters first,
  possible solutions are explicitly labeled for later comparison, and
  automated checks enforce the pairing contract.

- **2026-08-25:** The office-hours wording on the student home page and syllabus
  was clarified: classes meet on the Main Campus, the instructor's office is on
  the SAN Campus, and both the appointment time and meeting location are agreed
  by email.

- **2026-08-19:** Instructor contact and office-hour information, platform
  roles, missed-assessment substitutions, the late-project penalty, and the
  five-minute lateness/absence rule were added to the student website.

- **2026-08-18:** The public site was converted to a student-first
  presentation. The opening four weeks were prioritized for immediate use,
  Quiz 1 received a public contract and private Blackboard question bank,
  three recovery checkpoints and a glossary were added, and the broken Quarto
  documentation link was corrected.

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
