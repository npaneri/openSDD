# SpecSet-5 — Publish, Docs, and Backward Compatibility

**Date**: 2026-11-02
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — not started

## Summary

Finalize the OpenSDD skill-based system for publication. SpecSet-5 covers: npm package publishing, full documentation, onboarding guides, backward compatibility for existing users who copied `sdd/`, and the official release process. This SpecSet completes the skill-based model cycle and makes the system ready for general adoption.

## Goals

1. **npm package publishing**: Publish `opensdd` as an npm package so users can `npm i -D opensdd`
2. **Full documentation**: Write onboarding guides, kit documentation, CLI reference, and migration guide
3. **Backward compatibility**: Address existing users who copied `sdd/` into their repos — provide migration path
4. **Release process**: Define the release process, versioning, and Changelog
5. **User onboarding guide**: Complete walkthrough from `npm i -D opensdd` to first SpecSet

## Deliverables

- **npm package**: `package.json` with `main`, `files`, `scripts` fields
- **Onboarding guide**: "Getting Started with OpenSDD" — from `npm i -D opensdd` to first `opensdd kit install`
- **Migration guide**: "Migrating from copy sdd/ to skill-based model" — for existing users
- **CLI documentation**: `opensdd --help`, subcommand docs, examples
- **Kit documentation**: Each kit's README updated with installation instructions
- **Changelog**: Full changelog from 0.1.0 to 1.0.0

## Migration Strategy

### For existing users who copied `sdd/`:
1. **Option 1: Keep existing setup** — No action needed; `sdd/` continues to work
2. **Option 2: Migrate to skill model** — Run `npm i -D opensdd`; new SpecSets generated via skills; old `sdd/` can be removed
3. **Option 3: Side-by-side** — Keep `sdd/` for existing SpecSets; use `opensdd kit install` for new SpecSets

**Migration steps**:
```
# Install OpenSDD package
npm i -D opensdd

# Generate new SpecSets via skills (old sdd/ SpecSets continue to work)
opensdd kit install node-express

# Old SpecSets in specs/sdd/ continue to work unchanged
# New SpecSets go in specs/<my-project>/
```

### Versioning:
- **0.x.y**: Pre-1.0 development phase (SpecSets 1-4)
- **1.0.0**: Official release — skill-based model proven, methodology stable
- **1.x.y**: Patch releases — bug fixes, kit additions, documentation improvements

## Success Criteria

- [ ] npm package publishes successfully (`npm i -D opensdd`)
- [ ] Onboarding guide covers: install → kickoff → first SpecSet → phase → validate
- [ ] Migration guide addresses existing users who copied `sdd/`
- [ ] CLI documentation complete (`opensdd --help`, all subcommands)
- [ ] Kit documentation complete (3 kits: node-express, python-fastapi, go-fiber)
- [ ] Changelog complete (0.1.0 → 1.0.0)
- [ ] Version bump to 1.0.0 in package.json and CHANGELOG.md
- [ ] Backward compatibility confirmed (existing `sdd/` setups continue to work)

## Risks

| Risk | Mitigation |
|---|---|
| npm package publishing failure | Use `npm publish --dry-run` first; have fallback documentation |
| Users can't migrate | Provide clear, step-by-step migration guide with screenshots |
| Version confusion | Explicit versioning: 0.x.y during development, 1.0.0 at release |
| Breaking changes | Maintain backward compatibility; explicit migration path |

## Dependencies

- **SpecSet-1**: Methodology closeout and version 1.0.0 ✅
- **SpecSet-2**: Skill-based model with zero `sdd/` in user repos ✅
- **SpecSet-3**: CLI prototype specification ✅
- **SpecSet-4**: Kit system with 3 kits ✅
- **sdd/ toolkit**: Genericity-verified, source-of-truth ✅

## Phase Order (Within SpecSet-5)

| Phase | Feature | Dependencies |
|---|---|---|
| 5.1 | npm package skeleton & package.json | SpecSet-4 kit system |
| 5.2 | Full documentation (onboarding, CLI, kits, migration) | SpecSet-1–4 complete |
| 5.3 | Backward compatibility guide | SpecSet-2 model approved |
| 5.3 | Changelog & version bump 0.1.0 → 1.0.0 | SpecSet-1 closeout |
| 5.4 | npm package publish & verify | 5.1–5.3 |
| 5.5 | Final review & release | 5.1–5.4 |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`.

## Exit Criteria

- [ ] npm package publishes successfully
- [ ] Onboarding guide complete (install → first SpecSet → phase → validate)
- [ ] Migration guide complete (existing users)
- [ ] CLI documentation complete (all subcommands documented)
- [ ] Kit documentation complete (3 kits documented)
- [ ] Changelog complete (0.1.0 → 1.0.0)
- [ ] Version bumped to 1.0.0
- [ ] Backward compatibility confirmed
- [ ] All checklist items above marked complete

---

## Quick-Start (Post-Phase-5)

```bash
# Install
npm i -D opensdd

# First SpecSet
opensdd kit install node-express
# or: opensdd kickoff  # with 3 questions

# Continue development
opensdd phase 1
opensdd status

# Kit overview
opensdd kit list
```

---

## Status Table (All SpecSets)

| SpecSet | Feature | Status |
|---|---|---|
| **SpecSet-1** | 10-phase methodology ✅ closeout | ✅ COMPLETE |
| **SpecSet-2** | Skill-based onboarding, zero `sdd/` | ✅ COMPLETE |
| **SpecSet-3** | CLI prototype (kickoff/phase/status) | ✅ SPEC COMPLETE |
| **SpecSet-4** | Kit system (node-express, python-fastapi, go-fiber) | ✅ SPEC COMPLETE |
| **SpecSet-5** | Publish, docs, backward compatibility | In progress |

The SpecSet-5 completes the skill-based model cycle, making OpenSDD ready for general adoption with npm publication, full documentation, and backward compatibility.