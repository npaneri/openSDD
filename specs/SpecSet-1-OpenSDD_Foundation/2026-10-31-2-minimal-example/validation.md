# Phase 2 — Validation

## Definition of Done

1. `examples/minimal-specset/` contains a complete constitution + one phase spec, built only from templates.
2. Zero unfilled `<...>` placeholder tokens anywhere in the example.
3. `examples/README.md` maps stage guides to produced files.
4. Template friction logged (findings or explicit "none").
5. Commit landed.

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 2a | Constitution files | mission/tech-stack/roadmap present | |
| 2b | Phase directory | `2026-01-01-1-greeting-widget/` with 3 files | |
| 2c | Zero template tokens | `grep -r "<[A-Za-z]" examples/` finds no leftover placeholders | |
| 2d | Structure vs stage 02 | Section order matches `sdd/02-constitution.md` anatomy | |
| 2e | Structure vs stage 03 | Requirements/plan/validation match `sdd/03-phase-specs.md` anatomy | |
| 2f | Degradation table present | One-row table in example mission | |
| 2g | Decisions table present | Toy decisions in example requirements | |
| 2h | Done-state visible | Roadmap phase ✅; checklist Status cells filled | |
| 2i | examples/README.md | Stage→file mapping table; "syntax demo not architecture" framing | |
| 2j | Friction log | Recorded in phase validation.md (findings or "none") | |
| 2k | Templates unchanged-or-amended | `git diff sdd/templates/` empty, or amendments documented via escape-the-spec | |

## Merge Criteria

- Checklist 100% green with real outcomes recorded.
- Any template amendment committed separately with root-cause message.
- Phase 3 may begin.
