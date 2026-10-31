# SDD Role — Architect

How an Architect uses the Spec-Driven Development cycle.

## Preferred Entry Point

Start at **Stage 01 — Kickoff & Alignment** (`sdd/01-kickoff-and-alignment.md`) to understand
the scope, then move to **Stage 02 — Constitution Creation** (`sdd/02-constitution.md`)
to review the mission, tech-stack, and roadmap for architectural decisions.

## Architect Workflow

| Stage | Action | Reference |
|---|---|---|
| 01 — Kickoff | Review the featured area's scope and stakeholder questions; flag architectural concerns early | `sdd/01-kickoff-and-alignment.md` |
| 02 — Constitution | Review the degradation table in `mission.md`; ensure failure-mode behaviors are canonical and verbatim | `sdd/02-constitution.md` |
| 03 — Phase Specs | Review the decisions table in `requirements.md`; check that format caps, concurrency, UX states are consistent and defined once, referenced everywhere | `sdd/03-phase-specs.md` |
| 04 — Implementation | Review that the code respects the degradation table and that no silent divergence exists between spec and implementation | `sdd/04-implementation-and-testing.md` |
| 05 — Validation & Closeout | Verify the full SpecSet E2E matrix: every roadmap phase ✅, every decisions-table item with observable behavior tested, every degradation/edge path covered | `sdd/05-validation-and-closeout.md` |

## Architect-Specific Tips

- **Degradation table is canonical.** The failure modes and behaviors defined in the mission
  mission.md degradation table must be referenced verbatim by every later artifact. If a new
  failure mode is discovered, the mission.md must be amended first, then the code amended
  per the "Escaping the spec" guidelines in `sdd/04-implementation-and-testing.md`.
- **Decisions table consistency.** Every shape or format decision that more than one phase
  depends on belongs in tech-stack.md, defined once and referenced everywhere. Check that
  the decisions table is consistent across all phases of the SpecSet.
- **Escape the spec properly.** If implementation proves a spec wrong, the process is:
  1. STOP coding the affected part.
  2. Amend the phase's spec files (and the constitution, if a contract changes) with a brief
     note on why.
  3. Get stakeholder sign-off if the change alters scope or a Decisions-table entry.
  4. Then implement the amended plan.
- **No silent divergence.** The spec are the merge contract. Silent divergence between spec and
  code is the one unforgivable sin of this method.
- **E2E matrix for the full SpecSet.** For the final phase, the validation checklist must cover:
  - Every decisions-table item with observable behavior
  - Every degradation/edge path
  - The project gates (lint, tests, any project-specific gates)
  - Full E2E / verification matrix — the last phase's checklist IS the SpecSet acceptance record

## When to Escalate

- If the degradation table needs expansion to cover a new failure mode, amend mission.md first
  before any code changes. This is critical — the degradation table vocabulary must remain
  consistent across all artifacts.
- If the decisions table has inconsistent format/cap/concurrency decisions across phases,
  converge them before the SpecSet closeout. Record the convergence decision and rationale.
- If the E2E matrix cannot be completed (checklist items cannot be verified against the running
  system), flag this as a blocker for SpecSet closeout and escalate to the stakeholder.