# OpenSDD — Brainstorm Ideas

Captured from the discussion on turning the in-project SDD toolkit (`specs/sdd/` in FluidChartApp) into a standalone, publishable, installable repository. This file is the working backlog of ideas — decisions are marked ✅/❌/⏳ as they get settled.

## Why this repo exists

- **Portability**: The toolkit has zero project-specific references (verified by genericity sweep) — it's pure process. Any team can copy it, run stage 01, and be operational.
- **Skill-ification**: Guides can be structured as installable agent skills so new projects get the entire methodology pre-loaded instead of as docs to read.
- **Independent versioning**: The SDD methodology can evolve (bug fixes, new stages, template improvements) without touching any single project's `specs/` folder.
- **Community**: Publishing lowers the barrier for other teams to adopt Spec-Driven Development; issues and PRs improve the method for everyone.

## Proposed structure

```
OpenSDD/
  README.md                 — intro + quick start ("copy sdd/ into your repo, run stage 01")
  LICENSE                   — (decision pending: MIT recommended)
  brainstorm_ideas.md       — this file
  sdd/                      — the toolkit itself (copied from FluidChartApp specs/sdd/)
    README.md               — the map: core rules, cycle diagram, file-when table, glossary
    01-kickoff-and-alignment.md
    02-constitution.md
    03-phase-specs.md
    04-implementation-and-testing.md
    05-validation-and-closeout.md
    templates/              — 6 fill-in skeletons (mission, tech-stack, roadmap,
                              requirements, plan, validation)
  docs/                     — future: adoption guides, case studies
  examples/                 — future: a minimal example SpecSet built purely from the templates
```

## Open decisions

| # | Decision | Options | Leaning | Status |
|---|---|---|---|---|
| 1 | Repo naming | `OpenSDD` (folder name), `sdd-toolkit`, `spec-driven-dev` | Keep `OpenSDD` — distinctive, matches folder | ✅ ADOPTED 2026-10-31 |
| 2 | License | MIT / Apache-2.0 / none | MIT — maximum adoption, minimal friction | ✅ ADOPTED 2026-10-31 |
| 3 | Install method | Pure copy-the-folder / npm package / both | Copy-first (zero-dependency); npm optional for discoverability | ✅ ADOPTED 2026-10-31 |
| 4 | Skill integration | OpenCode skill (`SKILL.md` wrapper) / generic docs only | SKILL.md wrapper as additive layer — docs remain the source of truth | ✅ ADOPTED 2026-10-31 |
| 5 | Versioning scheme | 0.x.y semantic / calendar versioning | 0.x.y semantic (pre-1.0 while methodology stabilizes) | ✅ ADOPTED 2026-10-31 |
| 6 | Sync policy with FluidChartApp's specs/sdd/ | Keep both in sync / declare OpenSDD canonical / archive the in-project copy | Declare OpenSDD canonical once published; in-project copy kept until SpecSet-2 closes | ✅ ADOPTED 2026-10-31 |

## Install / distribution ideas

1. **Copy-the-folder (v1)**: README quick start = "copy `sdd/` to `<your-repo>/specs/sdd/`". Zero dependencies, works everywhere, git-subtree friendly.
2. **npm package (v2)**: `npm install -D opensdd` ships the files; a postinstall or `npx opensdd init` scaffolds `specs/sdd/` + a starter constitution. Nice-to-have, not required for adoption.
3. **Agent skill (v2)**: A `SKILL.md` at repo root (or `skill/` folder) so coding agents auto-invoke the SDD stages when the user says "create a spec set" / "write phase specs". The numbered guides become the skill's resources. This turns the repo from docs into a *runnable practice*.
4. **VS Code / editor snippets (v3, stretch)**: Snippets for the six templates so spec files can be inserted ad hoc inside an editor.

## README quick-start sketch (for the published repo)

```markdown
# OpenSDD — Spec-Driven Development, as a skill

1. Copy `sdd/` into your repo (e.g. `<repo>/specs/sdd/`).
2. Tell your agent (or team): "Follow specs/sdd/01-kickoff-and-alignment.md
   to start a new SpecSet for <feature>."
3. The kickoff stage will produce your first constitution
   (mission / tech-stack / roadmap) — which captures everything
   project-specific. From then on, every phase follows
   spec → implement → validate → merge.
```

## Roadmap for the repo itself (dogfooding opportunity)

| Phase | Work |
|---|---|
| 1 | Repo scaffolding: README, LICENSE, .gitignore (.DS_Store!), git init, initial commit of `sdd/` |
| 2 | `examples/minimal-specset/` — a toy SpecSet written purely from the templates, proving they're self-sufficient |
| 3 | `SKILL.md` agent-skill wrapper |
| 4 | Publish to GitHub; wire npm packaging if warranted |
| 5 | Docs: "Adopting OpenSDD in <stack>" walkthrough using a real SpecSet as the case study |

## Risks / watch-outs

- **Drift between this repo and FluidChartApp's `specs/sdd/`**: resolve via decision #6 — one canonical source.
- **Over-engineering distribution before content is proven**: copy-the-folder is the honest v1; npm/skill layers come after at least one more real adoption.
- **Genericity regression**: any future addition must pass the same sweep (no framework/tool/command names outside placeholders).

## Provenance

- Toolkit authored during FluidChartApp SpecSet-2 (dynamic LLM model lists), 2026-10-30, after two full spec-driven cycles (SpecSet-1 ToonScript V2 + SpecSet-2 LLM Updates).
- Genericity verified: sweep for `react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx` returned zero hits.
