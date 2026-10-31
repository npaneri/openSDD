# Phase 1 — Validation

## Definition of Done

1. `mission.md`, `tech-stack.md`, `roadmap.md` exist at the SpecSet root, internally consistent
2. Zero unfilled `<...>` placeholder tokens anywhere in the example
3. `examples/README.md` maps stage guides to produced files
4. Template friction logged (findings or explicit "none")
5. Commit landed with `feat(examples): minimal example SpecSet built purely from templates (Phase 1, SpecSet-1)`
6. Genericity sweep on `sdd/` still returns zero hits

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 1a | Constitution files | mission/tech-stack/roadmap present | ✅ |
| 1b | Phase directory | `2026-01-01-1-greeting-widget/` with 3 files | ✅ |
| 1c | Zero template tokens | `grep -r "<[A-Za-z]" examples/` finds no leftover placeholders | ✅ |
| 1d | Structure vs stage 02 | Section order matches `sdd/02-constitution.md` anatomy | ✅ |
| 1e | Structure vs stage 03 | Requirements/plan/validation match `sdd/03-phase-specs.md` anatomy | ✅ |
| 1f | Degradation table present | One-row table in example mission | ✅ |
| 1g | Decisions table present | Toy decisions in example requirements | ✅ |
| 1h | Done-state visible | Roadmap phase ✅; checklist Status cells filled | ✅ |
| 1i | examples/README.md | Stage→file mapping table; "syntax demo not architecture" framing | ✅ |
| 1j | Friction log | Recorded in phase validation.md (findings or "none") | ✅ |
| 1k | Templates unchanged-or-amended | `git diff sdd/templates/` empty, or amendments documented via escape-the-spec | ✅ |

## Merge Criteria

- Checklist 100% green with real outcomes recorded.
- Any template amendment committed separately with root-cause message.
- Phase 3 may begin.