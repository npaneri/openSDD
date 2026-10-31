# OpenSDD — Tech Stack

## Application

| Layer | Technology |
|---|---|
| Content | Pure Markdown (CommonMark-compatible) |
| Scripts | POSIX shell (`/bin/sh`-compatible) for scaffold.sh; minimal wrapper for CLI |
| CLI (Phase 8) | Single-file POSIX shell script — no Node, no Python, no runtime deps |
| Versioning | Semantic, 0.x.y (pre-1.0 while methodology stabilizes) |
| License | MIT |
| Distribution v1 | Copy-the-folder (`sdd/` into any repo); git subtree friendly |
| Hosting | GitHub (public) |
| Dependencies | **None. Zero. Not even for the CLI.** |

## Repository Layout (target state after SpecSet-1)

```
OpenSDD/
  README.md                  — top-level: what/why/quick-start (Phase 1)
  LICENSE                    — MIT (Phase 1)
  .gitignore                 — .DS_Store, editor droppings (Phase 1)
  CHANGELOG.md               — 0.x.y releases (Phase 1)
  sdd/                       — the toolkit: 5 stage guides + 6 templates (exists)
  examples/
    minimal-specset/         — worked example built only from templates (Phase 2)
  scripts/
    scaffold.sh              — SpecSet/phase scaffolding (Phase 3)
  extensions/
    README.md                — extension mechanism docs + placeholders (Phase 5)
  templates/
    bug-fix.template.md      — optional extension template (Phase 6)
    idea-assessment.template.md — optional extension template (Phase 6)
  catalog/
    README.md                — catalog concept + role-based configs (Phase 7)
    roles/                   — PM / developer / QA / architect variants (Phase 7)
  bin/
    sdd                      — minimal CLI wrapper (Phase 8)
  docs/
    ai-compatibility.md      — tool matrix + invocation mappings (Phase 4)
    stores.md                — cross-repo shared-store patterns (Phase 9)
    integrations.md          — slash-command mappings per tool (Phase 10)
  SKILL.md                   — agent-skill entry point (Phase 10)
  specs/                     — this repo's own SpecSets (dogfooding; SpecSet-1 lives here)
  brainstorm_ideas.md        — original idea backlog (settled decisions marked ✅)
```

## Relevant Existing Components

### `sdd/` — the shipped toolkit (source of truth for content)

| File | Role |
|---|---|
| `sdd/README.md` | The map: 6 core rules, cycle diagram, file-when table, portability statement, glossary |
| `sdd/01-kickoff-and-alignment.md` | Stage 0: discussion before files; grouped questions; flag missing inputs |
| `sdd/02-constitution.md` | Stage 1: mission / tech-stack / roadmap anatomy + rules |
| `sdd/03-phase-specs.md` | Stage 2: requirements / plan / validation; decisions table mandatory |
| `sdd/04-implementation-and-testing.md` | Stage 3: task-group gates, tests-born-with-code, escaping-the-spec |
| `sdd/05-validation-and-closeout.md` | Stage 4: evidence-based checklists, merge, closeout, lessons |
| `sdd/templates/*.template.md` | 6 fill-in skeletons (mission, tech-stack, roadmap, requirements, plan, validation) |

Status vocabulary (canonical, already in `sdd/README.md`): `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE`.

### `brainstorm_ideas.md` — settled decisions

All 6 open decisions adopted 2026-10-31: name `OpenSDD`; MIT; copy-first install; SKILL.md additive layer; 0.x.y versioning; OpenSDD-canonical sync policy.

### FluidChartApp `specs/sdd/` — the origin copy

Byte-identical to this repo's `sdd/` at copy time (2026-10-30). Per sync policy: OpenSDD canonical post-publish; origin copy retired when FluidChartApp SpecSet-2 closes.

## Target Additions

| Aspect | Decision |
|---|---|
| `scripts/scaffold.sh` | POSIX sh; args: `scaffold.sh specset <name>` and `scaffold.sh phase <specset> <N> <slug>`; fills template placeholders interactively or via flags; fails loudly on missing templates |
| `bin/sdd` | Thin wrapper over scaffold.sh; subcommands `init`, `phase`, `status` (status parses roadmap tables); `--no-telemetry` and `OPENSDD_TELEMETRY=0` honored; counts command names only |
| `SKILL.md` | Agent-facing entry: names the stage guides as resources, describes when to invoke each; tool-agnostic prose (no tool-specific syntax in the file itself) |
| Extensions | Convention, not framework: an extension = a Markdown file in `extensions/` + one index line; teams copy a template, customize, register. No loading mechanism, no code |
| Catalog | `catalog/roles/<role>.md` — a phase-cycle variant for a role; discovered by reading, not tooling |

## Conventions (repo hard rules)

- **No runtime dependencies.** Scripts must run on a stock macOS/Linux shell. If a feature needs a runtime, it degrades to a documented manual path instead.
- **Genericity sweep** (`react|vite|vitest|npm|firebase|...`-style) applies to `sdd/` always; project/tool names may appear only in `docs/` mapping tables and examples.
- **Markdown style**: double-backtick fences for inline code inside tables where needed; standard CommonMark; no HTML in guides.
- **Status vocabulary** is fixed (see above); any status display must use it verbatim.
- **Decision records**: every settled structural decision lands in `brainstorm_ideas.md` (or its successor) with date — chat history is not a record.
- **Commits**: `<type>(<scope>): <what> (Phase <N>, SpecSet-1)` — mirrors the originating practice.
- **Telemetry (when present)**: command names + version only; off via `OPENSDD_TELEMETRY=0`, `DO_NOT_TRACK=1`, or `--no-telemetry`; disabled by default in CI; never paths, args, or content.

## Notes

- No `TODO.md` exists in this repo (none needed); the roadmap is derived from the settled brainstorm + the repo-study findings recorded in this SpecSet's phase requirements.
- Rival-repo study (2026-10-31): OpenSpec and GitHub Spec Kit analyzed; strengths selectively adopted (extensions concept, store guidance, AI-compat matrix, example-first proof); heavyweight patterns (hosted stores, multi-runtime CLIs, preset/workflow/bundle layers) explicitly rejected per Simplicity principle.
