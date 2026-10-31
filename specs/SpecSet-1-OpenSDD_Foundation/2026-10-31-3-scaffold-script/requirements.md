# Phase 3 — Requirements: `scaffold.sh` Scaffolding Script

## Scope

A zero-dependency POSIX shell script that automates the two repetitive adoption tasks: creating a new SpecSet (constitution from templates) and creating a new phase directory (phase spec files from templates). Lowers adoption friction from "copy 12 files and edit" to "run one command."

## In Scope

- `scripts/scaffold.sh` with two subcommands:
  - `specset <SpecSetName>` — creates `specs/<SpecSetName>/` with `mission.md`, `tech-stack.md`, `roadmap.md` copied from `sdd/templates/`
  - `phase <SpecSetName> <N> <slug>` — creates `specs/<SpecSetName>/YYYY-MM-DD-<N>-<slug>/` with `requirements.md`, `plan.md`, `validation.md` from templates; date auto-generated from system clock
- Interactive placeholder prompts (read from stdin) OR flag-based values; sensible behavior when stdin is non-interactive (fail loudly with usage)
- Loud failure when `sdd/templates/` is missing or incomplete
- Usage help (`--help` / no args)

## Out of Scope

- Filling placeholders intelligently (no LLM calls, no content generation — the script copies templates verbatim; humans/AI fill the content)
- Updating roadmaps or status tables (the phase scaffold is files only; roadmap edits are a human/AI step per stage 03)
- Windows cmd/PowerShell support (macOS/Linux POSIX sh only; documented limitation; Windows users use WSL/Git-Bash or manual copy)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Shell dialect | POSIX `/bin/sh` (no bashisms: no `[[`, no arrays, no `local` where avoidable) | Runs on stock macOS (`/bin/sh` → bash-as-sh) and any Linux; zero deps is the brand |
| Template source | Always relative to the script's own location (`$(dirname "$0")/../sdd/templates/`) | Works from any CWD; git-subtree safe |
| Date generation | `date +%Y-%m-%d` | Simple, universal; spec dir naming matches SDD convention |
| Placeholder handling | Copy templates verbatim; print a closing hint ("Now fill the <placeholders> — see sdd/03-phase-specs.md") | Script stays dumb; content is the human/AI's job; avoids half-filled garbage |
| Exit codes | 0 success; non-zero on missing template, bad args, existing target dir | CI-friendly; "fails loudly" principle from mission degradation table |
| Existing target | Refuse to overwrite; error message suggests removing or renaming | Never destroy work silently |
| License header | Short MIT comment block atop script | Open-source hygiene |

## Context

- Templates are at `sdd/templates/*.template.md` (6 files). Scaffolded files drop the `.template` suffix (`mission.template.md` → `mission.md`).
- SpecSet dir naming convention (per `sdd/02-constitution.md`): `specs/<SpecSetName>/`. Phase dir naming (per `sdd/03-phase-specs.md`): `YYYY-MM-DD-<N>-<slug>/`.
- The script will be reused by Phase 8's `bin/sdd` CLI wrapper — design the subcommand interface to be wrapper-friendly (script is the engine; CLI is the sugar).
- No shellcheck dependency in the gate set; `sh -n` syntax check + functional test are the gates (per roadmap philosophy).

## Dependencies

- Phase 2 (example validates template completeness the script depends on).

## Risks

| Risk | Mitigation |
|---|---|
| POSIX pitfalls (BSD date flags, sed differences) | Stick to `date +%Y-%m-%d` and `cp`; avoid GNU-only flags; test on macOS |
| Script silently copies wrong paths after repo restructure | Resolve templates relative to script location, not CWD; test from unrelated CWD |
| Users expect the script to generate content | Explicit post-run hint points to the stage guide for filling |
