# Phase 2 — Requirements: Minimal Example SpecSet

## Scope

Build `examples/minimal-specset/` — a complete, toy SpecSet written **only** from `sdd/templates/`, demonstrating the entire cycle end-to-end on a tiny universal feature. Proves template self-sufficiency and gives adopters a worked example to study before authoring their own.

## In Scope

- `examples/README.md` — what the example demonstrates, how to read it (which stage guide produced which file), and how to use it as a starting point.
- `examples/minimal-specset/` — constitution (`mission.md`, `tech-stack.md`, `roadmap.md`) + one phase directory (`YYYY-MM-DD-1-<slug>/requirements.md`, `plan.md`, `validation.md`).
- Toy feature choice: something universally understood, no domain knowledge, implementable in minutes if anyone ever actually builds it (e.g., "add a greeting widget" or "add a hello endpoint").
- Filled placeholders throughout — zero `<...>` template tokens remaining.

## Out of Scope

- Actually implementing the toy feature (the example is a *spec* artifact, not a build target).
- Modifying the templates themselves (if the example reveals a template flaw → escape-the-spec: fix the template first, then continue — see plan).
- Additional example SpecSets (one is enough; more dilute rather than clarify).

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Toy feature | "Greeting widget" — a UI component showing a personalized greeting | Universally understood; no backend, no domain jargon |
| Phase count in example | Exactly 1 phase | Demonstrates the unit of work without implying examples need long roadmaps |
| Dates in example | Use a fixed illustrative date (e.g., `2026-01-01-1-greeting-widget`) | Examples should be stable artifacts, not drift with real time |
| Status in example | Roadmap shows phase as `✅ COMPLETE`, checklists fully filled | Adopters see the *end state* — what "done" looks like — not empty scaffolds |
| Tech-stack in example | Minimal fictional stack described generically | Proves templates work for any stack; avoids implying OpenSDD has stack opinions |
| Degradation table in example | Included in mission (trivial one-row: widget render failure → show plain text fallback) | Teaches the degradation-table discipline even in a toy |

## Context

- Templates live in `sdd/templates/`: `mission.template.md`, `tech-stack.template.md`, `roadmap.template.md`, `requirements.template.md`, `plan.template.md`, `validation.template.md`.
- Every template uses `<placeholder>` angle-bracket tokens and italic guidance comments — the example must replace every token and remove every guidance comment (or convert to content).
- Stage guides (`sdd/02-constitution.md`, `sdd/03-phase-specs.md`) describe the canonical section structure; the example must match those structures exactly, since adopters will cross-reference.
- This phase doubles as the first real test of template quality: any friction found is a finding to record (and fix via escape-the-spec if blocking).

## Dependencies

- Phase 1 (repo exists with README pointing at `examples/`).

## Risks

| Risk | Mitigation |
|---|---|
| Example accidentally reads as "the official OpenSDD sample architecture" | README explicitly frames it as a template-syntax demo, not a methodology model |
| Template flaws discovered mid-example | Escape-the-spec: amend template in `sdd/templates/`, note it, continue |
| Example too clever (domain jargon creeps in) | Greeting widget has zero domain knowledge; a newcomer understands it instantly |
