# Phase <N> — Validation

## Definition of Done

1. <absolute statement — deliverable exists / behaves>
2. <absolute statement — key contract item>
3. Project gates green (<lint>, <tests>, <project-specific gate>).
4. Committed with the Phase <N> message.

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| <N>a | <observable behavior> | <expected outcome> | |
| <N>b | <edge / degradation path> | <expected outcome> | |
| <N>c | <decisions-table item with observable behavior> | <expected outcome> | |
| <N>d | Project gates | <numbers / baselines> | |

## Merge Criteria

- Checklist 100% green with real outcomes recorded (verified against the running system, not from memory).
- All regression gates green; no out-of-scope changes in the diff.
- Fixes (if any) committed individually with root-cause messages.
