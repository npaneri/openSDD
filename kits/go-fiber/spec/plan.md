# Go API — Phase 1

**Date**: 2026-11-02
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — implementation pending

---

## Task Group 1: Project structure

1.1. Initialize Go module with `go mod init api`
1.2. Install dependencies: `go get github.com/gofiber/fiber/v2 testify`
1.3. Create directory structure: `api/routes/`
**Exit criteria**: Project structure ready for route handlers.

---

## Task Group 1: Implement GET /health

1.1. Create `api/routes/health.go` with Fiber handler returning `{"status":"ok"}`
1.2. Write testify assertion for response shape
**Exit criteria**: Health endpoint returns `200 OK` with `{"status":"ok"}`

---

## Task Group 2: Implement POST /users

2.1. Create `api/routes/users.go` with Fiber handler for creating a user
2.2. Write testify assertion for request validation
**Exit criteria**: POST /users with valid data returns `201 Created`

---

## Task Group 3: Project gates

3.1. Run `go test` — baseline test count preserved
3.2. Run `go vet` — no new errors
3.3. Commit: `feat(core-endpoints): implement core endpoints (Kit: go-fiber)`
**Exit criteria**: Lint green; tests green; commit landed.
EOF