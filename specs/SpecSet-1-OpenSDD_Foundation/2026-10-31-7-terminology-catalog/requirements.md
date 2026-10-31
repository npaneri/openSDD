# Phase 7 — Requirements: Terminology Alignment + Catalog / Role Configs

## Scope

Two alignment moves from the OpenSpec/Spec-Kit study: (a) a terminology pass ensuring OpenSDD vocabulary matches broader SDD-community usage where divergence would confuse adopters arriving from rival tools; (b) a `catalog/` folder with role-based cycle configurations — Spec Kit's "bundle" concept delivered as readable Markdown, not installable packages.

## In Scope

- Terminology pass over `sdd/README.md` glossary (and spot-check of stage guides):
  - Cross-check our terms (SpecSet, constitution, phase, task group, checklist, decisions table, degradation table, status vocabulary) against OpenSpec usage (proposal/specs/design/tasks/archive) and Spec Kit usage (constitution/specify/plan/tasks/implement/converge)
  - Where our term is clearer, keep it; where a rival term is becoming standard and ours causes friction, add a glossary cross-reference line (keep our term as primary — don't churn the proven guides)
  - Document the mapping explicitly so migrating users can translate
- `catalog/README.md` — what the catalog is (discoverable configurations, read-don't-install), how to add one
- `catalog/roles/` — four role variant files:
  - `product-manager.md` — how a PM uses the cycle (kickoff-heavy, validation-review-focused; skips implementation internals)
  - `developer.md` — full-cycle usage with implementation emphasis
  - `qa-engineer.md` — validation/checklist-heavy usage; bug template integration
  - `architect.md` — constitution/tech-stack emphasis; cross-repo store guidance pointer
- README link to catalog

## Out of Scope

- Renaming any core artifact or stage (alignment = cross-references, not churn)
- Tooling to install/apply catalog configs (they are documents to read and adapt)
- More than four roles (more dilute than clarify; additions are trivial later)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Alignment direction | Cross-reference, don't rename | Guides are battle-tested across two SpecSets; churn risks the proven core |
| Mapping table location | Glossary section of `sdd/README.md` (one table: OpenSDD term → OpenSpec term → Spec Kit term) | Single source; adopters from any tool translate in one hop |
| Catalog form | Plain Markdown per role, no frontmatter schema | Read-don't-install principle; zero tooling |
| Role files scope | "How this role engages each stage" (which stages they lead vs review) — not separate methodologies | One cycle, different engagement — reinforces simplicity |
| Count | Exactly 4 roles | PM/dev/QA/architect covers the common team shape; more roles = dilution |

## Context

- Terminology overlap is high already (both rivals also use "constitution"); the real gaps: our "SpecSet" vs OpenSpec's "change" (they scope per-change, we per-feature-area); our "checklist" vs Spec Kit's "converge" (their loop vs our gate). The mapping table resolves these honestly.
- Spec Kit's bundles are installable curated sets; ours are readable variants — the concept survives at zero weight.
- Each role file must remain generic (no project facts), consistent with the repo's genericity rule for anything under `sdd/`-adjacent content.

## Dependencies

- Phase 2 (example gives role authors a concrete artifact to reference).

## Risks

| Risk | Mitigation |
|---|---|
| Terminology churn destabilizes guides | Hard rule: no renames; cross-references only |
| Role files read as "you must be one role" | Header in each: "Adapt freely — roles are engagement lenses, not lanes" |
| Catalog grows unbounded | `catalog/README.md` states the curation bar (common, actionable, generic) |
