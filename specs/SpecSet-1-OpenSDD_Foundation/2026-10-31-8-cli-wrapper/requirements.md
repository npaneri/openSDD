# Phase 8 — Requirements: Minimal `sdd` CLI Wrapper

## Scope

`bin/sdd` — a thin POSIX shell entry point providing the optional convenience layer over `scripts/scaffold.sh` (Phase 3): `sdd init`, `sdd phase`, `sdd status`. Every subcommand has a documented fallback (the script, or manual copy). Optional opt-out telemetry counting command names only.

## In Scope

- `bin/sdd` with subcommands:
  - `init <SpecSetName>` — wraps `scaffold.sh specset`
  - `phase <SpecSetName> <N> <slug>` — wraps `scaffold.sh phase`
  - `status [SpecSetName]` — parses roadmap status tables under `specs/`, prints phase list with status vocabulary (⬜/🔨/✅)
  - `--help`, `--version` (reads a version string, initially 0.x.y)
- Telemetry: opt-out honoring `OPENSDD_TELEMETRY=0`, `DO_NOT_TRACK=1`, `--no-telemetry`; default OFF in CI (`CI` env var set); when on, counts subcommand names + version only to a local counter file (no network — see decisions)
- Install guidance: symlink or add `bin/` to PATH; equally usable as `sh bin/sdd`
- README installation note

## Out of Scope

- Any network activity (telemetry is a local counter — see decisions; no phone-home)
- Wrapping anything beyond scaffold + status (no new functionality in the CLI layer)
- Shellcheck as a gate (not in the gate set; `sh -n` + functional runs)
- Windows native support (WSL/Git-Bash documented as the path)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Implementation | Thin dispatch over `scripts/scaffold.sh` — the script remains the engine | Single source of truth for scaffolding logic; CLI is sugar per mission degradation table |
| `status` parsing | Grep roadmap tables for phase rows + status markers under `specs/*/roadmap.md` | Zero-deps; the status table format is ours and stable (roadmap template) |
| Telemetry transport | **Local counter file only (`.opensdd_counter`) — no network** | Zero-deps + trust: a phone-home would violate the privacy stance; local counting is honest bookkeeping; can be revisited post-1.0 with explicit design |
| Telemetry default | ON for local runs (count names only), OFF when `CI` set, always OFF via the three opt-outs | Transparent minimum; CI stays clean |
| Counter content | Subcommand name + toolkit version, one line per invocation | Matches brainstorm privacy stance exactly (names + version only) |
| Version source | `VERSION` file at repo root (single line, `0.2.0` at this phase) | Simple; CLI `--version` and future packaging read one file |
| PATH guidance | "Symlink to `/usr/local/bin` or add `bin/` to PATH; `sh bin/sdd` also works" | Both zero-install and installed paths documented |

## Context

- Phase 3's `scaffold.sh` exists with `specset`/`phase` subcommands, guard exits, CWD-independent template resolution — the CLI reuses it verbatim via `$(dirname "$0")/../scripts/scaffold.sh`.
- `sdd status` depends on the roadmap table format from `sdd/templates/roadmap.template.md` (`| N | feature | dir | status |` rows + per-phase `**Status**:` markers). Parsing targets both.
- Version numbering: Phase 1 seeded CHANGELOG at 0.1.0; this phase bumps to 0.2.0 (CLI added). 1.0.0 reserved for Phase 10.
- The "no runtime" brand holds: the CLI is a shell script; users without it run scaffold.sh or copy templates — all three rungs documented in ai-compatibility.md's ladder pattern.

## Dependencies

- Phase 3 (scaffold.sh is the engine).

## Risks

| Risk | Mitigation |
|---|---|
| CLI duplicates scaffold logic (drift) | Hard rule: CLI dispatches to the script; no reimplementation |
| `status` misparses hand-edited roadmaps | Tolerant grep (finds rows, marks unparseable lines `[?])`; status never crashes on odd tables |
| Telemetry concerns from users | Local-only, documented, triple opt-out, CI-off default; README privacy line |
| POSIX `local`-keyword portability | Avoid `local` in functions where avoidable; test with `sh -n` and dash if available |
