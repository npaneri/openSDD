# Phase 4 — AI-Compatibility Documentation

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ✅ COMPLETE

---

## Task Group 1: Tool matrix + invocation mappings

1.1. Create `docs/ai-compatibility.md`. Section 1: design invariant statement (no tool-specific syntax inside `sdd/`; mappings live here).

1.2. Section 2: tool matrix table — rows: Claude Code, claude.ai (web), ChatGPT, Codex, GitHub Copilot, Gemini, Cursor, Amazon Q, Windsurf, Generic/any-other. Columns: skill support? / slash-command form / plain-chat form / notes.

1.3. Section 3: per-stage invocation snippets — for each of the 5 stages, a copy-paste prompt ("Follow `sdd/01-kickoff-and-alignment.md` in this repository to begin a new SpecSet for: <feature description>") plus the tool-specific command form where one exists.

**Exit criteria**: Every stage reachable from every listed tool via documented syntax; snippets reference repo-relative paths only.

---

## Task Group 2: Context hygiene + degradation ladder

2.1. Section 4: context hygiene per stage — kickoff (fresh session, repo + feature description); constitution (carry kickoff decisions); phase-specs (carry constitution + roadmap); implementation (fresh session per phase, plan.md + requirements.md in context); validation (checklist + evidence). Cite the practice origin (two completed SpecSets).

2.2. Section 5: degradation ladder — native skill (Phase 10's SKILL.md) → slash command → plain chat with paste-prompt → human + Markdown reader. Emphasize: every higher rung is sugar; the base rung is complete.

2.3. Link the doc from top-level `README.md` (compatibility section).

**Exit criteria**: Ladder reads top-down sugar→base; README links the doc.

---

## Task Group 3: Verification + commit

3.1. Verify every stage × tool cell in the matrix is either a real syntax or honestly marked "plain chat only."

3.2. Confirm zero tool-name hits in `sdd/` sweep (invariant holds).

3.3. Commit: `docs(ai): AI-compatibility matrix, invocation mappings, context hygiene (Phase 4, SpecSet-1)`.

**Exit criteria**: Matrix verified honest; sweep clean; commit landed.
