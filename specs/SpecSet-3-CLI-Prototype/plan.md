# SpecSet-3 — CLI Prototype with Project Detection

**Date**: 2026-11-02
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — not started

## Summary

Build a working `opensdd` CLI prototype with three subcommands (`kickoff`, `phase`, `status`) and project type detection. The CLI should generate complete SpecSets without requiring users to copy `sdd/` into their repos. The `sdd/` methodology remains in the OpenSDD package and is referenced internally by skills.

## Goals

1. **CLI subcommands**: `opensdd kickoff <type>`, `opensdd phase <N>`, `opensdd status`
2. **Project type detection**: Ask 2-3 questions (framework, language), auto-select skill/kit
3. **SpecSet generation**: Create `specs/<name>/` with constitution + first phase skeleton
4. **Zero `sdd/` in user repo**: Only user-generated SpecSet files; `sdd/` stays in OpenSDD package
5. **Genericity preservation**: `sdd/` sweep unchanged; skills use placeholders resolved at install

## Goals (Detailed)

### Subcommand: `opensdd kickoff <type>`

- Prompts for 2-3 project type questions if not specified
- Auto-detects framework/language from answers
- Generates `specs/<name>/` with:
  - `mission.md` — filled with project type appropriate content
  - `tech-stack.md` — pre-filled with appropriate stack (e.g., Express + Zod), user customizes
  - `roadmap.md` — Phase 1 defined
- Creates Phase 1 skeleton: `specs/<name>/2026-XX-XX-1-<slug>/plan.md` with task groups
- Prints: "Next: run `opensdd phase 1` or customize Phase 1"

### Subcommand: `opensdd phase <N>`

- Continues from current SpecSet
- Generates next phase skeleton
- Updates roadmap status

### Subcommand: `opensdd status`

- Reads and displays the roadmap status table from the user's SpecSet

## User Stories

### Story 1: New HTTP API Project

```
$ opensdd kickoff api
? What is your project's language/framework?  Node.js + Express
✅ Detected: Node.js + Express
✅ Created specs/my-api/ with:
   - mission.md (API description)
   - tech-stack.md (Express + Zod + vitest pre-configured)
   - roadmap.md (Phase 1 defined)
   - specs/my-api/2026-11-02-1-core-routes/plan.md (Phase 1 skeleton)
✅ Ready to implement: `opensdd phase 1`
```

### Story 2: Python FastAPI Project

```
$ opensdd kickoff api --framework fastapi --language python
✅ Created specs/my-api/ with FastAPI + Pydantic + pytest pre-configured
```

### Story 3: Existing Project Continuation

```
$ cd my-existing-project
$ opensdd kickoff  ← detects project type from existing files, or asks questions
✅ SpecSet created matching project stack
```

## Technical Design

### CLI Architecture

```
opensdd/
  cli/                    # CLI entry point
    __main__.py          # main.sh equivalent
    kickoff.py           # kickoff subcommand
    phase.py             # phase subcommand
    status.py            # status subcommand
    project_detector.py  # 2-3 question detection
    skill_registry.py    # maps project types → skill definitions
  skills/                 # skill definitions (referencing sdd/ from package)
    api-node-express.skill.md
    api-python-fastapi.skill.md
  kits/                   # pre-built kits
    node-express/         # full kit for Node/Express
    python-fastapi/       # full kit for Python/FastAPI
  sdd/                    # reference copy (source-of-truth, NOT for user repos)
  README.md
  LICENSE
  CHANGELOG.md
```

### Project Detection

```
$ opensdd kickoff
? What is your project's language/framework?
❯ Node.js + Express
❯ Node.js + Fastify
❯ Python + FastAPI
❯ Python + Flask
❯ Go + Fiber
❯ Ruby on Rails
❯ Other (enter framework)
```

Based on answer, skill_registry selects the right skill, which generates the SpecSet.

### Skill Reference (No `sdd/` Copying)

Skills reference `sdd/` from the installed OpenSDD package, not from the user's repo:

```markdown
# Skill: HTTP API Kickoff (Node.js + Express)
## Description
Bootstraps an HTTP API SpecSet with Express.js + Zod validation.

## Trigger
`opensdd kickoff api` or "Start an HTTP API SpecSet"

## Prerequisites
- OpenSDD package installed (provides sdd/ as reference)
- Project directory exists

## What This Skill Does
1. Reads project type from user input (or auto-detects)
2. Selects tech-stack template appropriate for detected type
3. Generates `specs/<name>/mission.md` with project-appropriate content
4. Generates `specs/<name>/tech-stack.md` with pre-filled stack, user customizes
5. Generates `specs/<name>/roadmap.md` with Phase 1 defined
6. Generates `specs/<name>/2026-XX-XX-1-<slug>/plan.md` with task groups
7. Prints exit state and next steps

## Exit State
User has complete SpecSet ready to implement:
- specs/my-api/mission.md
- specs/my-api/tech-stack.md (Express + Zod pre-filled)
- specs/my-api/roadmap.md (Phase 1 defined)
- specs/my-api/2026-11-02-1-core-routes/plan.md (Phase 1 task groups)
- NO sdd/ folder in user repo

## Next Steps
run `opensdd phase 1` to start implementation, or run `opensdd customize` to modify Phase 1
```

## Success Criteria

- [ ] `opensdd kickoff api` works end-to-end with 3 framework options
- [ ] Generated SpecSet has zero `sdd/` files in user repo
- [ ] `sdd/` genericity sweep unchanged (verified independently)
- [ ] Project detection asks 2-3 questions and selects appropriate skill
- [ ] Phase 1 skeleton has task groups and exit criteria
- [ ] `opensdd phase 1` continues from where kickoff left off
- [ ] `opensdd status` reads and displays roadmap status table

## Risks

| Risk | Mitigation |
|---|---|
| CLI generates `sdd/` in user repo | Design: `sdd/` stays in OpenSDD package; only SpecSet artifacts go to user |
| Project detection gives wrong framework | Mitigation: user can override; 6 predefined options + "Other" |
| Genericity regression in generated content | Mitigation: skills use placeholders `[FRAMEWORK]`, `[LANGUAGE]` resolved at install; sweep on `sdd/` unchanged |
| User expects to manually copy `sdd/` | Mitigation: documentation; "you don't need to copy sdd/" is first-class message |

## Dependencies

- **SpecSet-1**: Closeout complete — methodology source-of-truth is verified
- **SpecSet-2**: Model defined — rationale + skill model approved; zero `sdd/` in user repos
- **sdd/ toolkit**: Genericity-verified, source-of-truth for skills to reference

## Phase Order (Within SpecSet-3)

| Phase | Feature | Dependencies |
|---|---|---|
| 3.1 | CLI skeleton + `kickoff` subcommand | SpecSet-2 model |
| 3.2 | Project detection (2-3 questions) | 3.1 |
| 3.3 | Skill registry (mapping project types → skills) | 3.2 |
| 3.4 | `phase` subcommand | 3.3 |
| 3.5 | `status` subcommand | 3.3 |
| 3.6 | End-to-end genericity verification | 3.1–3.5 |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`.

## Exit Criteria

- `opensdd kickoff api` generates complete SpecSet with zero `sdd/` in user repo
- `opensdd phase 1` continues from kickoff-generated SpecSet
- `opensdd status` displays roadmap table
- All genericity checks pass