# Phase 6 — Bug-Fix + Idea-Assessment Templates

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ✅ COMPLETE

---

## Task Group 1: Bug-fix template

1.1. Create `templates/bug-fix.template.md`:
- Header: optional single-file process; no SDD cycle required; use any time broken behavior is reported
- Sections: Symptom (what/when/repro steps/impact) → Cause assessment (evidence, hypotheses, root cause) → Fix plan (scope statement — what's fixed, what's explicitly not) → Verification (original symptom re-tested? regression checked?) → Verdict (`verified` / `partial` / `failed`, with honest-record guidance)
- Degradation row: "cannot reproduce" → document attempts + any workaround shipped

1.2. `sh`-independent check: template fills cleanly for a toy bug (mental walkthrough; record in validation).

**Exit criteria**: Template complete; verdict vocabulary matches requirements.

---

## Task Group 2: Idea-assessment template

2.1. Create `templates/idea-assessment.template.md`:
- Header: optional single-file process; use before ever opening a SpecSet
- Sections: Idea (one paragraph) → Evidence (what we know / what we'd need to know / how to find out) → Options (build-variant A / B / don't build) → Decision (`go` / `needs-clarification` / `stop`) with reason → Handoff (for "go": establish a SpecSet, begin stage 01, paste this file's decision as kickoff context; for "stop": the documented reason IS the useful outcome)

2.2. Verify the handoff references stage 01 by its real name from `sdd/01-kickoff-and-alignment.md`.

**Exit criteria**: Template complete; handoff bridge to stage 01 verified accurate.

---

## Task Group 3: Registration + commit

3.1. Register both templates in `extensions/README.md` index (type: process template).

3.2. Mention both in top-level README (one line each, in the customize/extensions area).

3.3. Commit: `feat(templates): optional bug-fix and idea-assessment process templates (Phase 6, SpecSet-1)`.

**Exit criteria**: Index updated; README mentions; commit landed.
