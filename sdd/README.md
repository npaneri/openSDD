# Spec-Driven Development (SDD) — Guide

## What this is

A complete, project-agnostic method for conducting feature development. Work proceeds as **SpecSets**: each SpecSet is a folder under `specs/` containing a constitution (`mission.md` / `tech-stack.md` / `roadmap.md`) and, for every phase, a three-file spec (`requirements.md` / `plan.md` / `validation.md`) — written and approved **before** any implementation code is touched.

This folder is the skill: the numbered files below are the stages; the `templates/` folder makes each artifact mechanical to produce.

## Core rules

1. **Spec before code.** No implementation until the relevant spec files exist and the stakeholder has approved them.
2. **Discussion before files.** Ambiguities (scope, naming, structure) are resolved in conversation — with explicit grouped questions — before anything is written to disk.
3. **Very small phases.** Each phase is independently implementable, testable, and mergeable. Phases are numbered sequentially (1, 2, 3 …).
4. **One status vocabulary.** `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`.
5. **Checklists are the truth.** A phase is done when its `validation.md` checklist is filled with real, recorded outcomes — never from memory.
6. **Specs and reality stay in sync.** If implementation reveals a spec error, amend the spec first, then code. Silent divergence is the one unforgivable sin.

## The cycle

```
[0] Kickoff & alignment ──► [1] Constitution ──► [2] Phase specs ──┐
      (conversation)          (mission /            (requirements /  │
                               tech-stack /          plan /          │
                               roadmap)              validation)     │
                                                                     ▼
[5] Closeout ◄──── [4] Validation & merge ◄──── [3] Implement + test per phase
    (roadmap ✅,        (checklists filled         (task groups in order,
     lessons)            with evidence,             tests born with code,
                         regression gates)          small commits)
                          ▲                                │
                          └────────── next phase ──────────┘
```

## Which file to read when

| Moment | Read |
|---|---|
| A new feature area is proposed | `01-kickoff-and-alignment.md` |
| Creating a new SpecSet folder | `02-constitution.md` |
| Writing a phase's three spec files | `03-phase-specs.md` |
| Writing code for an approved phase | `04-implementation-and-testing.md` |
| Verifying, merging, closing a phase or SpecSet | `05-validation-and-closeout.md` |
| Producing any artifact | The matching file in `templates/` |

## Portability

These files contain **process only** — no project-specific technology, tool, or command names. Project facts (stack, commands, conventions, branch strategy, integrations) live in each SpecSet's own `tech-stack.md` constitution file. When a guide says "run the project's test and lint checks", the concrete commands come from that SpecSet's tech-stack.md.

To adopt this method in a new repository: copy `specs/sdd/`, then run stage 01 — the first constitution will capture everything project-specific.

## Glossary

| Term | Meaning |
|---|---|
| SpecSet | A feature area: a folder under `specs/` with a constitution plus phase directories |
| Constitution | The three SpecSet-root files: `mission.md`, `tech-stack.md`, `roadmap.md` |
| Phase | One small, independently mergeable unit of work; numbered sequentially; has a dated spec directory |
| Task group | A numbered section of a phase's `plan.md` with its own exit criteria |
| Checklist | The verification table in a phase's `validation.md`; filled with real outcomes |
| Degradation table | (When applicable) the canonical list of failure modes and their behaviors, defined in the mission and referenced verbatim by every later artifact |
| Stakeholder | Whoever owns the decisions — the user, product owner, or lead |
