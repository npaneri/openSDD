# SpecSet-2 — Skill-Based Onboarding (Move Away from Copying sdd/)

**Date**: 2026-11-02
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — not started

## Summary

This SpecSet documents the architectural change to remove the requirement that users copy `sdd/` into their working repos. The `sdd/` methodology remains as the source-of-truth in the OpenSDD ecosystem, but users no longer need to copy it. Instead, skills reference `sdd/` from the OpenSDD package/CLI and generate only project-relevant files.

## Motivation

**Problems with the "copy sdd/" model:**
- +12 unnecessary files in user repos
- Git pollution — methodology files in project history
- Version skew — user's sdd/ diverges from OpenSDD updates
- Wrong mental model — users think SDD is part of their app
- Bloated onboarding: "copy this, then run 10 commands"

**Professional model:**
- `sdd/` stays in the OpenSDD ecosystem (npm package, CLI, or registry)
- Skills reference `sdd/` internally and generate only project-relevant files
- User's repo gets zero `sdd/` files — only their SpecSets and code
- Onboarding: "`opensdd kickoff api`, done" — 3 minutes

## Goals

1. **Document the architectural change** — why `sdd/` should not be copied
2. **Define the skill-based model** — skills as the primary unit, not commands
3. **Specify the user's repo structure** — what actually goes into a user project
4. **Define the OpenSDD ecosystem** — how `sdd/` is accessed without copying
5. **Plan the transition** — Phase 1 (skill definitions), Phase 2 (CLI), Phase 3 (kits), Phase 4 (marketplace), Phase 5 (publish)

## Scope

**In scope:**
- Rationale for removing `sdd/` copying
- Skill-based model definition (trigger/prerequisites/what it does/exit state)
- User repo structure without `sdd/`
- OpenSDD ecosystem access patterns (npm package, CLI, skill-aware assistant)
- Transition roadmap (5 phases from current state to skill-based v1)
- Backward compatibility — how existing users migrate

**Out of scope:**
- Actual implementation of the CLI/skills (that's SpecSet-3+)
- npm package publishing details (deferred to post-provenance)
- Tool-specific integration details (complemented by SpecSet-4+)
- Skill marketplace design (deferred to post-provenance)

## Dependencies

- **Phase 1** (this SpecSet): Rationale and model definition — no other phases dependencies
- **Phase 2**: CLI prototype — depends on Phase 1 model being settled
- **Phase 3**: Kit system — depends on Phase 2 working CLI
- **Phase 4**: Skill marketplace — depends on Phase 3 kits functional
- **Phase 5**: Publish & docs — depends on Phase 4 having working skills/kits

## Risks

| Risk | Mitigation |
|---|---|
| Users resist change from "copy sdd/" to skill model | Strong rationale documentation (this SpecSet); transition guide; backward compatibility path |
| Skills are too abstract without CLI implementation | Start with documented model first (this SpecSet); implement CLI in Parallel SpecSet-3 |
| Users lose access to methodology if they don't copy sdd/ | Ensure 3 access paths: npm package, CLI (`npx opensdd`), skill-aware assistants — all reference OpenSDD source |
| Genericity regression in skills | Same genericity sweep on `sdd/` applies; skills use placeholders resolved at install time |

## Success Criteria

- [ ] Rationale documented and approved (this SpecSet complete)
- [ ] Skill-based model defined (trigger/prerequisites/what it does/exit state)
- [ ] User repo structure defined (zero `sdd/` files)
- [ ] 3 access patterns documented (npm package, CLI, assistant)
- [ ] Transition roadmap with 5 phases approved
- [ ] Backward compatibility strategy noted

## Phase Order

| Phase | Feature | Dependencies |
|---|---|---|
| 1 | Rationale + model definition (this SpecSet) | None |
| 2 | CLI prototype with project detection | Phase 1 model settled |
| 3 | Kit system (node-express, python-fastapi, go-fiber) | Phase 2 CLI functional |
| 4 | Skill marketplace (community skills) | Phase 3 kits functional |
| 5 | Publish, docs, backward compatibility guide | Phase 4 working skills |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`.