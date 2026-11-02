# SpecSet-4 — Requirements: Kit System

## Scope

Define the requirements for the Kit System that provides pre-built kits for common technology stacks. Kits eliminate the need for users to manually copy `sdd/` and fill templates — they install a kit and get a complete starting SpecSet.

**In scope:**
- 3 initial kits: node-express, python-fastapi, go-fiber
- Kit structure (spec/, kit-definition.json, README.md)
- Kit installation via `opensdd kit install <kit-name>`
- Kit registry (kits.json)
- Genericity preservation: `sdd/` sweep unchanged
- Documentation and examples

**Out of scope:**
- All possible framework integrations (initial 3 kits suffice)
- GUI or web interface for kit selection (CLI only)
- Advanced kit customization beyond tech-stack pre-fill (SpecSet-5+)
- npm package publishing (SpecSet-5+)

## Requirements

### 1. Kit Definitions

Each kit directory under `kits/` must contain:
- `spec/` — Complete SpecSet skeleton (mission.md, tech-stack.md, roadmap.md, Phase 1 skeleton)
- `kit-definition.json` — Machine-readable kit metadata
- `README.md` — Human-readable kit description and installation instructions

**Kit: node-express**
- Description: Node.js + Express.js SpecSet starter with Zod validation
- Tech Stack: Express, JavaScript/TypeScript, npm, biomes, vitest, PostgreSQL
- Phase 1 skeleton: core routes with task groups for API development

**Kit: python-fastapi**
- Description: Python + FastAPI SpecSet starter with Pydantic validation
- Tech Stack: FastAPI, Python, pip/poetry, ruff, pytest, PostgreSQL
- Phase 1 skeleton: core endpoints with task groups for API development

**Kit: go-fiber**
- Description: Go + Fiber SpecSet starter with testify validation
- Tech Stack: Fiber, Go, go mod, staticcheck, testify, PostgreSQL
- Phase 1 skeleton: core endpoints with task groups for API development

### 2. Kit Registry

A `kits.json` file at the repo root tracks available kits:
```json
{
  "kits": {
    "node-express": { ... },
    "python-fastapi": { ... },
    "go-fiber": { ... }
  }
}
```

### 3. Kit Installation

`opensdd kit install <kit-name>` must:
1. Validate kit name exists in registry
2. Generate SpecSet in `specs/<project-name>/`
3. Pre-fill `tech-stack.md` with kit-appropriate stack
4. Generate Phase 1 skeleton with stack-appropriate task groups
5. Print next steps and customization notes

### 4. Genericity Preservation

**Requirement**: `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` returns zero hits.

**How**:
- Kits reference `sdd/` from the OpenSDD package (never copied to user repo)
- Only `tech-stack.md` in generated SpecSets contains stack names — this is allowed as documentation in `docs/`, not in `sdd/`
- All other kit-generated content is framework-agnostic

### 4. Documentation

Each kit must have a `README.md` with:
- Kit description
- Tech stack pre-fill
- Installation command (`opensdd kit install <kit-name>`)
- Generated SpecSet structure
- Customization notes

## Success Criteria

- [ ] 3 kits defined (node-express, python-fastapi, go-fiber)
- [ ] Each kit has `spec/` directory with complete SpecSet skeleton (6 files)
- [ ] Each kit has `kit-definition.json` with metadata
- [ ] Each kit has `README.md` with description and install command
- [ ] `kits.json` registry file created and valid at repo root
- [ ] `opensdd kit install <kit-name>` generates complete SpecSet
- [ ] All kit-generated SpecSets have zero `sdd/` files in user repo
- [ ] All kit-generated content passes `sdd/` genericity sweep (only `tech-stack.md` has stack names, as allowed documentation)
- [ ] Documentation created (README files, this requirements sheet)
- [ ] `opensdd kit install` command functional

## Risks

| Risk | Mitigation |
|---|---|
| Kits become outdated | Kits reference `sdd/` templates; updates to `sdd/` flow through |
| Users want other stacks | Kits are extensible; community can contribute new kits via PR |
| Genericity regression | Only `tech-stack.md` has stack names; all other content is agnostic; sweep on `sdd/` unchanged |

## Dependencies

- **SpecSet-1**: Methodology source-of-truth verified
- **SpecSet-2**: Zero `sdd/` in user repos model approved
- **SpecSet-3**: CLI prototype with `kickoff`, `phase`, `status` subcommands
- **sdd/ toolkit**: Genericity-verified source-of-truth

## Verification

External verification should check:

1. **Kit structure**: Each `kits/<name>/` has `spec/`, `kit-definition.json`, `README.md`
2. **Kit content**: Each `spec/` has mission.md, tech-stack.md, roadmap.md, Phase 1 skeleton (requirements.md, plan.md, validation.md)
3. **Registry**: `kits.json` at repo root is valid JSON with 3 kit entries
4. **Installation**: `opensdd kit install node-express` generates SpecSet with all expected files
5. **Zero `sdd/`**: After `opensdd kit install`, `git ls-files` shows no `sdd/` entries; `find` returns empty
6. **Genericity**: `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` returns zero hits
7. **Tech stack pre-fill**: Generated `tech-stack.md` has the kit-appropriate stack pre-configured

## Merge Criteria

- [ ] All 7 success criteria above met
- [ ] `kits.json` is valid JSON
- [ ] `opensdd kit install` command works for all 3 kits
- [ ] Genericity verification passes
- [ ] Documentation (README files, requirements sheet) is complete
- [ ] Zero `sdd/` in user repos confirmed