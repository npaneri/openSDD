# Python API — Phase 1

**Date**: 2026-11-02
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — implementation pending

---

## Task Group 1: Project structure

1.1. Initialize project with `poetry init`
1.2. Install dependencies: `poetry add fastapi pytest`
1.3. Create directory structure: `app/routes/`, `app/validators/`
**Exit criteria**: Project structure ready for route handlers.

---

## Task Group 2: Implement GET /health

2.1. Create `app/routes/health.py` with FastAPI handler returning `{"status": "ok"}`
2.2. Create validator for response shape
2.3. **Exit criteria**: Health endpoint returns `200 OK` with `{"status": "ok"}`

---

## Task Group 2: Implement POST /users

2.1. Create `app/routes/users.py` with FastAPI handler for creating a user
2.2. Create Pydantic model for user request body
2.3. **Exit criteria**: POST /users with valid data returns `201 Created`

---

## Task Group 3: Project gates

3.1. Run `poetry run ruff check` — no new errors
3.2. Run `poetry run pytest` — baseline test count preserved
3.3. Commit: `feat(core-endpoints): implement core endpoints (Kit: python-fastapi)`
**Exit criteria**: Lint green; tests green; commit landed.
EOF