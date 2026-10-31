# Phase 8 — Minimal `sdd` CLI Wrapper

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — not started

---

## Task Group 1: CLI skeleton + scaffold dispatch

1.1. Create `VERSION` (single line `0.2.0`). Create `bin/sdd`: MIT header, `set -eu`, resolve repo root relative to script location, `--help`/`--version` (version reads `VERSION`).

1.2. Implement `init <Name>` and `phase <Name> <N> <slug>`: dispatch to `scripts/scaffold.sh specset|phase`, passing args through; propagate exit codes.

1.3. `sh -n bin/sdd` clean; functional run of both subcommands on a temp copy.

**Exit criteria**: Both subcommands work from any CWD; exit codes propagate; `sh -n` clean.

---

## Task Group 2: `status` subcommand

2.1. Implement `status [SpecSetName]`: for each `specs/*/roadmap.md` (or the named one), extract phase rows from the status table + per-phase `**Status**:` markers; print compact list `Phase N — <feature> — <status>`; unparseable lines print `[?]` rather than failing.

2.2. No-SpecSets case: friendly message ("No SpecSets found under specs/ — run sdd init").

**Exit criteria**: Status prints correctly for this repo's own SpecSet-1; tolerant of hand-edited tables.

---

## Task Group 3: Telemetry (local counter) + docs + commit

3.1. Implement telemetry: `telemetry_enabled()` checks `OPENSDD_TELEMETRY=0`, `DO_NOT_TRACK=1`, `--no-telemetry` in args, and `CI` env — any set ⇒ disabled. When enabled, append `<version> <subcommand>` to `.opensdd_counter` at repo root. No network, ever.

3.2. `.opensdd_counter` → `.gitignore`.

3.3. README: install note (symlink / PATH / `sh bin/sdd`), fallback statement (CLI optional — scaffold.sh and manual copy remain first-class), privacy line (local counter, names + version only, triple opt-out, CI-off).

3.4. CHANGELOG entry 0.2.0. Commit: `feat(cli): minimal sdd wrapper with status and local-only telemetry (Phase 8, SpecSet-1)`.

**Exit criteria**: All three opt-outs verified functionally; counter file appends correctly; docs landed; commit made.
