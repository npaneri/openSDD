# Phase 5 — Extensions Mechanism

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ✅ COMPLETE

---

## Task Group 1: Convention + README

1.1. Create `extensions/README.md`:
- The two-rule contract: (1) an extension is one `.md` file in `extensions/`, (2) register it with one index-table line
- Required header block spec (name, purpose, author, when-to-use)
- Additive-only rule (may add gates/phase-types/template-variants; may not redefine stages 01–05)
- Index table (empty initially or with the example from TG2)
- "Your first extension" 6-step mini-walkthrough

1.2. Honesty note: "Extensions are community/trust artifacts — review before adopting" (mirrors Spec Kit's catalog disclaimer).

**Exit criteria**: A team can add an extension using only a text editor, following the README alone.

---

## Task Group 2: Worked example extension

2.1. Write `extensions/security-review-gate.md`: header block + content — a pre-merge security-review checklist (secrets check, injection surfaces, auth boundaries, dependency review) + guidance on where to reference it (a phase's `validation.md` merge criteria).

2.2. Register it in the index table.

**Exit criteria**: Example demonstrates the format end-to-end; explicitly labeled "example only — adopt or delete."

---

## Task Group 3: Link + commit

3.1. Link extensions concept from top-level README (repo map + a one-line mention in quick start's "customize" note).

3.2. Commit: `feat(extensions): zero-framework extension convention + security-gate example (Phase 5, SpecSet-1)`.

**Exit criteria**: README links; commit landed.
