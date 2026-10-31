# Phase 5 — Requirements: Extensions Mechanism

## Scope

Adopt the strongest idea from GitHub's Spec Kit — extensibility — at zero framework cost. An OpenSDD extension is a convention, not software: a Markdown file in `extensions/` plus one index line. Teams customize the cycle (add phase types, quality gates, template variants) without forking `sdd/`.

## In Scope

- `extensions/README.md` — the convention definition:
  - What an extension is (one `.md` file: name, purpose, when-to-use, the content itself)
  - The index table (name → file → purpose) as the discovery mechanism
  - How to add an extension (write the file, add the index line — that's all)
  - How extensions relate to core guides (additive only; extensions never modify the five stages)
  - A "your first extension" worked mini-walkthrough
- One shipped worked-example extension (e.g., `extension-security-review-gate.md` — a quality-gate extension adding a security-review checklist step before merge, a universally understood need)
- README (top-level) link to the extensions concept

## Out of Scope

- Any loader, installer, registry, or code (the mechanism is reading + convention)
- Extensions that *modify* the core five stages (additive-only rule; overriding core = fork the repo, which is allowed but not the mechanism)
- A marketplace/catalog of community extensions (Phase 7's `catalog/` is the adjacent concept — role configs, not extensions)
- Enforcing extension quality (trust the reader; the docs say to review before adopting — mirrors Spec Kit's catalog honesty note)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Mechanism type | Pure convention (file + index line) | Zero-deps principle; Spec Kit's extension system requires its CLI — ours requires a text editor |
| Extension file format | Free-form Markdown with a required header block (name, purpose, author, when-to-use) | Standardized discovery without rigid schema |
| Index | Single table in `extensions/README.md` | One file to scan; PR-reviewable in one diff |
| Additive-only | Extensions may add gates, phase types, template variants; may not redefine stages 01–05 | Protects the proven core; still allows massive customization |
| Shipped example | Security-review merge gate | Universal, realistic, demonstrates the gate-extension category |
| Relationship to `sdd/` | Extensions live beside, never inside, `sdd/` | Core stays generic and stable; extensions carry the local flavor |

## Context

- Spec Kit's extension model (commands, presets, workflows, hooks, catalogs) is powerful but requires their Python CLI to load. OpenSpec's schema system similar. Our adoption: the *concept* (teams extend without forking), re-implemented at zero cost.
- The stage guides describe exits/gates; an extension gate (like security review) plugs into a team's `validation.md` merge criteria by convention — the extension file says where to reference it.
- Phase 6 (bug-fix/idea templates) will register as extensions in the same index — this phase establishes the pattern Phase 6 consumes.

## Dependencies

- Phase 2 (example SpecSet gives extension authors the filing context).

## Risks

| Risk | Mitigation |
|---|---|
| Convention ignored / extensions scattered | README states the two-rule contract prominently; index table is the norm |
| Extensions drift into core-modification | Additive-only rule stated in README + PR-review checklist note |
| Shipped example mistaken for mandatory | Explicit "example only — adopt or delete" label |
