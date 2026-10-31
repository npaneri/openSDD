# Phase 8 — Validation

## Definition of Done

1. `bin/sdd` works: init / phase / status / --help / --version, from any CWD.
2. CLI dispatches to scaffold.sh — zero duplicated logic.
3. Telemetry: local counter only; all three opt-outs + CI default verified functionally.
4. README install + privacy notes; CHANGELOG 0.2.0; VERSION file.
5. Commit landed.

## Verification Checklist

| # | Check | Expected | Status |
|---|---|---|---|
| 8a | `sh -n bin/sdd` | Clean | |
| 8b | `sdd init TestSet` | Delegates to scaffold.sh; 3 files created | |
| 8c | `sdd phase TestSet 1 feat` | Delegates; dated dir created | |
| 8d | Exit-code propagation | scaffold failure ⇒ CLI non-zero | |
| 8e | `sdd status` | Prints SpecSet-1's 10 phases with statuses | |
| 8f | Status tolerance | Hand-edited roadmap line prints `[?]`, no crash | |
| 8g | `sdd --version` | Reads VERSION (0.2.0) | |
| 8h | `sdd --help` | Usage incl. all subcommands + opt-outs | |
| 8i | Telemetry off: `OPENSDD_TELEMETRY=0` | No counter append (verified) | |
| 8j | Telemetry off: `DO_NOT_TRACK=1` | No counter append | |
| 8k | Telemetry off: `--no-telemetry` | No counter append | |
| 8l | Telemetry off: `CI=1` | No counter append | |
| 8m | Telemetry on (no opt-outs) | Appends `<version> <subcommand>` line only | |
| 8n | No network | Script contains no curl/wget/nc — grep check | |
| 8o | .gitignore | `.opensdd_counter` covered | |
| 8p | README | Install + fallback + privacy line present | |
| 8q | CHANGELOG | 0.2.0 entry present | |

## Merge Criteria

- Checklist 100% green with real functional runs recorded (telemetry cases actually executed with a stub counter inspection).
- Phase 9 may begin.
