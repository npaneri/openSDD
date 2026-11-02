# SpecSet-2 — Skill-Based Onboarding Roadmap

## Philosophy

**Very small phases.** Each phase is a single, focused change that can be implemented, tested, and verified independently. A phase is complete when:

1. The change is implemented
2. The genericity sweep on `sdd/` still returns zero hits for project/tool framework names
3. The new artifact works when followed by a human OR any AI assistant (no tool-specific dependency)
4. The dogfooding requirement holds: nothing added contradicts the stage guides in `sdd/`

**Basis**: settled decisions in `brainstorm_ideas.md` (all decisions adopted 2026-10-31) + the professional user requirement to avoid copying `sdd/` into working repos.

## Phase Order

Ten sequential phases, ordered by dependency. Each phase has a dated spec directory under this SpecSet with `requirements.md`, `plan.md`, and `validation.md`.

| Phase | Feature | Spec directory | Status |
|---|---|---|---|
| 1 | Rationale + model definition (this SpecSet) | `2026-11-02-1-rationale-model/` | ⬜ SPEC COMPLETE — not started |
| 2 | CLI prototype with project detection | `2026-11-02-2-cli-prototype/` | ⬜ SPEC COMPLETE — not started |
| 3 | Kit system (node-express, python-fastapi, go-fiber) | `2026-11-02-3-kit-system/` | ⬜ SPEC COMPLETE — not started |
| 4 | Skill marketplace (community skills) | `2026-11-02-4-skill-marketplace/` | ⬜ SPEC COMPLETE — not started |
| 5 | Publish, docs, backward compatibility guide | `2026-11-02-5-publish-guide/` | ⬜ SPEC COMPLETE — not started |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

---

## Phase 1: Rationale + Model Definition

**Status**: ⬜ SPEC COMPLETE — not started (this SpecSet)

**Description**: Document why `sdd/` should not be copied into user repos; define the skill-based model with trigger/prerequisites/what it does/exit state; specify user repo structure (zero `sdd/`); define 3 access patterns (npm package, CLI, skill-aware assistant); propose 5-phase transition roadmap.

**Files**: `requirements.md`, `plan.md`, `validation.md`, `roadmap.md`

**Test**: Rationale section articulates 3+ problems with "copy sdd/" model; skill model has all 4 elements consistent; zero `sdd/` in user repos claimed; 3 access patterns documented; 5-phase roadmap approved.

**Dependencies**: None. First phase.

**Exit criteria**: Rationale approved; skill model defined; user repo structure confirmed; access patterns documented; roadmap approved.

---

## Phase 2: CLI Prototype with Project Detection

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Build working `opensdd` CLI with `kickoff`, `phase`, `status` subcommands; project type detection (asks 2-3 questions, picks right skill/kit); generates SpecSet without user copying `sdd/`.

**Files**: CLI prototype source, project detection logic, skill invocations.

**Test**: `opensdd kickoff api` generates complete SpecSet in user repo with zero `sdd/` files; project detection works with 3 framework options.

**Dependencies**: Phase 1 model settled (rationale + skill model).

**Exit criteria**: CLI works end-to-end; SpecSet generated; zero `sdd/` in user repo.

---

## Phase 3: Kit System

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Pre-built kits for common stacks:
- `node-express` kit — Express + Zod + vitest pre-configured
- `python-fastapi` kit — FastAPI + Pydantic + pytest pre-configured
- `go-fiber` kit — Fiber + validation + testify pre-configured

**Files**: kit definitions, template adaptations per stack, kit installation commands.

**Test**: `opensdd kit install node-express` creates complete SpecSet with stack-appropriate defaults; kits are genericity-verified.

**Dependencies**: Phase 2 CLI prototype functional.

**Exit criteria**: 3 kits functional; each creates complete SpecSet; genericity sweep unchanged.

---

## Phase 4: Skill Marketplace

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: `skills/` directory where users can contribute community skills:
- `my-team-bug-fix.skill.md`
- `my-feature-schema.skill.md`
- PR process for vetting community skills
- `opensdd skills list` command

**Files**: skills directory, contribution guidelines, vetting process, list command.

**Test**: `opensdd skills list` shows built-in + community skills; new skill via PR creates SpecSet correctly.

**Dependencies**: Phase 3 kit system functional.

**Exit criteria**: Community can contribute skills; `opensdd skills list` works; new skill generates correct SpecSet.

---

## Phase 5: Publish, Docs, Backward Compatibility Guide

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: npm package publishing; full documentation; onboarding videos; migration guide for existing users who copied `sdd/`; backward compatibility strategy.

**Files**: npm package, README, CHANGELOG update, migration guide, docs/.

**Test**: npm package publishes successfully; migration guide covers existing users; docs cover all 5 access patterns.

**Dependencies**: Phases 1-4 functional.

**Exit criteria**: npm package live; migration guide published; docs complete; existing users have upgrade path.

---

## Quick-Start (Future, Post-Phase-5)

After all 5 phases complete:

```bash
# Install
npm i -D opensdd

# Kick off an API SpecSet (3 questions, auto-detection)
opensdd kickoff api

# Or use a kit
opensdd kit install node-express

# List available skills
opensdd skills list
```

---

## Status Table (Current — SpecSet-1 Reference)

For reference, SpecSet-1 roadmap (all ✅ COMPLETE after this SpecSet's transition):

| Phase | Feature | Status |
|---|---|---|
| 1 | Repo scaffolding | ✅ COMPLETE |
| 2 | Minimal example SpecSet | ✅ COMPLETE |
| 3 | scaffold.sh scaffolding script | ✅ COMPLETE |
| 4 | AI-compatibility documentation | ✅ COMPLETE |
| 5 | Extensions mechanism | ✅ COMPLETE |
| 6 | Bug-fix + idea-assessment templates | ✅ COMPLETE |
| 7 | Terminology alignment + catalog | ✅ COMPLETE |
| 8 | Minimal sdd CLI wrapper | ✅ COMPLETE |
| 9 | Cross-repo store guidance | ✅ COMPLETE |
| 10 | Agent-skill wrapper + closeout | ✅ COMPLETE |

The SpecSet-1 roadmap remains as reference; SpecSet-2 introduces the skill-based model that replaces the need to copy `sdd/`.