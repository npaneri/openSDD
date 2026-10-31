# Phase 9 — Requirements: Cross-Repo Store Guidance

## Scope

`docs/stores.md` — OpenSpec's strongest structural idea (a shared spec store readable by many code repos) delivered as guidance, not infrastructure. Three adoption patterns, scenario walkthrough, honest tradeoffs. Explicitly not hosted, not a service, not beta — a documentation artifact.

## In Scope

- `docs/stores.md` containing:
  - **The problem** — a feature spans multiple repos; requirements are owned centrally and consumed by many; planning must happen before the code exists anywhere
  - **Pattern A: Separate store repo** — a repo containing only `specs/` (+ this toolkit); code repos reference it via clone/submodule/subtree; when to choose (platform teams, shared requirements, many consumers)
  - **Pattern B: Mono-repo specs folder** — specs live in one lead repo; other repos link to it; when to choose (small orgs, tightly coupled code)
  - **Pattern C: Git subtree mirror** — subtree the store into each code repo for offline reads; when to choose (agents need local access, air-gapped work)
  - **Scenario walkthrough** — one cross-repo feature carried through the five stages with the store as the spec home
  - **Honest tradeoffs** — sync friction, merge-conflict surfaces, "specs drift from code" risk and mitigations
- README link (docs area)

## Out of Scope

- Any hosting, sync tooling, or automation (patterns are git mechanics a competent user already knows)
- Conflict with per-repo `specs/` convention — the store IS a repo with `specs/`; no new layout invented
- Cross-store access control (out of proportion; git hosting handles it)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Form | Pure documentation, three patterns | Zero-deps; OpenSpec's Stores are a beta *service*; ours is a *pattern* — the concept without the lock-in |
| Pattern count | Three (store repo / mono-repo / subtree mirror) | Covers the real adoption shapes; more = dilution |
| Toolkit location in store | The store repo carries its own `sdd/` copy | A store is self-describing; consumers read specs, don't need the toolkit |
| Stage behavior across repos | Kickoff + constitution happen IN the store; implementation happens in code repos guided by store specs | The store is the spec home; code repos consume |
| Sync guidance stance | Honest: "git sync is manual discipline; tools help, but the pattern works with plain git pull" | Avoids overpromising; matches simplicity brand |
| Naming | "Store" adopted from OpenSpec (credited) | Community vocabulary; migration path for OpenSpec users |

## Context

- OpenSpec's Stores: beta, CLI-integrated, cross-repo planning in a store of its own — the feature teams most cite when comparing SDD tools. The *need* is real; the *service* is the heavyweight part.
- Our store = a git repo with `specs/` (and optionally `sdd/`) — the layout adopters already know from this very repo.
- The five stages read naturally cross-repo: kickoff/constitution/specs authored in the store; the code repo's AI reads store paths (cloned or subtree'd) during implementation; validation checklists close in the store where the roadmap lives.
- Phase 7's architect role already points here — the pointer resolves in this phase.

## Dependencies

- Phase 1 (README docs area exists).

## Risks

| Risk | Mitigation |
|---|---|
| Readers expect a working tool (OpenSpec habit) | Doc opens with "this is a pattern, not a tool — three plain-git recipes" |
| Patterns overpromised for large teams | Honest tradeoffs section per pattern; no scale claims |
| Drift between store specs and code | Named as the #1 store risk with mitigations (checklist cross-refs, roadmap as single source) |
