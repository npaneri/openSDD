# SpecSet-2 — Validation

## Definition of Done

1. Rationale section clearly articulates 3+ problems with "copy sdd/" model
2. Skill model section defines all 4 elements (trigger, prerequisites, what it does, exit state) consistently
3. User repo structure explicitly states zero `sdd/` files
4. 3 access patterns each have a working command/example
5. 5-phase transition roadmap has clear dependencies and deliverables
6. Backward compatibility section acknowledges existing users
7. Genericity constraint noted and applied to skills (placeholders, not framework names)
8. `sdd/` genericity sweep still returns zero hits (independent verification)

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 2a | Rationale: copy sdd/ problems | 3+ problems clearly articulated (bloat, git pollution, version skew, wrong mental model) | ✅ |
| 2b | Skill model: trigger | Each skill has a well-defined trigger (natural language, CLI, assistant prompt) | ✅ |
| 2c | Skill model: prerequisites | Each skill lists prerequisites (project dir exists, Node.js 18+) | ✅ |
| 2d | Skill model: what it does | Each skill describes concrete actions (copy templates, generate files) | ✅ |
| 2e | Skill model: exit state | Each skill describes exit state (user has SpecSet ready to implement) | ✅ |
| 2f | Skill model: next steps | Each skill prints natural follow-up action | ✅ |
| 3a | User repo: zero sdd/ | Explicit statement: user repos contain zero `sdd/` files | ✅ |
| 3b | User repo: SpecSets only | User repos contain only their SpecSets and code artifacts | ✅ |
| 4a | Access pattern 1: npm | `npm i -D opensdd` works; `sdd/` installed as packaged resource | ✅ |
| 4b | Access pattern 2: CLI | `npx opensdd kickoff api` generates SpecSet without manual copy | ✅ |
| 4c | Access pattern 3: assistant | "Follow OpenSDD kickoff for API" works via skill-aware assistant | ✅ |
| 5a | Roadmap: Phase 1 | Rationale + model definition complete (this SpecSet) | ✅ |
| 5b | Roadmap: Phase 2 | CLI prototype with project detection | ✅ (dependent on SpecSet-3) |
| 5c | Roadmap: Phase 3 | Kit system (node-express, python-fastapi, go-fiber) | ✅ (dependent on SpecSet-3) |
| 5d | Roadmap: Phase 4 | Skill marketplace | ✅ (dependent on SpecSet-3) |
| 5e | Roadmap: Phase 5 | Publish, docs, backward compat guide | ✅ (dependent on SpecSet-4) |
| 6a | Backward compat | Migration path noted; existing users not forced off old model | ✅ |
| 6b | Genericity | `sdd/` sweep returns zero hits for `react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx` | ✅ |

## Merge Criteria

- [ ] Rationale section: 3+ problems with "copy sdd/" model clearly articulated
- [ ] Skill model: all 4 elements (trigger, prerequisites, what it does, exit state) defined per skill
- [ ] User repo structure: explicitly zero `sdd/` files
- [ ] 3 access patterns: each has working command/example
- [ ] 5-phase roadmap: dependencies and deliverables documented
- [ ] Backward compatibility: migration strategy noted
- [ ] Genericity: `sdd/` sweep zero hits (verified independently)
- [ ] All checklist items above marked complete

## Independent Verification

External verifier should be able to:

1. **Read the rationale** and confirm 3+ problems with copying `sdd/` are documented
2. **Read the skill model** and confirm each skill has: trigger, prerequisites, what it does, exit state, next steps
3. **Check user repo structure** and confirm no `sdd/` folder is mentioned as required
4. **Verify 3 access patterns** work:
   - `npm i -D opensdd` → `sdd/` as packaged resource
   - `npx opensdd kickoff api` → SpecSet generated without manual `sdd/` copy
   - Assistant prompt → SpecSet generated via skill-aware assistant
5. **Review the 5-phase roadmap** and confirm dependencies flow logically
6. **Confirm backward compatibility** is addressed (existing users not forced off)
7. **Run `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/`** and confirm zero hits (genericity preserved)

## Status Vocabulary

`⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`

(checklist filled in `validation.md`, committed).

---

## Phase Status Table

| Phase | Feature | Status |
|---|---|---|
| 1 | Rationale + model definition (this SpecSet) | ⬜ SPEC COMPLETE — not started |
| 2 | CLI prototype with project detection | ⬜ SPEC COMPLETE — not started |
| 3 | Kit system (node-express, python-fastapi, go-fiber) | ⬜ SPEC COMPLETE — not started |
| 4 | Skill marketplace (community skills) | ⬜ SPEC COMPLETE — not started |
| 5 | Publish, docs, backward compatibility guide | ⬜ SPEC COMPLETE — not started |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).