# Phase 3 — Validation

## Definition of Done

1. `scripts/scaffold.sh` exists, POSIX-clean (`sh -n`), executable.
2. Both subcommands work from any CWD; outputs byte-identical to templates.
3. All guard cases (missing template, existing target, bad args) fail loudly with distinct exit codes.
4. README quick start mentions scaffolding.
5. Commit landed.

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 3a | `sh -n` syntax | Clean | |
| 3b | `specset TestSet` | 3 constitution files, byte-identical to templates | |
| 3c | `phase TestSet 1 my-feature` | `YYYY-MM-DD-1-my-feature/` with 3 phase files | |
| 3d | Date correctness | Dir prefix = system date at run time | |
| 3e | CWD independence | Both subcommands work from `/tmp` | |
| 3f | Missing template | Non-zero exit + clear message | |
| 3g | Existing target dir | Refusal + actionable message; nothing overwritten | |
| 3h | Bad args / no args | Usage text + non-zero exit | |
| 3i | Closing hint printed | Points to the right stage guide for filling | |
| 3j | README updated | Scaffolding line + usage snippet in quick start | |
| 3k | POSIX portability | No bashisms (`[[`, arrays) — grep spot-check | |

## Merge Criteria

- Checklist 100% green with real outcomes recorded (functional runs actually executed, outputs diffed).
- Phase 4 may begin.
