# Spec-Driven Development (SDD) — Guide

## What this is

A complete, project-agnostic method for conducting feature development. Work proceeds as **SpecSets**: each SpecSet is a folder under `specs/` containing a constitution (`mission.md` / `tech-stack.md` / `roadmap.md`) and, for every stage, a three-file spec (`requirements.md` / `plan.md` / `validation.md`) — written and approved **before** any implementation code is touched.

This folder is the skill: the numbered files below are the stages; the `templates/` folder makes each artifact mechanical to produce.

## Core rules

1. **Spec before code.** No implementation until the relevant spec files exist and the stakeholder has approved them.
2. **Discussion before files.** Ambiguities (scope, naming, structure) are resolved in conversation — with explicit grouped questions — before anything is written to disk.
3. **Very small stages.** Each stage is independently implementable, testable, and mergeable. Stages are numbered sequentially (1, 2, 3 …).
4. **One status vocabulary.** `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`.
5. **Checklists are the truth.** A stage is done when its `validation.md` checklist is filled with real, recorded outcomes — never from memory.
6. **Specs and reality stay in sync.** If implementation reveals a spec error, amend the spec first, then code. Silent divergence is the one unforgivable sin.

## The cycle

```
Stage 1: Kickoff & Alignment ──► Stage 2: Constitution ──► Stage 3: Phase Specs ──┐
  (conversation)              (mission /                (requirements /   │
                            tech-stack /               plan /            │
                            roadmap)                   validation)     │
                                                         ▼
Stage 5: Closeout ◄──── Stage 4: Implement + test per phase
    (roadmap ✅,         (checklists filled         (task groups in order,
     lessons)            with evidence,             tests born with code,
                         regression gates)          small commits)
                          ▲                                │
                          └────────── next stage ──────────┘
```

## Which file to read when

| Moment | Read |
|---|---|
| A new feature area is proposed | `sdd/01-kickoff-and-alignment.md` |
| Creating a new SpecSet folder | `sdd/02-constitution.md` |
| Writing a phase's three spec files | `sdd/03-phase-specs.md` |
| Writing code for an approved phase | `sdd/04-implementation-and-testing.md` |
| Verifying, merging, closing a stage or SpecSet | `sdd/05-validation-and-closeout.md` |
| Producing any artifact | The matching file in `templates/` |

## Portability

These files contain **process only** — no project-specific technology, tool, or command names. Project facts (stack, commands, conventions, branch strategy, integrations) live in each SpecSet's own `tech-stack.md` constitution file. When a guide says "run the project's test and lint checks", the concrete commands come from that SpecSet's tech-stack.md.

To adopt this method in a new repository: copy `specs/sdd/`, then run stage 1 — the first constitution will capture everything project-specific.

## Glossary

| Term | Meaning |
|---|---|
| SpecSet | A feature area: a folder under `specs/` with a constitution plus phase directories. Terminology matches broader SDD community usage (cf. OpenSpec, GitHub Spec Kit). |
| Constitution | The three SpecSet-root files: `mission.md`, `tech-stack.md`, `roadmap.md`. Also called the "constitution set" or "spec contract". |
| Phase | One small, independently mergeable unit of work; numbered sequentially (1, 2, 3 …); has a dated spec directory `YYYY-MM-DD-<N>-<slug>`. |
| Task group | A numbered section of a phase's `plan.md` with its own exit criteria. One task group = one coherent increment with its own gate. |
| Checklist | The verification table in a phase's `validation.md`; filled with real, recorded outcomes — never from memory. The authoritative "definition of done". |
| Degradation table | (When applicable) the canonical list of failure modes and their behaviors, defined in the mission and referenced verbatim by every later artifact. Vocabulary is AI-agnostic and works across all assistants. |
| Stakeholder | Whoever owns the decisions — the user, product owner, or lead. In OpenSDD, the stakeholder role is identified in the constitution's mission.md and tech-stack.md. |
| Role | A perspective into the SDD cycle (PM, developer, QA, architect). Each role has a preferred path through the phases, documented in `catalog/roles/`. |
| Extension | A single Markdown file (a phase type, a gate, a template variant) plus one index line. Discovered by reading, not by tooling. No loader, no code, no registry. |
| Catalog | The `catalog/` folder containing role-based configurations and phase-cycle variants for common roles. Discovered by reading, not by tooling. |
