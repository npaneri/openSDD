# AI Compatibility — OpenSDD works with any coding assistant

OpenSDD's core differentiator: **AI-agnostic-by-design**. Every guide, template, and script works when followed by a human, by Claude, by OpenAI models, by GitHub Copilot, by Gemini, by Codex, or by any future assistant. No tool-specific syntax is baked into the core — only plain Markdown.

## Tool Matrix — Invocation Mappings per Stage

Each stage guide can be invoked by any AI assistant using the documented syntax below. The syntax is minimal — just reference the Markdown file path.

| Stage | Guide File | Claude / ChatGPT Prompt | Copilot Prompt | Gemini Prompt | Cursor Prompt |
|---|---|---|---|---|---|
| 00 — Kickoff & Alignment | `sdd/01-kickoff-and-alignment.md` | "Follow `sdd/01-kickoff-and-alignment.md` to start a SpecSet for <feature>" | `/follow sdd/01-kickoff-and-alignment.md` | "Read `sdd/01-kickoff-and-alignment.md` and start a SpecSet" | "Follow the kickoff guide in `sdd/01-kickoff-and-alignment.md`" |
| 01 — Constitution Creation | `sdd/02-constitution.md` | "Follow `sdd/02-constitution.md` to create the constitution" | `/follow sdd/02-constitution.md` | "Apply `sdd/02-constitution.md` for constitution generation" | "Use the constitution guide `sdd/02-constitution.md`" |
| 02 — Phase Spec Creation | `sdd/03-phase-specs.md` | "Follow `sdd/03-phase-specs.md` to create phase specs" | `/follow sdd/03-phase-specs.md` | "Execute `sdd/03-phase-specs.md` for phase specs" | "Follow phase specs guide `sdd/03-phase-specs.md`" |
| 03 — Implementation & Testing | `sdd/04-implementation-and-testing.md` | "Follow `sdd/04-implementation-and-testing.md` to implement" | `/follow sdd/04-implementation-and-testing.md` | "Run `sdd/04-implementation-and-testing.md` for implementation" | "Use the implementation guide `sdd/04-implementation-and-testing.md`" |
| 04 — Validation, Merge & Closeout | `sdd/05-validation-and-closeout.md` | "Follow `sdd/05-validation-and-closeout.md` to validate and merge" | `/follow sdd/05-validation-and-closeout.md` | "Process `sdd/05-validation-and-closeout.md` for validation" | "Follow closeout guide `sdd/05-validation-and-closeout.md`" |

## Context Hygiene Per Session Shape

To get the best results from any AI assistant, observe these context hygiene guidelines:

| Guideline | Description |
|---|---|
| **Start with the stage guide** | Always begin by referencing the specific stage guide — never rely on chat history alone. |
| **Include the file path** | Reference guides by their full relative path (`sdd/01-kickoff-and-alignment.md`) so the AI can locate the exact content. |
| **Avoid tool-specific syntax** | Do not include `/`, `@`, or other tool-specific markers inside the spec files themselves. All `sdd/` content is plain Markdown. |
| **Refresh context per stage** | When moving from one stage to the next (e.g., kickoff → constitution → phase specs), restate the key context rather than assuming it carries forward. |
| **Use the degradation table** | If the AI fails to understand a concept, reference the **degradation table** in `mission.md` — it uses vocabulary that every assistant understands. |

## Degradation Ladder — What Happens Without AI Support

If an AI assistant cannot read or process the Markdown guides, the fallback path is explicit and complete:

1. **Paste the guide manually** — Copy the relevant `sdd/` stage guide into the chat and say "follow this"
2. **Read the guide yourself** — The guides are short enough (1–2 pages) to read in under 5 minutes
3. **Use the `brainstorm_ideas.md` cheat sheet** — The settled decisions are captured there for quick reference
4. **Follow the cycle by memory** — The five stages form a loop: kickoff → constitution → phase specs → implement → validate → merge. The guides exist so you don't have to memorize.

**Never fatal**: Every layer's absence degrades to the layer below, ending at "read the guides and write the files yourself." This is by design — zero dependencies.

## Genericity Sweep — Guarantee No Tool Lock-in

The `sdd/` directory must always return zero hits for framework/tool names when swept with the pattern `react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx|copilot|codex|gemini|cursor|claude|chatgpt`.

**Allowed**: The README and `docs/ai-compatibility.md` may name tools as *compatibility claims* (e.g., "works with Claude, OpenAI, Copilot"). These are documentation, not content.

**Forbidden**: Tool names anywhere inside `sdd/` guides, templates, or examples.

**Verification**: Run `grep -rn "react\|vite\|vitest\|npm\|firebase\|fluidchart\|bridge\|toon\|jsx" sdd/ --include="*.md"` — must return no results.

## Quick-Start Prompt Templates

Copy-and-paste these prompts for your AI assistant of choice:

**Claude / ChatGPT:**
```
Follow sdd/01-kickoff-and-alignment.md to start a new SpecSet for <feature>.
```

**Copilot:**
```
/follow sdd/01-kickoff-and-alignment.md
```

**Gemini:**
```
Read sdd/01-kickoff-and-alignment.md and start a SpecSet for <feature>.
```

**Codex:**
```
Execute the kickoff stage from sdd/01-kickoff-and-alignment.md for <feature>.
```

## AI-Agnostic Principles (from the Mission)

These principles, stated in `mission.md`, govern why OpenSDD works with any AI:

1. **AI-agnostic by design** — No integration is first-class. Every guide, template, and script works across assistants.
2. **Simplicity is the feature** — Zero-dependency, copy-the-folder baseline. Layers earn their place by lowering friction.
3. **Dogfood or discard** — The toolkit is developed using itself. If a guide fails during this repo's development, fixing it is in scope.
4. **Degradation is expected, never fatal** — Any layer can fail or be absent; the absence degrades to the layer below, ending at "read the guides and write the files yourself."