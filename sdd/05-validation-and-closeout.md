# Stage 05 — Validation, Merge & Closeout

**When**: Phase implementation is complete (stage 04).
**Goal**: Prove the phase against its checklist with recorded evidence, merge it, and — for the final phase — close the SpecSet.

## Validation

1. Open the phase's `validation.md`. Work the checklist **top to bottom**, verifying each item against the REAL system (running app, live service, actual command output) — never from memory of what the code "should" do.
2. Fill the Status column per item: pass/fail plus short notes (actual outputs, upstream error codes, environment caveats).
3. Any failed item → fix (small commit, root-cause message) → re-verify → update the row. Do not batch fixes into one opaque commit.
4. Manual checks: record what was done to exercise them (steps, inputs, observed behavior) so another person can repeat the verification.

## Regression gates (final gate before merge)

Run every project gate named in the constitution's completion criteria and tech-stack.md — typically:

- full test suite (count ≥ baseline, zero failures)
- linter (no new errors vs. the recorded baseline)
- project-specific gates (e.g. security-rules tests) where applicable

Record actual numbers or summaries in the checklist or a short results note.

## Merge

The Merge Criteria section in `validation.md` is authoritative. Typical shape:

- Checklist 100% green with recorded outcomes
- All regression gates green
- No out-of-scope changes in the diff
- Fixes committed individually with root-cause messages

## Phase closeout

- Roadmap: phase status → `✅ COMPLETE` (the per-phase marker AND the status-table row).
- Follow-ups discovered during verification are recorded (backlog note or the next phase's requirements) — they must not live only in chat history.

## SpecSet closeout (final phase only)

- [ ] Every roadmap phase `✅ COMPLETE`
- [ ] Final E2E / verification matrix recorded (the last phase is typically verification-only — its checklist IS the SpecSet acceptance record)
- [ ] Constitution claims re-checked: all mission scope items delivered; if the mission changed during the work, mission.md was amended (see *Escaping the spec* in stage 04)
- [ ] Results / verification commit landed
- [ ] Lessons learned: what should change in the SDD guides or templates for next time? Apply small improvements immediately; discuss large ones with the stakeholder
