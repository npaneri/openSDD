# Phase 6 — Validation

## Definition of Done

1. Both templates exist in `templates/`, single-file, optional, verdict/decision vocabularies accurate.
2. Both registered in the extension index.
3. README mentions both.
4. Core five stages untouched.
5. Commit landed.

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 6a | Bug template header | "Optional; no SDD cycle required" present | |
| 6b | Bug sections | Symptom / Cause / Fix plan / Verification / Verdict all present | |
| 6c | Bug verdicts | `verified` / `partial` / `failed` + honest-record guidance | |
| 6d | Cannot-reproduce row | Degradation path documented | |
| 6e | Idea template header | "Use before opening a SpecSet" present | |
| 6f | Idea sections | Idea / Evidence / Options / Decision / Handoff present | |
| 6g | Idea decisions | `go` / `needs-clarification` / `stop` | |
| 6h | Handoff accuracy | References stage 01 by real name; "stop is useful" ethos kept | |
| 6i | Extension index | Both registered as process templates | |
| 6j | README mentions | One line each | |
| 6k | Core stages untouched | `git diff sdd/` shows no stage-guide changes | |

## Merge Criteria

- Checklist 100% green with real outcomes recorded.
- Phase 7 may begin.
