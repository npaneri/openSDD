# SpecSet-3 — CLI Prototype Roadmap

## Philosophy

**Very small phases.** Each phase is a single, focused change that can be implemented, tested, and verified independently. A phase is complete when:

1. The change is implemented
2. `opensdd --help` documents 3 subcommands (kickoff, phase, status)
3. The genericity sweep on `sdd/` still returns zero hits for project/tool framework names
4. The new artifact works when followed by a human OR any AI assistant (no tool-specific dependency)
5. The dogfooding requirement holds: nothing added contradicts the stage guides in `sdd/`

**Basis**: SpecSet-2 model (zero `sdd/` in user repos); CLI prototype must enable the skill-based onboarding flow.

| Phase | Feature | Spec directory | Status |
|---|---|---|---|
| 3.1 | CLI skeleton + `kickoff` subcommand | `2026-11-02-3.1-cli-skeleton/` | ✅ COMPLETE |
| 3.2 | Project detection (2-3 questions) | `2026-11-02-3.2-project-detection/` | ✅ COMPLETE |
| 3.3 | Skill registry (mapping → skills) | `2026-11-02-3.3-skill-registry/` | ✅ COMPLETE |
| 3.4 | `phase` subcommand | `2026-11-02-3.4-phase-subcommand/` | ✅ COMPLETE |
| 3.5 | `status` subcommand | `2026-11-02-3.5-status-subcommand/` | ✅ COMPLETE |
| 3.6 | End-to-end genericity verification | `2026-11-02-3.6-genericity-verification/` | ✅ COMPLETE |

---

## Phase 3.1: CLI Skeleton + `kickoff` Subcommand

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Create the CLI skeleton with `kickoff` subcommand. The CLI should accept a project type argument or enter interactive mode. Basic structure: `opensdd <command> [args]`.

**Files**: CLI entry point (`opensdd`), `kickoff` subcommand basic structure, help text.

**Test**: `opensdd --help` documents 3 subcommands (kickoff, phase, status); `opensdd kickoff --help` documents kickoff usage.

**Dependencies**: SpecSet-2 model (zero `sdd/` in user repos) approved.

**Exit criteria**: CLI skeleton works; `opensdd --help` and `opensdd kickoff --help` display correctly.

---

## Phase 3.2: Project Detection (2-3 Questions)

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Implement project type detection. Ask 2-3 questions (framework/language options + project name). Based on answers, select the appropriate skill/kit to generate the SpecSet.

**Files**: Question prompt logic, answer parsing, skill registry mapping (project type → skill definition).

**Test**: `opensdd kickoff` asks 2-3 questions; based on answers, appropriate skill selected; SpecSet generated with correct stack pre-fill.

**Dependencies**: 3.1 CLI skeleton functional.

**Exit criteria**: Question prompt works; answer parsing correct; skill mapping selects right skill for each framework option.

---

## Phase 3.3: Skill Registry

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Create the skill registry — mapping from project detection answers to skill definitions. Each skill references `sdd/` from the OpenSDD package and generates project-relevant files only.

**Files**: Registry data structure (JSON or Python dict), skill definitions (minimal — just enough to generate SpecSet skeleton), skill selection logic.

**Test**: Given a detected project type (e.g., "Node.js + Express"), the registry returns the correct skill definition; skill generates SpecSet with correct stack pre-fill.

**Dependencies**: 3.2 project detection functional.

**Exit criteria**: Registry maps each of the 3 framework options to its skill; skill generates correct SpecSet skeleton.

---

## Phase 3.4: `phase` Subcommand

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Implement the `phase` subcommand. Should generate the next phase skeleton and update the roadmap status table. Should continue from where `kickoff` left off.

**Files**: Phase skeleton generator, roadmap status updater, context retention from `kickoff`.

**Test**: After `opensdd kickoff api`, running `opensdd phase 1` generates the next phase skeleton; roadmap status table updated.

**Dependencies**: 3.3 skill registry functional; 3.1 CLI skeleton functional.

**Exit criteria**: `opensdd phase 1` generates correct phase skeleton; roadmap status reflects the continuation.

---

## Phase 3.5: `status` Subcommand

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Implement the `status` subcommand. Should read and display the roadmap status table from the user's SpecSet.

**Files**: Roadmap reader, table formatter, display logic.

**Test**: `opensdd status` reads the roadmap from the SpecSet created by `kickoff` + `phase` and displays the status table.

**Dependencies**: 3.4 phase subcommand functional; SpecSet with roadmap.md present.

**Exit criteria**: `opensdd status` displays the phase status table correctly.

---

## Phase 3.6: End-to-End Genericity Verification

**Status**: ⬜ SPEC COMPLETE — not started

**Description**: Run the full genericity sweep; verify `sdd/` unchanged; verify no `sdd/` in user repos after `kickoff`; run the complete cycle (kickoff → phase 1 → status) and confirm all checks pass.

**Files**: Verification script, sweep command, user repo check, cycle test.

**Test**: `sdd/` sweep zero hits; after `opensdd kickoff api`, user repo has zero `sdd/` files; complete cycle works.

**Dependencies**: 3.1–3.5 all functional.

**Exit criteria**: All genericity and user repo checks pass; complete cycle verified.

---

## Quick-Start (Post-Phase-3.6 - conceptual, not yet implemented)

```bash
$ opensdd kickoff
? What is your project's language/framework? Node.js + Express
✅ Detected: Node.js + Express
✅ Created specs/my-api/ with mission, tech-stack (Express + Zod), roadmap, Phase 1 skeleton
$ opensdd phase 1          # continue implementation
$ opensdd status           # view roadmap status
```

---

## Status Table (Reference — SpecSet-1 & SpecSet-2)

For reference, the full roadmap status across all SpecSets:

| SpecSet | Phase | Feature | Status |
|---|---|---|---|
| **SpecSet-1** (reference) | 1-10 | Full SDD methodology | ✅ COMPLETE (all 10 phases) |
| **SpecSet-2** | 1 | Rationale + model | ✅ COMPLETE (zero `sdd/` model) |
| **SpecSet-3** (this SpecSet) | 3.1–3.6 | CLI prototype | In progress |
| **SpecSet-4** (future) | 1–? | Kit system (node-express, python-fastapi, go-fiber) | Planned |
| **SpecSet-5** (future) | 1–? | Skill marketplace + publish | Planned |

The SpecSet-3 roadmap introduces the CLI prototype that enables skill-based onboarding without copying `sdd/`. Subsequent SpecSets build on this foundation.

---

## Quick-Start (Conceptual — Post-Phase-3.6)

After all 6 phases complete:

```bash
$ opensdd kickoff              # 3 questions, auto-detection
✅ Created specs/my-api/ — zero sdd/ in repo
$ opensdd phase 1            # continue implementation
$ opensdd status             # view roadmap
```