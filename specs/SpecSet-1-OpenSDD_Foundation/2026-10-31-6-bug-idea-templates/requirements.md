# Phase 6 — Requirements: Bug-Fix + Idea-Assessment Templates

## Scope

Two optional single-file process templates, inspired by GitHub Spec Kit's bundled bug-fixing and idea-assessment processes, adapted to OpenSDD's zero-weight philosophy: they are extension templates (Phase 5's convention), not new mandatory cycle stages.

## In Scope

- `templates/bug-fix.template.md` — single-file process: symptom capture → cause assessment → scoped fix plan → verification record (verdict: verified / partial / failed)
- `templates/idea-assessment.template.md` — single-file process: idea capture → evidence gathering → options → decision record (go / needs-clarification / stop) with handoff note to the SDD cycle for a "go"
- Registration of both in `extensions/README.md` index (they are extensions of type "process template")
- Guidance in each template: where it slots into a team's flow (bug-fix during any phase's implementation; idea-assessment before ever opening a SpecSet)

## Out of Scope

- Making either process mandatory or adding new stages to the five-stage cycle
- Multi-file breakdowns (Spec Kit's versions are multi-stage with separate reports; ours are deliberately single-file)
- Integration between the two templates (a "go" decision references the kickoff stage by name; that's the whole linkage)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Form factor | Single file per process | Zero-weight principle; Spec Kit's are multi-command; ours must work with paste-and-fill |
| Placement | `templates/` (beside the 6 core templates) | They ARE templates; extension registration lives in the index |
| Verdict vocabulary (bug) | `verified` / `partial` / `failed` | Adopted from Spec Kit — clear, honest, non-binary |
| Decision vocabulary (idea) | `go` / `needs-clarification` / `stop` | Adopted from Spec Kit; "stop with documented reason is a useful outcome" ethos kept |
| Bug template trigger | "Any time broken behavior is reported — no SpecSet required" | Matches Spec Kit's independence claim; bugs don't wait for SDD |
| Idea handoff | "go" section ends with: establish a SpecSet, begin at stage 01, paste this decision as context | Clean bridge into the core cycle without coupling |
| Degradation note in bug template | Includes "if you can't reproduce, document what you tried" row | Real-world honesty |

## Context

- Spec Kit's `bug` extension: assess → fix → test with verdicts; `assess` extension: intake → research → define → shape → decide. Both are substantial multi-command flows. Our versions compress each to one fillable file — the *structure* survives, the machinery doesn't.
- Phase 5 established the extension convention (file + index line) — this phase is its first real consumer besides the shipped example.
- The core five stages are untouched; these templates explicitly say "you do not need the SDD cycle to use this file."

## Dependencies

- Phase 5 (extension convention + index).

## Risks

| Risk | Mitigation |
|---|---|
| Templates read as "OpenSDD now includes bug tracking" | Header line in each: "Optional single-file process — no SDD cycle required" |
| Verdicts mistaken for enforced states | "Record the verdict honestly; the value is the record, not the label" guidance |
| Duplication with core validation checklists | Bug template scoped to *defects*; validation checklists stay *phase acceptance* — stated in both |
