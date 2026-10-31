# Phase 4 — Validation

## Definition of Done

1. `docs/ai-compatibility.md` exists with invariant statement, tool matrix, per-stage snippets, context hygiene, degradation ladder.
2. README links the doc.
3. Genericity sweep on `sdd/` still clean (tool names only in docs).
4. Commit landed.

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 4a | Invariant statement | "No tool-specific syntax inside `sdd/`" present | |
| 4b | Tool matrix | ≥8 named tools + generic fallback row | |
| 4c | Honest cells | Native-skill vs plain-chat distinctions accurate; no overpromises | |
| 4d | Per-stage snippets | 5 stages × copy-paste prompt each | |
| 4e | Snippet paths | Repo-relative (`sdd/…`), no absolute paths | |
| 4f | Context hygiene | Per-stage session guidance present, practice-derived | |
| 4g | Degradation ladder | Skill → slash → plain chat → human, base rung complete | |
| 4h | README link | Compatibility section links `docs/ai-compatibility.md` | |
| 4i | Sweep (`sdd/`) | Zero tool-name hits | |
| 4j | No model recommendations | Doc makes no "best model" claims | |

## Merge Criteria

- Checklist 100% green with real outcomes recorded.
- Phase 5 may begin.
