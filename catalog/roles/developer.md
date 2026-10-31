# SDD Role — Developer

How a Developer uses the Spec-Driven Development cycle.

## Preferred Entry Point

Start at **Stage 02 — Constitution Creation** (`sdd/02-constitution.md`) after kickoff
alignment is complete. Read the mission, tech-stack, and roadmap to understand the
contract before writing any code.

## Typical Workflow for a Developer

| Stage | Action | Reference |
|---|---|---|
| 01 — Kickoff | Read the kickoff guide; ensure scope and naming are confirmed | `sdd/01-kickoff-and-alignment.md` |
| 02 — Constitution | Read the constitution; understand the mission, tech stack, and roadmap | `sdd/02-constitution.md` |
| 03 — Phase Specs | Read the phase spec (requirements, plan, validation) before implementing | `sdd/03-phase-specs.md` |
| 04 — Implementation | Execute task groups in plan order; write tests born with code; follow tech-stack.md conventions | `sdd/04-implementation-and-testing.md` |
| 05 — Validation | Work the validation.md checklist top to bottom; fill Status column with real outcomes | `sdd/05-validation-and-closeout.md` |

## Developer-Specific Tips

- **Tests are born with the behavior.** Each task group writes its tests in the same group.
  The spec's "Test" line in the roadmap and the validation checklist together are the
  behavior contract. Never defer tests to a final "add tests" group.
- **Match the project's code conventions exactly** (tech-stack.md): language subset,
  quoting, imports, style. Silent divergence between spec and code is the one unforgivable sin.
- **Decisions table literalism.** Follow the requirements' Decisions table literally.
  It is the approved contract; creative deviations are spec changes (see *Escaping the spec* in `sdd/04-implementation-and-testing.md`).
- **Small commits.** Per task group (preferred) or per phase — follow the project's convention.
  Message style: `<type>(<scope>): <what> (Phase <N>, <SpecSet>)`.
- **Protect the baseline.** Note the pre-change test count; after the phase the count must be ≥ baseline
  (new tests added, none silently lost).

## When to Escalate

- If implementation proves a spec wrong, STOP coding the affected part. Amend the phase's spec
  files (and the constitution, if a contract changes) with a brief note on why. Get stakeholder
  sign-off if the change alters scope or a Decisions-table entry. Then implement the amended plan.
- If a task group's exit criteria cannot be met, do not start the next group. Flag the issue
  and re-plan. Silent divergence between spec and code is the one unforgivable sin.