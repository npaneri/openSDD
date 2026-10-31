# Phase 2 — Minimal Example SpecSet

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — not started

---

## Task Group 1: Constitution from templates

1.1. Create `examples/minimal-specset/`. Fill `mission.template.md` → `mission.md`: purpose (greeting widget), problem, solution, one core principle, scope, and the one-row degradation table (render failure → plain-text fallback).

1.2. Fill `tech-stack.template.md` → `tech-stack.md`: minimal generic stack, conventions section, target-addition table for the widget.

1.3. Fill `roadmap.template.md` → `roadmap.md`: one phase (`✅ COMPLETE`), status table row matching, philosophy section with placeholder gates replaced by generic statements.

1.4. Verify: zero unfilled `<...>` tokens; every section from `sdd/02-constitution.md` present in the right order.

**Exit criteria**: Three constitution files, zero template tokens, structure matches stage-02 anatomy.

---

## Task Group 2: Phase spec from templates

2.1. Create `examples/minimal-specset/2026-01-01-1-greeting-widget/`.

2.2. Fill `requirements.template.md`: scope, in/out, decisions table (2–3 toy decisions), context, dependencies, risks.

2.3. Fill `plan.template.md`: header (fixed date, illustrative branch, ✅ COMPLETE), 2 task groups with numbered steps and exit criteria, gates+commit group.

2.4. Fill `validation.template.md`: definition of done, fully-filled checklist (all Status cells marked pass), merge criteria.

2.5. Verify: zero unfilled tokens; structure matches `sdd/03-phase-specs.md` anatomy; checklist numbering follows `<phase>a, <phase>b…` convention.

**Exit criteria**: Complete phase directory; a reader can see exactly what "done" looks like.

---

## Task Group 3: examples README + friction log

3.1. Write `examples/README.md`: what this demonstrates, the stage-guide → file mapping table, "use as a starting point" note, explicit framing as syntax demo not architecture model.

3.2. Record any template friction encountered (list in the phase validation.md); if any template flaw was blocking, confirm the escape-the-spec amendment landed in `sdd/templates/`.

3.3. Commit: `feat(examples): minimal example SpecSet built purely from templates (Phase 2, SpecSet-1)`.

**Exit criteria**: README written; friction log complete (even if empty); commit landed.
