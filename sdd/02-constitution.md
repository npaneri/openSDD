# Stage 02 — Constitution Creation

**When**: Kickoff alignment (stage 01) is complete.
**Goal**: Three SpecSet-root files that fix the purpose, the facts, and the phase plan — the contract everything later is validated against.

## Folder

```
specs/<SpecSetName>/
  mission.md
  tech-stack.md
  roadmap.md
```

The SpecSet name describes the feature area. Constitution files live **at the SpecSet root** — never directly under `specs/`.

## mission.md — *why this SpecSet exists*

Sections:

1. **Purpose** — one paragraph; the core value proposition as a single emphasized sentence.
2. **Problem Statement** — what is wrong or missing today, with concrete evidence (current behavior, counts, commits) where available.
3. **Solution** — the target behavior; include a small flow diagram or numbered flow if the feature branches.
4. **Core Principles** — the non-negotiables (3–6). If the feature has a failure-behavior contract, define the canonical **degradation table** here so every later artifact speaks the same vocabulary.
5. **Scope** — In scope / Out of scope (name what is ALREADY delivered if the SpecSet builds on recent work) / Non-goals.

## tech-stack.md — *what facts and conventions govern the work*

Sections:

1. **Application** — framework, build, language, lint, testing, backend: each named with the project's actual tools and critical usage rules.
2. **Relevant Existing Components** — the files/services the feature touches and their current behavior (methods, endpoints, shapes). Evidence-based: read the code, do not guess.
3. **Target Addition(s)** — tables fixing the new data shapes, access rules, and formats (exact field names, types, caps). Later specs reference these instead of restating them.
4. **Conventions** — the project's hard rules: language subset, test-framework usage rules, mocking patterns, import/style rules, commit style.
5. **Notes** — deviations from the request (e.g. a missing input file) and why.

## roadmap.md — *in what order the work happens*

Sections:

1. **Philosophy** — very small phases; the completion gates (lint, tests, any project-specific gates — concrete commands per this project's conventions); the basis of the plan, explicitly flagging if the requested basis does not exist.
2. **Phase Order** — a status table (Phase × spec directory × status) plus the status vocabulary.
3. **One section per phase** — `**Status**` marker, short description, files, test summary, dependencies.

## Rules

- **Sequential phase numbering** — integers 1, 2, 3 … No fractions, no area/section prefixes.
- **Roadmap phase numbers ↔ directory names, verbatim** (directories are created in stage 03).
- The constitution states facts and contracts; it never contains task-level steps (those live in phase plans).
- Every shape or format decision that more than one phase depends on belongs in tech-stack.md, defined once and referenced everywhere.

## Process

1. Write the three files (use the `templates/` folder).
2. Self-consistency sweep: search the SpecSet for stale numbers and cross-reference errors.
3. **Await stakeholder approval** before stage 03. The constitution is the contract — it gets reviewed before phase specs expand it.

## Exit criteria

- [ ] `mission.md` / `tech-stack.md` / `roadmap.md` present at the SpecSet root, internally consistent
- [ ] Roadmap phases sequential; status table present; numbers match the planned directory names
- [ ] Stakeholder approved the constitution
