# Phase 7 — Terminology Alignment + Catalog / Role Configs

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ✅ COMPLETE

---

## Task Group 1: Terminology pass + mapping table

1.1. Audit `sdd/README.md` glossary + stage-guide headers against rival vocabularies (OpenSpec: proposal/specs/design/tasks/changes/archive/stores; Spec Kit: constitution/specify/plan/tasks/implement/converge/assess/bug).

1.2. Add to the glossary a "Coming from another SDD tool?" mapping table: OpenSDD term ↔ OpenSpec term ↔ Spec Kit term, with one-line distinctions (e.g., SpecSet ≈ their change-scope but feature-area sized; checklist ≠ their converge loop — ours is a gate, theirs iterates).

1.3. Verify zero renames occurred (`git diff sdd/` shows only additive glossary lines).

**Exit criteria**: Mapping table live; guides otherwise untouched.

---

## Task Group 2: Catalog + role files

2.1. Create `catalog/README.md`: concept (discoverable configurations, read-don't-install), curation bar, how to add a config.

2.2. Write `catalog/roles/product-manager.md` — PM engagement per stage: leads kickoff & alignment; reviews constitution scope; reads phase requirements (decisions table focus); attends validation review; skips implementation internals.

2.3. Write `catalog/roles/developer.md` — full-cycle engagement; emphasis on stage 03/04 (specs for their work; task-group gates; tests-born-with-code).

2.4. Write `catalog/roles/qa-engineer.md` — validation/checklist emphasis; owns merge-gate rigor; integrates the bug-fix template; contributes edge paths into requirements checklists.

2.5. Write `catalog/roles/architect.md` — constitution/tech-stack emphasis; owns degradation tables and cross-cutting contracts; points to docs/stores.md for cross-repo work.

2.6. Each file header: "Adapt freely — roles are engagement lenses, not lanes."

**Exit criteria**: 4 role files + catalog README; each self-contained and generic.

---

## Task Group 3: Link + commit

3.1. Link catalog from top-level README.

3.2. Commit: `feat(catalog): terminology mapping + role-based cycle variants (Phase 7, SpecSet-1)`.

**Exit criteria**: README links; commit landed; `git diff sdd/` confirms only additive glossary change across the whole phase.
