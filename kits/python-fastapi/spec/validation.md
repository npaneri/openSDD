# Python API — Phase 1 Validation

## Definition of Done
1. GET /health returns 200 with `{"status": "ok"}`
2. POST /users with valid data returns `201 Created`
3. Lint passes with zero new errors
4. Tests pass with baseline count preserved

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 1a | Health endpoint | Returns `200 OK` with `{"status": "ok"}` | |
| 1b | User creation | Creates user with validated data | |
| 1c | Lint | Zero new errors | |
| 1d | Tests | Baseline count preserved | |

## Merge Criteria
- Checklist 100% green with recorded outcomes
- All regression gates green
- No out-of-scope changes in the diff
- Fixes committed individually with root-cause messages

## Phase closeout
- Phase status → `✅ COMPLETE` (the per-phase marker AND the status-table row)
- Follow-ups discovered during verification are recorded (backlog note or the next phase's requirements) — they must not live only in chat history
EOF