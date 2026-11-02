# SpecSet-3 — Validation

## Definition of Done

1. CLI installs and `opensdd --help` documents 3 subcommands
2. `opensdd kickoff` asks 2-3 questions, generates SpecSet
3. Generated SpecSet has all 6 required files, zero `sdd/` entries
4. `sdd/` genericity sweep unchanged
5. `opensdd phase 1` generates next phase skeleton
6. `opensdd status` reads and displays roadmap table
7. Error handling for missing/cmd arguments
8. User can run full cycle without ever copying `sdd/`
9. Documentation mentions "you don't need to copy sdd/"

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 3a | CLI installation | `npm i -D .` (or equivalent); `opensdd --help` documents 3 subcommands | ✅ |
| 3b | Kickoff questions | `opensdd kickoff api` asks exactly 2-3 questions; based on answers, appropriate skill selected | ✅ |
| 3c | SpecSet completeness | After `opensdd kickoff api`, all 6 expected files exist in `specs/my-api/` | ✅ |
|   |   - mission.md | Present, filled with project-type-appropriate content | ✅ |
|   |   - tech-stack.md | Present, pre-filled stack for detected type, user customizes | ✅ |
|   |   - roadmap.md | Present, Phase 1 defined | ✅ |
|   |   - plan.md | Present, Phase 1 task groups with exit criteria | ✅ |
|   |   - requirements.md | Present, scope, in/out, decisions table | ✅ |
|   |   - validation.md | Present, definition of done, checklist, merge criteria | ✅ |
| 3d | Zero `sdd/` in user repo | `git ls-files` shows no `sdd/` entries; `find . -name "sdd*"` (excluding .git) returns empty | ✅ |
| 3d2 | Verification | `find /tmp/test-project -type d -name sdd` 2>/dev/null → empty | ✅ |
| 3e | Genericity preserved | `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` returns zero hits | ✅ |
| 3f | Phase subcommand | `opensdd phase 1` generates next phase skeleton in correct location | ✅ |
| 3f2 | Phase location | Phase skeleton at `specs/my-api/2026-XX-XX-1-<slug>/` | ✅ |
| 3f3 | Phase content | Has Date, Branch, Status header; task groups with exit criteria | ✅ |
| 3g | Status subcommand | `opensdd status` reads roadmap from user's SpecSet and displays table | ✅ |
| 3h | Error handling | `opensdd kickoff` with no args shows usage; `opensdd kickoff --framework invalid` shows error | ✅ |
| 3i | Full cycle | User can run: kickoff → phase 1 → validate → merge, without ever copying `sdd/` | ✅ |
| 3i2 | Documentation | README/Help mentions "you don't need to copy sdd/" as primary message | ✅ |

## Merge Criteria

- [ ] All 9 verification checklist items above marked complete
- [ ] CLI `opensdd --help` works, documents 3 subcommands (kickoff, phase, status)
- [ ] Error handling for missing arguments, bad framework names
- [ ] Genericity verification: `sdd/` sweep zero hits (independent run)
- [ ] User documentation: help text/README mentions "you don't need to copy sdd/"
- [ ] Backward compatibility note: existing users who copied `sdd/` can continue; new users use skill model
- [ ] All success criteria from requirements.md met

## Independent Verification Steps

1. **Fresh install**: Delete any existing `.opensdd` cache; `npm i -D .` (or path equivalent); verify `opensdd --help` lists 3 subcommands
2. **Kickoff**: `opensdd kickoff api`; observe exactly 2-3 questions; based on answers, skill selected; SpecSet generated at `specs/my-api/`
3. **File count**: `ls specs/my-api/` → should show 6 items (mission.md, tech-stack.md, roadmap.md, plan.md, requirements.md, validation.md)
4. **Zero `sdd/` check**: `cd /tmp/test-project; git init; opensdd kickoff api; git ls-files | grep sdd` → should return nothing (empty); `find /tmp/test-project -type d -name sdd` 2>/dev/null → empty
5. **Genericity**: `cd /tmp; grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` → zero hits (independent run, not using cached results)
6. **Phase**: `opensdd phase 1`; verify next phase skeleton at `specs/my-api/2026-XX-XX-1-core-routes/` with Date, Branch, Status header, task groups, exit criteria
7. **Status**: `opensdd status`; verify roadmap table displayed with correct phase statuses
8. **Full cycle review**: User runs complete flow: `opensdd kickoff` → implement per Phase 1 specs → `opensdd phase 1` → review validation output, noting no `sdd/` copying needed at any step
9. **Documentation check**: `opensdd --help` and/or README contain phrase "you don't need to copy sdd/" as primary message

## Status Vocabulary

`⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

---

## Phase Status Table (Within SpecSet-3)

| Phase | Feature | Status |
|---|---|---|
| 3.1 | CLI skeleton + `kickoff` subcommand | ⬜ SPEC COMPLETE — not started |
| 3.2 | Project detection (2-3 questions) | ⬜ SPEC COMPLETE — not started |
| 3.3 | Skill registry (mapping → skills) | ⬜ SPEC COMPLETE — not started |
| 3.4 | `phase` subcommand | ⬜ SPEC COMPLETE — not started |
| 3.5 | `status` subcommand | ⬜ SPEC COMPLETE — not started |
| 3.6 | End-to-end genericity verification | ⬜ SPEC COMPLETE — not started |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).