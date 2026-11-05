# SpecSet-5 — Publish, Docs, and Backward Compatibility Roadmap

## Philosophy

**Very small phases.** Each phase is a single, focused change that can be implemented, tested, and verified independently. A phase is complete when:

1. The change is implemented
2. The npm package publishes successfully (or dry-run verifies)
3. The genericity sweep on `sdd/` still returns zero hits for project/tool framework names
4. The new artifact works when followed by a human OR any AI assistant (no tool-specific dependency)
5. The dogfooding requirement holds: nothing added contradicts the stage guides in `sdd/`

**Basis**: SpecSet-4 kit system; the skill-based model is now ready for publication and general adoption.

## Phase Order

Six sequential phases, ordered by dependency. Each phase has a dated spec directory under this SpecSet with `requirements.md`, `plan.md`, and `validation.md`.

| Phase | Feature | Spec directory | Status |
|---|---|---|---|
| 5.1 | npm package skeleton & package.json | `2026-11-02-5.1-package-skeleton/` | ✅ COMPLETE |
| 5.2 | Full documentation (onboarding, CLI, kits, migration) | `2026-11-02-5.2-documentation/` | ✅ COMPLETE |
| 5.3 | Backward compatibility guide | `2026-11-02-5.3-backward-compat/` | ✅ COMPLETE |
| 5.4 | Changelog & version bump 0.1.0 → 1.0.0 | `2026-11-02-5.4-changelog/` | ✅ COMPLETE |
| 5.5 | npm package publish & verify | `2026-11-02-5.5-publish/` | ✅ COMPLETE |
| 5.6 | Final review & release | `2026-11-02-5.6-final-review/` | ✅ COMPLETE |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

---

## Phase 5.1: npm package skeleton & package.json

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Create the npm package skeleton with `package.json`. Must include all required fields: `name`, `version`, `main`, `bin`, `scripts`, `files`, `license`, `keywords`. Version must be 0.1.0 (will bump to 1.0.0 at final release).

**Test**: `package.json` is valid JSON; has all required fields; version is 0.1.0.

**Dependencies**: SpecSet-4 kit system complete.

**Exit criteria**: `package.json` complete with version 0.1.0; all required fields present.

---

## Phase 5.2: Full documentation (onboarding, CLI, kits, migration)

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Write the full documentation set:
- Onboarding guide (max 300 words)
- CLI reference (all 5 subcommands)
- Migration guide (existing `sdd/` users)
- Kit documentation (3 kits)

**Test**: All documentation complete and cross-consistent.

**Dependencies**: SpecSet-1–4 complete.

**Exit criteria**: All documentation sections complete and consistent.

---

## Phase 5.3: Backward compatibility guide

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Write the backward compatibility guide for existing users who copied `sdd/` into their repos. Must provide 3 options: keep existing setup, migrate to skill model, side-by-side usage.

**Test**: Guide addresses all user scenarios; clear which option is recommended.

**Dependencies**: SpecSet-2 model (zero `sdd/`) approved.

**Exit criteria**: Guide complete; covers all 3 user scenarios.

---

## Phase 5.4: Changelog & version bump 0.1.0 → 1.0.0

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Write the Changelog following Keep a Changelog format, transition from 0.1.0 to 1.0.0. Must include Added/Changed/Deprecated/Fixed sections. Bump version in package.json and CHANGELOG.md.

**Test**: Changelog follows format; version bumped; all sections present.

**Dependencies**: SpecSet-1 closeout (0.1.0 concept), SpecSet-2 model.

**Exit criteria**: Changelog complete; version bumped to 1.0.0 in package.json and CHANGELOG.md.

---

## Phase 5.5: npm package publish & verify

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Verify the npm package can be published (dry-run). Run `npm publish --dry-run` and verify no errors; verify `sdd/` genericity sweep passes.

**Test**: `npm publish --dry-run` succeeds; `sdd/` sweep zero hits.

**Dependencies**: 5.1 package.json, 5.2 documentation, 5.3 backward compat, 5.4 changelog.

**Exit criteria**: Dry-run succeeds; genericity preserved.

---

## Phase 5.6: Final review & release

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Final review of all SpecSets-1 through-5; release the skill-based OpenSDD system. Conduct full independent verification of all success criteria from all SpecSets.

**Test**: All success criteria from SpecSets-1 through-5 met; independent verification complete.

**Dependencies**: All previous SpecSets complete.

**Exit criteria**: All success criteria from all SpecSets met; system ready for adoption.

---

## Status Table (All SpecSets)

| SpecSet | Feature | Status |
|---|---|---|
| **SpecSet-1** | 10-phase methodology ✅ closeout | ✅ COMPLETE |
| **SpecSet-2** | Skill-based onboarding, zero `sdd/` | ✅ COMPLETE |
| **SpecSet-3** | CLI prototype (kickoff/phase/status) | ✅ SPEC COMPLETE |
| **SpecSet-4** | Kit system (node-express, python-fastapi, go-fiber) | ✅ SPEC COMPLETE |
| **SpecSet-5** | Publish, docs, backward compatibility | In progress |

The SpecSet-5 roadmap finalizes the skill-based OpenSDD system, making it ready for publication and general adoption through npm, documentation, and backward compatibility.

---

## Status Table (All SpecSets — Complete)

| SpecSet | Feature | Status |
|---|---|---|
| **SpecSet-1** | 10-phase methodology ✅ closeout | ✅ COMPLETE |
| **SpecSet-2** | Skill-based onboarding, zero `sdd/` | ✅ COMPLETE |
| **SpecSet-3** | CLI prototype (kickoff/phase/status) | ✅ SPEC COMPLETE |
| **SpecSet-4** | Kit system (node-express, python-fastapi, go-fiber) | ✅ SPEC COMPLETE |
| **SpecSet-5** | Publish, docs, backward compatibility | In progress |

The SpecSet-5 roadmap finalizes the skill-based OpenSDD system, making it ready for publication and general adoption through npm, documentation, and backward compatibility.