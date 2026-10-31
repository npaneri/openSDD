# Phase 4 — Requirements: AI-Compatibility Documentation

## Scope

`docs/ai-compatibility.md` — the explicit documentation of OpenSDD's core differentiator: the toolkit works with every major AI coding assistant, not just one. A tool matrix, invocation syntax mappings, context-hygiene guidance, and the degradation ladder for tools without any special support.

## In Scope

- `docs/ai-compatibility.md` with:
  - **Tool matrix** — Claude (Claude Code / claude.ai), OpenAI (ChatGPT / Codex), GitHub Copilot, Gemini, Cursor, Amazon Q, Windsurf, and a generic fallback row: how each tool invokes each of the 5 stages
  - **Invocation syntax mapping** — slash-command form per tool where the tool supports skills/commands (e.g., Copilot `/speckit-…`-style, Claude Code skill form, plain-chat paste form); the canonical "paste this prompt" fallback for every stage
  - **Context hygiene** — recommended session shape per stage (start fresh for kickoff; carry constitution into phase specs; clean context before implementation — drawn from OpenSpec's published guidance and our own practice)
  - **Degradation ladder** — tool with skill support → tool with slash commands → tool with plain chat (paste guides) → human reading guides directly
- Top-level README link to the doc
- Explicit statement of the design invariant: **no tool-specific syntax lives inside `sdd/`** — mappings are documentation, not code

## Out of Scope

- Actual skill/command files per tool (that's Phase 10's `SKILL.md` + `docs/integrations.md`)
- Modifying `sdd/` guides (they remain tool-agnostic; if a guide accidentally references a tool, that's a genericity-sweep fix, not this phase's feature)
- Benchmarks of AI quality per tool (out of proportion; unverifiable claims avoided)

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Doc placement | `docs/ai-compatibility.md`, linked from README | Docs folder pattern from tech-stack target layout |
| Tool list scope | 8 named tools + generic fallback | Covers the majors both rivals support; long tails via the fallback row |
| Invocation content | Mapping *tables* + copy-paste prompt snippets | Tables scan fast; snippets work with zero adaptation |
| Quality claims | No "works best with model X" recommendations | AI-agnostic principle; models change too fast to be a doc |
| Context hygiene source | Synthesized from our two SpecSets + OpenSpec's published advice | Evidence-based, not invented |
| Sweep invariant | Stated in the doc AND enforced by Phase 10's closeout sweep | The claim must stay true |

## Context

- Both rival repos document tool support: OpenSpec claims 30+ tools; Spec Kit has an `integrations/` doc set. Neither is agnostic-first — both ship tool-specific command files as the primary artifact.
- Our five stages map naturally to per-tool invocation: kickoff = planning chat; constitution = document-generation prompt; phase-specs = document-generation prompt; implement = the tool's normal coding loop guided by plan.md; validate = checklist-driven verification chat.
- `sdd/README.md` already states "process only — project facts live in tech-stack.md"; the same discipline extends to tool facts — they live in docs, not guides.

## Dependencies

- Phase 1 (README exists to link from).

## Risks

| Risk | Mitigation |
|---|---|
| Doc rots as tools change syntax | Fallback "paste prompt" row never rots; matrix rows are best-effort with a "verify against your tool's docs" note |
| Overpromising integration depth | Matrix distinguishes "native skill support" vs "paste a prompt" honestly |
| Tool names create genericity-sweep noise | Sweep applies to `sdd/` only; `docs/` mapping tables are the sanctioned location for tool names |
