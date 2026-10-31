# Phase 1 — Repo Scaffolding

**Date**: 2026-10-31
**Branch**: `main` (initial branch of the new repo)
**Status**: ✅ COMPLETE

---

## Task Group 1: Housekeeping + git init

1.1. Remove `.DS_Store` from `sdd/` (copied from macOS origin); verify none others exist.

1.2. Create `.gitignore`: `.DS_Store`, `Thumbs.db`, `.idea/`, `*.swp`.

1.3. `git init` with default branch `main`.

**Exit criteria**: Clean working tree baseline; repo initialized; no junk files staged.

---

## Task Group 2: README + LICENSE + CHANGELOG

2.1. Write top-level `README.md`:
- Name + one-line pitch ("Spec-Driven Development as a copyable, AI-agnostic toolkit")
- Why (AI assistants + vague chat history = unpredictable results; specs fix it)
- Quick start (3 steps: copy `sdd/` into your repo → tell your AI "follow sdd/01-kickoff-and-alignment.md to start a SpecSet for X" → the cycle produces constitution → phase specs → implementation)
- Repo map table (`sdd/`, `specs/`, `examples/`, `docs/`, `scripts/`, `brainstorm_ideas.md` — note "examples/, docs/, scripts/ land in later phases")
- Compatibility statement (works with Claude, OpenAI, Copilot, Gemini, Codex — any AI that reads Markdown)
- License footer

2.2. Create `LICENSE` — MIT template; confirm copyright holder name with stakeholder before writing.

2.3. Create `CHANGELOG.md` — Keep-a-Changelog format; `## [0.1.0] — 2026-10-31` with "Initial toolkit import: 5 stage guides, 6 templates."

**Exit criteria**: Three files written; README one-screen-readable; no badge clutter.

---

## Task Group 3: Initial commit + sweep

3.1. Stage all files; initial commit: `feat(repo): initial OpenSDD repository — toolkit, specs, constitution (Phase 1, SpecSet-1)`.

3.2. Run genericity sweep on `sdd/` — zero hits for framework names must hold.

3.3. Fresh-read check: open README cold, confirm a newcomer reaches `sdd/README.md` in one hop.

**Exit criteria**: Commit landed on `main`; sweep clean; README navigation verified.
