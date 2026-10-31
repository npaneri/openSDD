# Phase 1 — Requirements: Greeting Widget

## Scope

This phase defines the requirements for a greeting widget — a simple UI component that displays a personalized greeting. The widget accepts a `name` parameter and renders "Hello, Alice!". This phase proves that the OpenSDD templates can be fully filled without framework-specific knowledge.

## In Scope

- Greeting widget that accepts a `name` parameter
- Rendered output: "Hello, Alice!"
- One-row degradation table for render failures (mission.md)
- The phase sits as the first and only phase in a minimal SpecSet

## Out of Scope

- Actual implementation of the widget (the example is a spec artifact, not a build target)
- Framework-specific code (React, Vue, etc. — the template is generic)
- CI workflows, test suites, build configurations (deferred — not in the full-vision list for this example)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Widget name | `GreetingWidget` | Universally understood; no domain jargon |
| Greeting format | `Hello, Alice!` | Simple, positive, universally understood |
| Render failure mode | Plain-text fallback | Zero-dependency; works without CSS or frameworks |

## Context

- Templates live in `sdd/templates/`: `mission.template.md`, `tech-stack.template.md`, `roadmap.template.md`, `requirements.template.md`, `plan.template.md`, `validation.template.md`.
- Every template uses italic guidance comments — this example replaces every token and removes every guidance comment (or converts to content).
- Stage guides (`sdd/02-constitution.md`, `sdd/03-phase-specs.md`) describe the canonical section structure; this example matches those structures exactly, since adopters will cross-reference.
- This phase doubles as the first real test of template quality: any friction found is a finding to record (and fix via escape-the-spec if blocking).

## Dependencies

- Phase 2 (example validates template completeness the script depends on). This is the first and only phase, so no prior phases exist.

## Risks

| Risk | Mitigation |
|---|---|
| Example accidentally reads as "the official OpenSDD sample architecture" | README explicitly frames it as a template-syntax demo, not a methodology model |
| Template flaws discovered mid-example | Escape-the-spec: amend template in `sdd/templates/`, note it, continue |
| Example too clever (domain jargon creeps in) | Greeting widget has zero domain knowledge; a newcomer understands it instantly |