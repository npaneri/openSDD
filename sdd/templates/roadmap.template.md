# <Project> — <SpecSet Name> Roadmap

## Philosophy

**Very small phases.** Each phase is a single, focused change that can be implemented, tested, and verified independently. A phase is complete when:

1. The change is implemented
2. <lint gate — command per this project's conventions>
3. <test gate — command>
4. <project-specific gate(s), if any>
5. <behavioral gate, e.g. "works end-to-end through <integration path>">

**Basis**: <what this plan is based on — explicitly flag if the requested basis (a referenced document) does not exist; do not fabricate it.>

## Phase Order

<Sequential phase numbers 1..N. Numbers must match the spec directory names.>

| Phase | Feature | Spec directory | Status |
|---|---|---|---|
| 1 | <feature> | `YYYY-MM-DD-1-<slug>/` | ⬜ SPEC COMPLETE — not started |
| 2 | <feature> | `YYYY-MM-DD-2-<slug>/` | ⬜ SPEC COMPLETE — not started |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

---

## Phase 1: <Feature Name>

**Status**: ⬜ SPEC COMPLETE — not started

<2–5 sentence description. Include the exact shapes or constants this phase introduces if they are phase-local.>

**Files**: <paths>
**Test**: <what proves it works>
**Dependencies**: <None / Phase N.>

---

## Phase 2: <Feature Name>

**Status**: ⬜ SPEC COMPLETE — not started

<...>
