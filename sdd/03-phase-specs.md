# Stage 03 — Phase Spec Creation

**When**: The constitution is approved. (All phases' specs at once, or just-in-time per phase — follow the stakeholder's stage-01 answer.)
**Goal**: For each phase, a dated directory with three files that fully specify scope, tasks, and acceptance.

## Directory

```
specs/<SpecSet>/YYYY-MM-DD-<N>-<feature-name>/
  requirements.md
  plan.md
  validation.md
```

`N` is the roadmap phase number; `<feature-name>` is a short kebab-case slug.

## requirements.md — *what and why*

Sections, in order (see `templates/requirements.template.md`):

1. **Scope** — one paragraph positioning the phase in the SpecSet.
2. **In Scope** — bullet list of concrete deliverables.
3. **Out of Scope** — bullets that preempt creep; name the neighboring phases that own the excluded work.
4. **Decisions** — MANDATORY table: `| Decision | Choice | Rationale |`. Every real tradeoff goes here (formats, caps, concurrency, UX states). This is the most valuable review surface in the whole spec — treat it as such.
5. **Context** — evidence-based facts about the code being changed (file locations, current behavior, prior-phase contracts, environment constraints). Read the code before writing this.
6. **Dependencies** — prior phases / external prerequisites.
7. **Risks** — table `| Risk | Mitigation |`.

## plan.md — *how, in order*

Header, verbatim fields:

```
**Date**: <YYYY-MM-DD>
**Branch**: <implementation branch>
**Status**: <status vocabulary>
```

Then **task groups**: `## Task Group 1: <name>` containing numbered steps (`1.1`, `1.2`, …) and ending with a bolded **Exit criteria** line. Rules:

- Each task group = one coherent increment with its own gate.
- Tests appear INSIDE the task group that creates the behavior they pin — never deferred to a final "add tests" group.
- The last group covers the project gates (lint/tests), the commit, and any doc/status updates.

## validation.md — *how we'll know it worked*

1. **Definition of Done** — 4–6 numbered, absolute statements.
2. **Verification Checklist** — table `| # | Check | Expected | Status |`, items numbered `<phase>a`, `<phase>b`, … The Status column starts EMPTY.
3. **Merge Criteria** — references the checklist and states what must be true to merge (checklist 100% green, gates green, no out-of-scope changes).

The checklist must cover: every Decisions-table item with observable behavior, every degradation/edge path, the project gates, and — for the final phase — the full SpecSet E2E matrix.

## Consistency rules (before declaring specs done)

- Sweep the whole SpecSet for stale phase numbers and cross-reference errors.
- Every contract referenced from tech-stack.md or the mission (shapes, sources, caps) is quoted consistently — define once, reference everywhere.
- Plan step numbers match their Task Group heading numbers.

## Exit criteria

- [ ] Three files present for the phase; headers and sections canonical
- [ ] Decisions table complete; checklist ↔ merge criteria aligned
- [ ] Stakeholder review done (or explicitly waived per the stage-01 flow answer)
