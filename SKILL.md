# SKILL.md — Agent-Skill Entry Point for OpenSDD

Tool-agnostic prose naming the five SDD stages as invocable resources, so any
skill-aware agent (OpenCode, Claude Code, Codex, Copilot) can auto-drive the
cycle. This file is the *only* tool-specific content — it maps stage names to
file paths, never invoking tool-specific syntax inside the guides themselves.

## Stage Invocation Resources

Each stage is invocable by referencing the guide file path. An agent can auto-drive
the cycle by following these invocations.

| Stage | Resource Name | File Path | When to Invoke |
|---|---|---|---|
| 00 — Kickoff & Alignment | `sdd/01-kickoff-and-alignment.md` | `sdd/01-kickoff-and-alignment.md` | At the start of a new SpecSet — before any files are written. Use the grouped questions to scope the feature area with stakeholders. |
| 01 — Constitution Creation | `sdd/02-constitution.md` | `sdd/02-constitution.md` | After kickoff alignment is complete. Creates the three constitution files (`mission.md`, `tech-stack.md`, `roadmap.md`). |
| 02 — Phase Spec Creation | `sdd/03-phase-specs.md` | `sdd/03-phase-specs.md` | After constitution is approved. Creates the three phase spec files (`requirements.md`, `plan.md`, `validation.md`) for a new phase. |
| 03 — Implementation & Testing | `sdd/04-implementation-and-testing.md` | `sdd/04-implementation-and-testing.md` | After phase specs are approved and the roadmap status is `🔨 IN PROGRESS`. Execute task groups in plan order; tests born with code. |
| 04 — Validation, Merge & Closeout | `sdd/05-validation-and-closeout.md` | `sdd/05-validation-and-closeout.md` | After implementation is complete. Work the checklist top to bottom; fill Status column per item. Merge when checklist 100% green. |

## Driving the Cycle — Agent Prose

An agent-aware user can drive the full SDD cycle by invoking these resources
in order. No tool-specific syntax is required — only file path references.

### Example: Starting a New SpecSet for a Feature

```
User: "Follow sdd/01-kickoff-and-alignment.md to start a new SpecSet for
       a greeting widget feature."

Agent: Reads sdd/01-kickoff-and-alignment.md, conducts the kickoff
       conversation, and produces the initial alignment output (notes, grouped
       questions, confirmed scope).

User: "Now follow sdd/02-constitution.md to create the constitution."

Agent: Reads sdd/02-constitution.md, produces mission.md, tech-stack.md,
       and roadmap.md at the SpecSet root.

User: "Next, follow sdd/03-phase-specs.md to create phase specs for phase 1."

Agent: Reads sdd/03-phase-specs.md, creates requirements.md, plan.md,
       and validation.md in a dated phase directory.

User: "Now implement the phase, then follow sdd/05-validation-and-closeout.md
       to validate and merge."

Agent: Follows the validation checklist, records outcomes, and triggers merge.
```

## Key Principles

- **Tool-agnostic:** No `/`, `@`, or other tool-specific markers inside the skill file
  itself. All references are plain file paths (`sdd/01-kickoff-and-alignment.md`).
- **Composable:** Each stage can be invoked independently or in sequence. An agent
  can start at any stage given the appropriate pre-conditions.
- **Degradation fallback:** If an agent cannot read the guide, the fallback is:
  "Paste the guide content manually and continue." Every layer's absence degrades
  to the layer below, ending at "read the guides and write the files yourself."
- **No framework names:** The skill file contains no `react`, `vite`, `npm`, or
  other framework/tool names. The genericity sweep applies.

## Invocation Mappings per Tool (Supplementary — not in this file)

While this file is tool-agnostic, each major AI assistant has a convenient syntax:

- **Claude / ChatGPT:** "Follow `sdd/01-kickoff-and-alignment.md` to start a SpecSet for …"
- **Copilot:** `/follow sdd/01-kickoff-and-alignment.md`
- **Gemini:** "Read `sdd/01-kickoff-and-alignment.md` and start a SpecSet for …"
- **Codex:** "Execute the kickoff stage from `sdd/01-kickoff-and-alignment.md` for …"

These mappings are documented in `docs/integrations.md` — this file remains the
tool-agnostic source of truth.

## Genericity Guarantee

The `SKILL.md` file must always return zero hits for framework/tool names when
swept with the pattern `react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx`.

**Verification:** Run `grep -rn "react\|vite\|vitest\|npm\|firebase\|fluidchart\|bridge\|toon\|jsx" SKILL.md` — must return no results.