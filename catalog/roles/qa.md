# SDD Role — QA (Quality Assurance)

How a QA engineer uses the Spec-Driven Development cycle.

## Preferred Entry Point

Start at **Stage 05 — Validation, Merge & Closeout** (`sdd/05-validation-and-closeout.md`).
The validation checklist is the QA's primary artifact.

## QA Workflow

| Stage | Action | Reference |
|---|---|---|
| 01 — Kickoff | Observe the kickoff; note scope and decisions for later test planning | `sdd/01-kickoff-and-alignment.md` |
| 02 — Constitution | Note the mission and tech-stack for test context; understand the degradation table | `sdd/02-constitution.md` |
| 03 — Phase Specs | Review the validation.md template; note the checklist structure and merge criteria | `sdd/03-phase-specs.md` |
| 04 — Implementation | Track code changes; note any deviations from the plan for later verification | `sdd/04-implementation-and-testing.md` |
| 05 — Validation & Closeout | **Work the validation.md checklist top to bottom**, verifying each item against the REAL system — never from memory. Fill the Status column per item. | `sdd/05-validation-and-closeout.md` |

## QA-Specific Tips

- **Definition of Done**: The 4–6 numbered, absolute statements in `validation.md`'s Definition of Done section are your primary check. Every item must be verified against the running system, not from memory of what the code "should" do.
- **Verification Checklist**: The `| # | Check | Expected | Status |` table is where you record outcomes. Start with all rows empty, work top to bottom, and fill each row with pass/fail plus short notes (actual outputs, upstream error codes, environment caveats).
- **Any failed item → fix → re-verify → update the row.** Do not batch fixes into one opaque commit. Each fix gets its own small commit with a root-cause message.
- **Manual checks**: Record what was done to exercise them (steps, inputs, observed behavior) so another person can repeat the verification.
- **Regression gates**: Run every project gate named in the constitution's completion criteria and tech-stack.md — typically: full test suite (count ≥ baseline, zero failures), linter (no new errors vs. recorded baseline), project-specific gates.
- **Merge criteria authority**: The Merge Criteria section in `validation.md` is authoritative. Checklist 100% green with recorded outcomes, all regression gates green, no out-of-scope changes in the diff.

## When to Escalate

- If a failed checklist item cannot be fixed with a small commit, flag it as a follow-up
  (backlog note or the next phase's requirements). It must not live only in chat history.
- If the validation checklist consistently fails, escalate to the stakeholder with evidence
  and a recommendation — this indicates the spec itself may need amendment, not just the code.