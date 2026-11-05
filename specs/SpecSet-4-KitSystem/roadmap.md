# SpecSet-4 — Kit System Roadmap

## Philosophy

**Very small phases.** Each phase is a single, focused change that can be implemented, tested, and verified independently. A phase is complete when:

1. The change is implemented
2. Kits are genericity-verified: `sdd/` sweep returns zero hits
3. The new artifact works when followed by a human OR any AI assistant (no tool-specific dependency)
4. The dogfooding requirement holds: nothing added contradicts the stage guides in `sdd/`

**Basis**: SpecSet-3 CLI prototype; kit system as natural extension — users install kits instead of manually copying `sdd/`.

## Phase Order

Five sequential phases, ordered by dependency. Each phase has a dated spec directory under this SpecSet with `requirements.md`, `plan.md`, and `validation.md`.

| Phase | Feature | Spec directory | Status |
|---|---|---|---|
| 4.1 | Kit definitions (node-express, python-fastapi, go-fiber) | `2026-11-02-4.1-kit-definitions/` | ✅ COMPLETE |
| 4.2 | Kit registry (kits.json) | `2026-11-02-4.2-registry/` | ✅ COMPLETE |
| 4.3 | `opensdd kit install` command | `2026-11-02-4.3-install-command/` | ✅ COMPLETE |
| 4.4 | Documentation and examples | `2026-11-02-4.4-documentation/` | ✅ COMPLETE |
| 4.5 | Publish kits with npm/package | `2026-11-02-4.5-publish/` | ✅ COMPLETE |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

---

## Phase 4.1: Kit Definitions

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Create 3 kit directories under `kits/` with complete SpecSet skeletons:
- `kits/node-express/`
- `kits/python-fastapi/`
- `kits/go-fiber`

Each kit directory contains:
- `spec/mission.md`
- `spec/tech-stack.md`
- `spec/roadmap.md`
- `spec/001-core-routes/requirements.md`
- `spec/001-core-routes/plan.md`
- `spec/001-core-routes/validation.md`
- `kit-definition.json`
- `README.md`

**Test**: Each kit directory has all required files; tech-stack.md has kit-appropriate pre-fill; kit-definition.json is valid JSON.

**Dependencies**: SpecSet-3 CLI prototype functional (kickoff, phase, status subcommands).

**Exit criteria**: All 3 kit directories created with complete skeletons; kit-definition.json valid for each; README.md created for each.

---

## Phase 4.2: Kit Registry

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Create `kits.json` at the repo root tracking available kits. Each kit entry includes description, version, and tech stack pre-fill.

**Test**: `kits.json` is valid JSON with 3 kit entries (node-express, python-fastapi, go-fiber); `opensdd kit list` displays them.

**Dependencies**: 4.1 kit definitions functional.

**Exit criteria**: `kits.json` created and valid; kit list command functional.

---

## Phase 4.3: `opensdd kit install` Command

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Implement the `opensdd kit install <kit-name>` subcommand. This must:
1. Validate kit name exists in `kits.json`
2. Copy/Generate SpecSet skeleton from the kit into `specs/<project-name>/`
3. Pre-fill `tech-stack.md` with kit-appropriate stack
4. Generate Phase 1 skeleton with task groups appropriate for the stack
5. Print next steps and customization notes

**Test**: `opensdd kit install node-express` generates complete SpecSet; same for python-fastapi and go-fiber.

**Dependencies**: 4.1 kit definitions, 4.2 registry, 3.3 skill registry (mapping → skills from SpecSet-3).

**Exit criteria**: All 3 kit installations work; SpecSet generated with all files; zero `sdd/` in user repo.

---

## Phase 4.4: Documentation and Examples

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Create documentation and examples for users:
- Kit README files (already in each kit directory)
- Usage examples (`opensdd kit install node-express`)
- Migration guide for existing users who copied `sdd/`
- `opensdd kit list` command display

**Test**: Documentation covers all 3 kits; `opensdd kit list` displays available kits; migration guide addresses existing users.

**Dependencies**: 4.1–4.3 functional.

**Exit criteria**: Documentation complete; `opensdd kit list` works; migration guide written.

---

## Phase 4.5: Publish Kits with npm/Package

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Publish the kit system as part of the OpenSDD npm package. This includes:
- npm package publishing
- Full documentation
- Onboarding guide
- Backward compatibility for existing users who copied `sdd/`

**Test**: npm package publishes successfully; onboarding guide covers all kits; migration guide addresses existing users.

**Dependencies**: 4.1–4.4 functional.

**Exit criteria**: npm package live; onboarding guide complete; migration guide published.

---

## Status Table (Reference — SpecSets-1 through-3)

For reference, the full roadmap status across all SpecSets:

| SpecSet | Key Feature | Status |
|---|---|---|
| **SpecSet-1** | 10-phase methodology | ✅ COMPLETE (closeout) |
| **SpecSet-2** | Zero `sdd/` in user repos model | ✅ COMPLETE (rationale + 5-phase roadmap) |
| **SpecSet-3** | CLI prototype (kickoff/phase/status) | ✅ COMPLETE (specification) |
| **SpecSet-4** | Kit system (node-express, python-fastapi, go-fiber) | In progress |
| **SpecSet-5** | Publish, docs, marketplace | Planned |

The SpecSet-4 roadmap introduces the kit system that enables users to install pre-built SpecSet kits instead of copying `sdd/` and filling templates manually. Subsequent SpecSets build on this foundation.

---

## Status Table (Current — All SpecSets)

| SpecSet | Feature | Status |
|---|---|---|
| **SpecSet-1** | 10-phase methodology ✅ closeout | ✅ COMPLETE |
| **SpecSet-2** | Skill-based onboarding, zero `sdd/` | ✅ COMPLETE |
| **SpecSet-3** | CLI prototype (kickoff/phase/status) | ✅ SPEC COMPLETE |
| **SpecSet-4** | Kit system | In progress |
| **SpecSet-5** | Publish & marketplace | Planned |

The SpecSet-4 roadmap introduces the kit system that enables users to install pre-built SpecSet kits instead of copying `sdd/` and filling templates manually. Subsequent SpecSets build on this foundation.