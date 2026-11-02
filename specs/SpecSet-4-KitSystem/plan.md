# SpecSet-4 — Kit System

**Date**: 2026-11-02
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — not started

## Summary

Define pre-built kits for common technology stacks that users can install and customize. Kits provide out-of-the-box SpecSet skeletons with stack-appropriate tech stacks, task groups, and configurations. This eliminates the need for users to manually copy `sdd/` and fill templates — they install a kit and get a complete starting SpecSet.

## Goals

1. **Kit definitions**: Define 3 initial kits — `node-express`, `python-fastapi`, `go-fiber`
2. **Kit structure**: Each kit contains a complete SpecSet skeleton with tech stack pre-configured
3. **Kit installation**: Users install kits via `opensdd kit install <kit-name>`
4. **Customization**: Users can customize kit-generated SpecSets; the kit remains as a reference
5. **Genericity**: All kits pass the genericity sweep on `sdd/`; stacks live in kit-generated `tech-stack.md`, not in the core

## Kit Definition Format

Each kit is a directory under `kits/` with the following structure:

```
kits/<kit-name>/
  spec/                          # Complete SpecSet skeleton
    mission.md                     # Kit-generated mission
    tech-stack.md                  # Pre-configured tech stack
    roadmap.md                     # Phase order with Phase 1
    001-<slug>/                    # Phase 1 skeleton
      requirements.md
      plan.md
      validation.md
  kit-definition.json              # Machine-readable kit metadata
  README.md                        # Human-readable kit description
```

## Kit: node-express

**Description**: A complete SpecSet starter for Node.js + Express.js projects with Zod validation and vitest.

**Tech Stack Pre-fill**:
| Layer | Technology |
|---|---|
| Framework | Express |
| Language | JavaScript/TypeScript |
| Build | npm |
| Lint | biomes |
| Testing | vitest |
| Backend | PostgreSQL |

**Generated SpecSets include**:
- `mission.md` — description of API or feature being built
- `tech-stack.md` — above stack (user customizes)
- `roadmap.md` — Phase 1 defined (core routes or similar)
- `Phase 1 skeleton` — task groups for core features

**Installation**:
```bash
opensdd kit install node-express
# or: npx opensdd kit install node-express
```

## Kit: python-fastapi

**Description**: A complete SpecSet starter for Python + FastAPI projects with Pydantic validation and pytest.

**Tech Stack Pre-Fill**:
| Layer | Technology |
|---|---|
| Framework | FastAPI |
| Language | Python |
| Build | pip/poetry |
| Lint | ruff |
| Testing | pytest |
| Backend | PostgreSQL |

**Generated SpecSets include**:
- `mission.md` — description of API or feature
- `tech-stack.md` — above stack (user customizes)
- `roadmap.md` — Phase 1 defined
- `Phase 1 skeleton` — task groups for core features

**Installation**:
```bash
opensdd kit install python-fastapi
```

## Kit: go-fiber

**Description**: A complete SpecSet starter for Go + Fiber projects with validation and testify.

**Tech Stack Pre-Fill**:
| Layer | Technology |
|---|---|
| Framework | Fiber |
| Language | Go |
| Build | go mod |
| Lint | staticcheck |
| Testing | testify |
| Backend | PostgreSQL |

**Installation**:
```bash
opensdd kit install go-fiber
```

## Kit Registry

A `kits.json` file at the repo root tracks available kits and their metadata:

```json
{
  "kits": {
    "node-express": {
      "description": "Node.js + Express.js SpecSet starter with Zod validation",
      "version": "0.1.0",
      "tech_stack": {
        "framework": "Express",
        "language": "JavaScript/TypeScript",
        "build": "npm",
        "lint": "biomes",
        "test": "vitest",
        "backend": "PostgreSQL"
      }
    },
    "python-fastapi": {
      "description": "Python + FastAPI SpecSet starter with Pydantic validation",
      "version": "0.1.0",
      "tech_stack": {
        "framework": "FastAPI",
        "language": "Python",
        "build": "pip/poetry",
        "lint": "ruff",
        "test": "pytest",
        "backend": "PostgreSQL"
      }
    }
  }
}
```

## Kit Installation Command

`opensdd kit install <kit-name>` performs:
1. Validates kit name exists in registry
2. Generates a SpecSet in `specs/<kit-name-_slug>/` (or asks for project name)
3. Pre-fills `tech-stack.md` with kit-appropriate stack
4. Generates Phase 1 skeleton with task groups appropriate for the stack
5. Prints next steps and customization notes

**Installation examples**:
```bash
$ opensdd kit install node-express
? What is your project name? my-api
✅ Created specs/my-api/ with Express + Zod pre-configured
$ opensdd kit install python-fastapi
✅ Created specs/my-api/ with FastAPI + Pydantic pre-configured
```

## Success Criteria

- [ ] 3 kits defined (node-express, python-fastapi, go-fiber)
- [ ] Each kit has a `spec/` directory with complete SpecSet skeleton
- [ ] Each kit has a `kit-definition.json` with metadata
- [ ] Each kit has a `README.md` with description and installation instructions
- [ ] `kits.json` registry file is created and valid
- [ ] `opensdd kit install <kit-name>` generates complete SpecSet
- [ ] All kit-generated content passes the `sdd/` genericity sweep
- [ ] Kits are documented in `README.md`

## Risks

| Risk | Mitigation |
|---|---|
| Kits become outdated as stacks evolve | Kits reference `sdd/` templates; updates to `sdd/` flow through to kits |
| Users want kits for other stacks | Kits are extensible; community can contribute new kits via PR |
| Genericity regression in kit content | Same `sdd/` sweep applies; kit-generated `tech-stack.md` is the only place stack names appear |

## Dependencies

- **SpecSet-1**: Methodology source-of-truth verified
- **SpecSet-2**: Zero `sdd/` in user repos model approved
- **SpecSet-3**: CLI prototype specification (kickoff, phase, status subcommands)
- **sdd/ toolkit**: Genericity-verified source-of-truth

## Phase Order (Within SpecSet-4)

| Phase | Feature | Dependencies |
|---|---|---|
| 4.1 | Kit definitions (node-express, python-fastapi, go-fiber) | SpecSet-3 CLI functional |
| 4.2 | Kit registry (kits.json) | 4.1 |
| 4.3 | `opensdd kit install` command | 4.1–4.2 |
| 4.4 | Documentation and examples | 4.1–4.3 |
| 4.5 | Publish kits with npm/package | 4.1–4.3 |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`.

## Exit Criteria

- [ ] 3 kits defined with complete `spec/` skeletons
- [ ] `kits.json` registry created and valid
- [ ] `opensdd kit install <kit-name>` works end-to-end
- [ ] All kit-generated SpecSets have zero `sdd/` files in user repo
- [ ] All kit-generated content passes `sdd/` genericity sweep
- [ ] Documentation and examples created
- [ ] Exit criteria from above checklist met