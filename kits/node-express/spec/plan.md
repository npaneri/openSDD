# Node.js API — Phase 1

**Date**: 2026-11-02
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — implementation pending

---

## Task Group 1: Project structure

1.1. Initialize npm project with `npm init -y`
1.2. Install dependencies: `npm i express zod @types/express vitest @types/node`
1.3. Create directory structure: `src/routes/`, `src/validators/`
**Exit criteria**: Project structure ready for route handlers.

---

## Task Group 2: Implement GET /health

2.1. Create `src/routes/health.ts` with Express handler returning `{"status":"ok"}` and `200 OK`
2.2. Create validator for response shape
2.3. **Exit criteria**: Health endpoint returns `200 OK` with `{"status":"ok"}`

---

## Task Group 3: Implement POST /users

3.1. Create `src/routes/users.ts` with Express handler for creating a user
3.2. Create Zod validator for user request body
3.3. **Exit criteria**: POST /users with valid data returns `201 Created`

---

## Task Group 4: Project gates

4.1. Run `npm run lint` — no new errors
4.2. Run `npm test` — baseline test count preserved
4.3. Commit: `feat(core-routes): implement core routes (Kit: node-express)`
**Exit criteria**: Lint green; tests green; commit landed.
EOF