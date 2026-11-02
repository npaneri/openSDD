# SpecSet-2 — Requirements: Skill-Based Onboarding

## Scope

Define the requirements for transitioning OpenSDD from a "copy sdd/" model to a skill-based model where users never copy the `sdd/` folder into their working repos.

## In Scope

- **Rationale documentation**: Why copying `sdd/` is unnecessary and professional model alternatives
- **Skill-based model definition**: Skills as the primary unit with trigger/prerequisites/what it does/exit state
- **User repo structure**: What files belong in a user project (zero `sdd/` files)
- **OpenSDD ecosystem access patterns**: How users access the methodology without copying
  - npm package (`npm i -D opensdd`)
  - CLI wrapper (`npx opensdd kickoff api`)
  - Skill-aware assistants ("Follow OpenSDD kickoff for API")
- **Transition roadmap**: 5-phase plan from current state to skill-based v1
- **Backward compatibility strategy**: How existing users migrate

**Out of scope:**
- Actual CLI implementation (SpecSet-3+)
- npm package publishing details (SpecSet-5+)
- Tool-specific integration details (SpecSet-4+)
- Skill marketplace design (SpecSet-4+)

## Out of Scope

- Actual implementation of the CLI or skills — that work belongs in SpecSet-3 and beyond
- npm package details (version, yml, publishing) — deferred to SpecSet-5 after provenance proves itself
- Skill marketplace design — deferred to SpecSet-4 after kit system proves itself
- In-depth tool-specific invocation mappings — complemented by SpecSet-4

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| `sdd/` in user repos | Never copied | Zero benefit, +12 files, git pollution, version skew risk |
| Primary unit | Skills, not commands | Skills have trigger/prerequisites/what it does/exit state; composable |
| User repo contents | Zero `sdd/` folder | Only user's SpecSets and code; methodology stays in OpenSDD ecosystem |
| Access pattern 1 | npm package | `npm i -D opensdd` installs `sdd/` as packaged resource; skills reference it |
| Access pattern 2 | CLI wrapper | `npx opensdd kickoff api` downloads/caches `sdd/` temporarily, generates SpecSet |
| Access pattern 3 | Skill-aware assistant | Assistant reads methodology from OpenSDD repo/registry, generates SpecSet |
| Transition roadmap | 5 phases | Phase 1 (rationale/model), Phase 2 (CLI), Phase 3 (kits), Phase 4 (marketplace), Phase 5 (publish) |
| Backward compatibility | Migration path | Existing users can copy sdd/ manually if desired; new users use skill model |
| Genericity in skills | Placeholders resolved at install | Skills use `[FRAMEWORK]`, `[LANGUAGE]` placeholders; sweep on `sdd/` unchanged |

## Context

**Current state (SpecSet-1):**
- Users copy `sdd/` into their repos
- Run 10 phases with manual commands
- `sdd/` folder tracked in project git history

**Desired state (SpecSet-2 model):**
- Users install OpenSDD via npm or CLI
- Run skills (e.g., `opensdd kickoff api`)
- Zero `sdd/` files in user repo
- Methodology lives in OpenSDD source-of-truth; users access it without copying

**Key constraint:** The `sdd/` directory must always return zero hits for framework/tool names when swept with `react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx`. This constraint applies regardless of whether `sdd/` is copied or accessed via package — the source-of-truth remains genericity-verified.

## Dependencies

- **None**. This is the first phase of SpecSet-2. Subsequent phases depend on this model being settled.

## Risks

| Risk | Mitigation |
|---|---|
| Users resist change from "copy sdd/" to skill model | Strong rationale documentation in this SpecSet; transition guide (Phase 5); backward compatibility — existing users can copy sdd/ manually if desired |
| Skills are too abstract without CLI implementation | Document model first (this SpecSet); implement CLI prototype in SpecSet-3 in parallel; iterate |
| Users lose methodology access without copying sdd/ | Ensure 3 access paths work: npm package, CLI, skill-aware assistants — all reference OpenSDD source-of-truth |
| Genericity regression in skills | Same genericity sweep on `sdd/` applies; skills use placeholders resolved at install time; sweep unchanged |

## Success Criteria

- [ ] Rationale documented and why `sdd/` copying is unnecessary
- [ ] Skill-based model defined (trigger/prerequisites/what it does/exit state for each skill)
- [ ] User repo structure defined (zero `sdd/` — only SpecSets + code)
- [ ] 3 access patterns documented and verified (npm, CLI, assistant)
- [ ] 5-phase transition roadmap approved
- [ ] Backward compatibility strategy noted (migration path for existing users)

## Transition Roadmap Overview

| Phase | Focus | Deliverable |
|---|---|---|
| 1 | Rationale + model definition | This SpecSet — why `sdd/` shouldn't be copied, skill model |
| 2 | CLI prototype + project detection | Working `opensdd kickoff api` command |
| 3 | Kit system | `node-express`, `python-fastapi`, `go-fiber` kits |
| 4 | Skill marketplace | Community skills contributions |
| 5 | Publish & docs + backward compat | npm package, full docs, migration guide |

## Success Metrics (Post-Implementation)

After the full 5-phase transition:

1. **Zero `sdd/` in user repos**: `git ls-files` in fresh project shows no `sdd/` files
2. **Onboarding time**: < 5 minutes from `npm i -D opensdd` to first SpecSet ready
3. **User satisfaction**: > 80% prefer skill model over "copy 12 files and run commands"
4. **Genericity preserved**: `sdd/` sweep still returns zero hits (independent verification)
5. **Backward compatibility**: Existing users can migrate; no one is forced off the old model

## Verification

This SpecSet's success will be verified by:

1. **Rationale completeness**: Does the "why" convince? Is the problem clearly articulated?
2. **Model coherence**: Are trigger/prerequisites/what it does/exit state consistent across the skill model?
3. **Zero `sdd/` claim**: Can we verify no `sdd/` files in user repos after onboarding?
4. **Access pattern coverage**: Do all users (npm, CLI, assistant) have a working path?
5. **Transition feasibility**: Is the 5-phase roadmap realistic given resource constraints?

## QA Checklist

- [ ] Rationale section clearly articulates 3+ problems with "copy sdd/" model
- [ ] Skill model section defines all 4 elements (trigger, prerequisites, what it does, exit state)
- [ ] User repo structure explicitly states zero `sdd/` files
- [ ] 3 access patterns each have a working command/example
- [ ] 5-phase roadmap has clear dependencies and deliverables
- [ ] Backward compatibility section acknowledges existing users
- [ ] Genericity constraint noted and applied to skills (placeholders, not framework names)