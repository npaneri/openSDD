# Phase 9 — Cross-Repo Store Guidance

**Date**: 2026-10-31
**Branch**: `main`
**Status**: ✅ COMPLETE

---

## Task Group 1: Problem + three patterns

1.1. Create `docs/stores.md`. Section 1: the cross-repo problem (feature spans repos; central requirements; plan-before-code).

1.2. Section 2: Pattern A — separate store repo (layout, clone/submodule/subtree consumption, when-to-choose, tradeoffs). Credit OpenSpec's Stores as the concept origin.

1.3. Section 3: Pattern B — mono-repo specs folder (lead repo, link/consume, when-to-choose, tradeoffs).

1.4. Section 4: Pattern C — subtree mirror per code repo (offline/agent reads, when-to-choose, tradeoffs).

**Exit criteria**: Three patterns, each with layout + when-to-choose + honest tradeoffs.

---

## Task Group 2: Scenario walkthrough + drift guidance

2.1. Section 5: walkthrough — one cross-repo feature ("add SSO across API repo + web repo") carried through the five stages with the store as spec home: kickoff/constitution/specs in store → implementation in each code repo guided by store paths → validation recorded in store roadmap.

2.2. Section 6: drift named as the #1 risk; mitigations (roadmap status table as the single progress source; validation checklists cross-referencing commit hashes in code repos; store-first rule for any scope change).

2.3. Link from README docs area; resolve the Phase 7 architect-role pointer (verify it points at this file's real path).

**Exit criteria**: Walkthrough complete; architect pointer verified accurate; README links.

---

## Task Group 3: Commit

3.1. Commit: `docs(stores): cross-repo shared-store patterns and walkthrough (Phase 9, SpecSet-1)`.

**Exit criteria**: Commit landed.
