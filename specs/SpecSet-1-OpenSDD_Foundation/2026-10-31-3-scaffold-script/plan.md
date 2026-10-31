# Phase 3 — `scaffold.sh` Scaffolding Script

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ⬜ SPEC COMPLETE — not started

---

## Task Group 1: Script skeleton + `specset` subcommand

1.1. Create `scripts/scaffold.sh` with MIT header, `set -eu` (portable strictness), usage function, and arg dispatch.

1.2. Implement `specset <SpecSetName>`: validate name (non-empty, no spaces), resolve `TEMPLATES_DIR` relative to script location, verify the 3 constitution templates exist, create `specs/<Name>/`, copy `mission|tech-stack|roadmap.template.md` → `.md`, print closing hint.

1.3. `chmod +x`; `sh -n scripts/scaffold.sh` clean.

**Exit criteria**: `sh specset TestSet` in a temp checkout creates 3 files byte-identical to templates; missing-template case exits non-zero with clear message.

---

## Task Group 2: `phase` subcommand + guards

2.1. Implement `phase <SpecSetName> <N> <slug>`: validate args (N numeric, slug kebab-safe), verify target SpecSet exists, verify 3 phase templates exist, compute `DATE=$(date +%Y-%m-%d)`, refuse if target dir exists, create dir, copy the 3 phase templates → `requirements|plan|validation.md`, print closing hint referencing `sdd/03-phase-specs.md`.

2.2. Implement `--help` and no-args usage; wire exit codes (0 / 1 usage / 2 missing template / 3 target exists — or simpler documented set, but distinct and documented).

2.3. Verify from unrelated CWD (`cd /tmp && sh /path/to/scripts/scaffold.sh …`) — template resolution must still work.

**Exit criteria**: Both subcommands functional; all guard cases exit non-zero with actionable messages; CWD-independence proven.

---

## Task Group 3: Functional test pass + docs + commit

3.1. Functional test script or recorded manual run (choose recorded manual steps in validation.md — a test *framework* would violate zero-deps):
- Run both subcommands on a temp copy; diff outputs against templates (must be identical).
- Missing-template case: temporarily rename `sdd/templates`, expect exit 2 + message.
- Existing-target case: rerun same scaffold, expect refusal.

3.2. Add a "Scaffolding" note to top-level `README.md` quick start (one line + usage snippet).

3.3. Commit: `feat(scripts): zero-dependency scaffold.sh for specsets and phases (Phase 3, SpecSet-1)`.

**Exit criteria**: All functional cases pass and are recorded; README updated; commit landed.
