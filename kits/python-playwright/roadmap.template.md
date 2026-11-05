# <Project> — <SpecSet Name> Roadmap

## Philosophy

**Very small phases.** Each phase is a single, focused change that can be implemented, tested, and verified independently. A phase is complete when:

1. The change is implemented
2. Playwright lint gate passes (per project conventions)
3. Test gate passes (pytest suite green)
4. Phase-specific behavioral gate (e.g., "navigation works end-to-end")

**Basis**: This plan is based on browser automation best practices — explicitly flag if the requested basis does not exist; do not fabricate it.

## Phase Order

<Sequential phase numbers 1..N. Numbers must match the spec directory names.>

| Phase | Feature | Spec directory | Status |
|---|---|---|---|
| 1 | session-management | `YYYY-MM-DD-1-session-management/` | ⬜ SPEC COMPLETE — not started |
| 2 | page-objects | `YYYY-MM-DD-2-page-objects/` | ⬜ SPEC COMPLETE — not started |
| 3 | automation-core | `YYYY-MM-DD-3-automation-core/` | ⬜ SPEC COMPLETE — not started |
| 4 | validation | `YYYY-MM-DD-4-validation/` | ⬜ SPEC COMPLETE — not started |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

## Phase 1: session-management

**Status**: ⬜ SPEC COMPLETE — not started

<2–5 sentence description. Include the exact shapes or constants this phase introduces if they are phase-local.>

**Files**: <paths>
**Test**: <what proves it works>
**Dependencies**: <None / Phase N.>

---

## Phase 2: page-objects

**Status**: ⬜ SPEC COMPLETE — not started

<...>

## Phase 3: automation-core

**Status**: ⬜ SPEC COMPLETE — not started

<...>

## Phase 4: validation

**Status**: ⬜ SPEC COMPLETE — not started

<...>