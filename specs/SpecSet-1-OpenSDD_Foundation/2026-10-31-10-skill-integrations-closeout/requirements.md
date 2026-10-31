# Phase 10 — Requirements: Agent-Skill Wrapper + Integrations + SpecSet Closeout

## Scope

The additive agent layer (decision #4) plus SpecSet-1 closeout: `SKILL.md` at repo root so any skill-aware agent can auto-drive the cycle; `docs/integrations.md` with concrete per-tool setup steps (complementing Phase 4's matrix); then the full closeout — regression sweep, roadmap statuses ✅, version 1.0.0, CHANGELOG, release commit.

## In Scope

- `SKILL.md` — tool-agnostic agent-facing entry point:
  - What OpenSDD is (one paragraph) and when to use it (user asks to spec a feature, start a SpecSet, create phase specs, validate a phase)
  - The five stages as invocable resources with repo-relative paths
  - The invocation contract: "read the stage guide BEFORE acting; follow its exit criteria"
  - Pointer tables: docs/ai-compatibility.md (matrix), docs/integrations.md (setup), sdd/README.md (map)
  - No tool-specific syntax inside the file (prose + paths only — the tool's own skill system does the mounting)
- `docs/integrations.md` — concrete setup steps per tool family: skill-supporting agents (how to point the agent at SKILL.md), slash-command tools (command-file patterns), plain-chat tools (the paste-prompt workflow). Complements — not duplicates — Phase 4's compatibility matrix; cross-link both ways.
- **SpecSet-1 closeout**:
  - Full genericity sweep of `sdd/` (must be zero-hit — the invariant re-verified at the end, not just the start)
  - All 10 roadmap phases ✅ with validation checklists filled
  - Mission re-check: every "In scope" item delivered or explicitly deferred with reason
  - `VERSION` → `1.0.0`; CHANGELOG 1.0.0 entry (methodology proven across three SpecSets: ToonScript V2, LLM Updates, OpenSDD Foundation)
  - Final release commit

## Out of Scope

- Publishing to GitHub remote / npm / any registry (manual post-SpecSet action; the repo is release-ready after this phase)
- Tool-specific command files beyond the integrations doc (SKILL.md is the single agent artifact; per-tool sugar is documented, not shipped)
- Retiring the FluidChartApp in-project copy (decision #6 says "once published" — publication is post-SpecSet; the retirement is a follow-up action recorded in closeout notes, not this phase's work)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| SKILL.md form | Tool-agnostic prose + resource paths only | Decision #2 (AI-agnostic); each tool's skill system mounts it differently — the file stays neutral |
| One SKILL.md, not many | Single root file | Additive layer principle (decision #4); docs remain the source of truth |
| integrations.md vs ai-compatibility.md | Matrix = "does my tool work?" (Phase 4); integrations = "how do I set it up?" (this phase) | Avoids duplication; cross-linked |
| Version at closeout | 1.0.0 | Methodology now proven across three completed SpecSets — the stability claim is earned |
| Skill-must-not-replace-docs | SKILL.md instructs agents to read guides, never summarizes their content | Guides stay canonical; skill is a router, not a mirror that rots |
| Closeout regression | Re-run every phase's key invariant (sweeps, sh -n, functional spot checks) | Final phase validates the whole, per stage-05 closeout discipline |

## Context

- `SKILL.md` conventions vary by tool (OpenCode skills/, Claude Code project skills, Codex AGENTS-style) — the file at repo root works for tools that auto-discover root SKILL.md; integrations.md documents per-tool mounting.
- The repo now contains: toolkit (12 files), example SpecSet, scaffold.sh, docs (ai-compatibility, stores), extensions + 2 process templates, catalog + 4 roles, bin/sdd + VERSION, and this repo's own SpecSet-1. The closeout sweep covers all of it.
- CHANGELOG history: 0.1.0 (Phase 1, initial import), 0.2.0 (Phase 8, CLI), 1.0.0 (this phase).
- This phase's own spec files are the last written — its validation.md doubles as the SpecSet acceptance record.

## Dependencies

- Phases 1–9 (everything exists to be swept and released).

## Risks

| Risk | Mitigation |
|---|---|
| SKILL.md rots as guides evolve | It routes (paths + when-to-use), never summarizes content |
| integrations.md duplicates Phase 4 matrix | Strict split: matrix=capability claims, integrations=setup steps; cross-links enforced |
| Closeout rubber-stamps | Checklist re-executes invariant checks; failures block 1.0.0 |
| 1.0.0 overpromises | CHANGELOG wording: "methodology stable; packaging may still evolve pre-2.0" |
