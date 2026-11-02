# SpecSet-4 — Validation

## Definition of Done

1. 3 kits defined (node-express, python-fastapi, go-fiber)
2. Each kit has `spec/` directory with complete SpecSet skeleton (6 files)
3. Each kit has `kit-definition.json` with metadata
4. Each kit has `README.md` with description and install command
5. `kits.json` registry file created and valid at repo root
6. `opensdd kit install <kit-name>` works for all 3 kits
7. All kit-generated SpecSets have zero `sdd/` files in user repo
8. All kit-generated content passes `sdd/` genericity sweep
9. Documentation created (README files, requirements sheet)

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 4a | Kit structure: node-express | `kits/node-express/` has `spec/`, `kit-definition.json`, `README.md` | ✅ |
| 4b | Kit structure: python-fastapi | `kits/python-fastapi/` has `spec/`, `kit-definition.json`, `README.md` | ✅ |
| 4c | Kit structure: go-fiber | `kits/go-fiber/` has `spec/`, `kit-definition.json`, `README.md` | ✅ |
| 4d | Spec skeleton: node-express | `kits/node-express/spec/` has mission.md, tech-stack.md, roadmap.md, requirements.md, plan.md, validation.md | ✅ |
| 4e | Spec skeleton: python-fastapi | `kits/python-fastapi/spec/` has all 6 files | ✅ |
| 4f | Spec skeleton: go-fiber | `kits/go-fiber/spec/` has all 6 files | ✅ |
| 4g | kit-definition.json | Each kit has valid JSON with description, version, tech_stack | ✅ |
| 4h | README.md | Each kit has README with description and `opensdd kit install` command | ✅ |
| 4i | kits.json | Repo root has valid JSON with 3 kit entries | ✅ |
| 4j | Installation: node-express | `opensdd kit install node-express` generates SpecSet with all expected files | ✅ |
| 4k | Installation: python-fastapi | `opensdd kit install python-fastapi` generates SpecSet with all expected files | ✅ |
| 4l | Installation: go-fiber | `opensdd kit install go-fiber` generates SpecSet with all expected files | ✅ |
| 4l | Zero `sdd/`: node-express | After install, `git ls-files` shows no `sdd/`; `find` returns empty | ✅ |
| 4m | Zero `sdd/`: python-fastapi | Same as above | ✅ |
| 4n | Zero `sdd/`: go-fiber | Same as above | ✅ |
| 4o | Genericity: node-express | `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` returns zero hits | ✅ |
| 4p | Genericity: python-fastapi | Same sweep zero hits | ✅ |
| 4q | Genericity: go-fiber | Same sweep zero hits | ✅ |

## Merge Criteria

- [ ] All 15 verification checklist items above marked complete
- [ ] `kits.json` is valid JSON with 3 kit entries
- [ ] `opensdd kit install` works for all 3 kits
- [ ] Zero `sdd/` in user repos confirmed for all 3 installs
- [ ] Genericity sweep passes for all 3 installs
- [ ] Documentation (README files, requirements sheet) is complete
- [ ] All success criteria from requirements.md met

## Independent Verification Steps

1. **Kit structure check**: Verify each `kits/<name>/` directory contains `spec/`, `kit-definition.json`, `README.md`
2. **Spec skeleton check**: Open each `kits/<name>/spec/` and verify all 6 files exist (mission.md, tech-stack.md, roadmap.md, requirements.md, plan.md, validation.md)
3. **Registry check**: Read `kits.json` at repo root; verify it's valid JSON with a `kits` object containing exactly 3 entries (node-express, python-fastapi, go-fiber)
4. **Installation check**: Run `opensdd kit install node-express`; verify SpecSet generated at `specs/<project-name>/` with all 6 expected files
5. **Zero `sdd/` check**: `cd /tmp/test; git init; opensdd kit install node-express; git ls-files | grep sdd` → should return nothing; `find /tmp/test -type d -name sdd` 2>/dev/null → should return empty
6. **Genericity check**: `cd /tmp; grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` → should return zero hits (independent run)
7. **Tech stack pre-fill**: Open generated `tech-stack.md` and verify it has the kit-appropriate stack (e.g., "Express" for node-express, "FastAPI" for python-fastapi, "Fiber" for go-fiber)

## Status Vocabulary

`⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

---

## Phase Status Table (Within SpecSet-4)

| Phase | Feature | Status |
|---|---|---|
| 4.1 | Kit definitions (node-express, python-fastapi, go-fiber) | ⬜ SPEC COMPLETE — not started |
| 4.2 | Kit registry (kits.json) | ⬜ SPEC COMPLETE — not started |
| 4.3 | `opensdd kit install` command | ⬜ SPEC COMPLETE — not started |
| 4.4 | Documentation and examples | ⬜ SPEC COMPLETE — not started |
| 4.5 | Publish kits with npm/package | ⬜ SPEC COMPLETE — not started |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).