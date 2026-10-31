# Phase 1 — Requirements: Repo Scaffolding

## Scope

Establish OpenSDD as a publishable open-source repository: top-level README (the front door), MIT license, .gitignore, CHANGELOG seeded at 0.1.0, git init and initial commit. No changes to `sdd/` content.

## In Scope

- `README.md` — what OpenSDD is, why it exists (vs. doing nothing), 3-step quick start (copy `sdd/` → run stage 01 → follow phase specs), repo map, links to `sdd/README.md`, `brainstorm_ideas.md`, license.
- `LICENSE` — MIT, copyright holder = repo owner (confirm name at implementation).
- `.gitignore` — `.DS_Store`, editor droppings (`.idea/`, `.vscode/` optional), nothing else.
- `CHANGELOG.md` — Keep-a-Changelog style, seeded `0.1.0` describing the initial toolkit import.
- `git init` (default branch `main`), initial commit including `sdd/`, `specs/`, `brainstorm_ideas.md`, and the new files.

## Out of Scope

- Any edit to the 12 `sdd/` toolkit files (the toolkit content ships as-is from FluidChartApp; content changes only via later phases' scope).
- GitHub remote creation / publishing (manual, post-SpecSet or at stakeholder's call).
- CI workflows, issue templates, PR templates (nice-to-have; deferred — not in the full-vision list).

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| README depth | One-screen pitch + quick start; deep docs live in `sdd/README.md` and `docs/` | Front door, not manual; rivals' READMEs bury the quick start under badges |
| License | MIT (decision #2, settled) | Maximum adoption, matches both rival repos |
| Version seed | `0.1.0` in CHANGELOG | Pre-1.0 while methodology stabilizes (decision #5); 1.0.0 reserved for Phase 10 closeout |
| Git branch | `main` | GitHub default; matches rival repos |
| Badges | None for now | Simplicity; add CI badges only if CI exists |
| Telemetry disclosure | None needed — repo ships no code that phones home until Phase 8; README states the privacy stance up front | Trust-building; rivals bury telemetry notes in details blocks |

## Context

- Repo path: `/Users/nimishpaneri/Documents/repos/OpenSDD`; currently not a git repo; contains `sdd/` (12 files, copied 2026-10-30, byte-identical to FluidChartApp origin) and `brainstorm_ideas.md`.
- Genericity sweep baseline: `sdd/` currently returns zero hits for framework/tool names — the README must not break this (README may name tools as *compatibility claims*, that's allowed; `sdd/` stays clean).
- The stage-01 guide in `sdd/` was followed to produce this SpecSet (dogfooding proof already exists).

## Dependencies

- None. First phase.

## Risks

| Risk | Mitigation |
|---|---|
| README oversells (toolkit is guides, not software) | Pitch = "process you can copy in 5 minutes"; avoid software screenshots/dashboard promises |
| MIT copyright holder ambiguous | Ask stakeholder at implementation time (one-line confirm) |
| `.DS_Store` already inside `sdd/` from copy | Clean before initial commit; add to .gitignore |
