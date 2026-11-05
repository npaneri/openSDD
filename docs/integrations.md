# Integrations — Per-Tool Invocation Syntax for OpenSDD

This file consolidates per-tool invocation syntax for OpenSDD, complementing the
tool-agnostic `SKILL.md` with concrete setup steps for major AI assistants.

## Caveat

`SKILL.md` is the *tool-agnostic* source of truth — it contains only plain file
paths and stage descriptions. The mappings below show how to invoke each stage
from common assistants, but the *content* of the guides themselves never contains
tool-specific syntax.

## Claude / ChatGPT (OpenAI)

Invoke each stage by referencing the file path in a natural language prompt:

```
# Kickoff a new SpecSet
"Follow sdd/01-kickoff-and-alignment.md to start a new SpecSet for <feature>."

# Create the constitution
"Follow sdd/02-constitution.md to create the constitution."

# Create phase specs
"Follow sdd/03-phase-specs.md to create phase specs for phase <N>."

# Implement and test
"Follow sdd/04-implementation-and-testing.md to implement the phase."

# Validate and merge
"Follow sdd/05-validation-and-closeout.md to validate and merge the phase."
```

## GitHub Copilot

Copilot uses a `/follow` custom directive to reference Markdown files:

```
/follow sdd/01-kickoff-and-alignment.md
/follow sdd/02-constitution.md
/follow sdd/03-phase-specs.md
/follow sdd/04-implementation-and-testing.md
/follow sdd/05-validation-and-closeout.md
```

> Note: The `/follow` directive must have the Markdown file path as its argument.
> It does not accept free-form text.

## Gemini / Google AI

Reference the file path in a read/ execute prompt:

```
# Read and execute the kickoff stage
"Read sdd/01-kickoff-and-alignment.md and start a SpecSet for <feature>."

# Read and execute the constitution stage
"Apply sdd/02-constitution.md for constitution generation."

# Read and execute phase specs
"Execute sdd/03-phase-specs.md for phase <N> spec generation."

# Read and execute implementation
"Run sdd/04-implementation-and-testing.md for implementation guidance."

# Read and execute validation
"Process sdd/05-validation-and-closeout.md for validation and merge."
```

## Codex / GitHub Copilot CLI

Use the `gh` CLI or Codex-style execution:

```
# Execute the kickoff stage
gh codex "Execute the kickoff stage from sdd/01-kickoff-and-alignment.md for <feature>."

# Or with the full path
codex "Read sdd/02-constitution.md and create the constitution files."
```

## Cursor

In Cursor, reference the guide file by its path in the chat prompt, same as
Claude/ChatGPT:

```
Follow sdd/01-kickoff-and-alignment.md to start a SpecSet for <feature>.
```

## Common Pattern — File Path Reference

All tools use the same underlying pattern: reference the `sdd/` guide file by its
relative path. The guides are plain Markdown, so any assistant that reads Markdown
can process them. The table below summarizes the universal pattern:

| Action | Universal Pattern |
|---|---|
| Read a stage guide | `sdd/01-kickoff-and-alignment.md` |
| Invoke kickoff | `sdd/01-kickoff-and-alignment.md` |
| Create constitution | `sdd/02-constitution.md` |
| Create phase specs | `sdd/03-phase-specs.md` |
| Implement code | `sdd/04-implementation-and-testing.md` |
| Validate & merge | `sdd/05-validation-and-closeout.md` |

## Setting Up Your Assistant

1. **Ensure the `sdd/` folder is present** in your repo (copy it from the OpenSDD
   toolkit repo, or use `sdd init` from the `bin/sdd` CLI wrapper).
2. **Reference guides by path** — never by content summary or memory. The file
   paths are the invariant; content may vary by project.
3. **Start at stage 1** — kickoff & alignment. Every SpecSet begins there.
4. **Follow the cycle** — Stage 1 → Stage 2 → Stage 3 → Stage 4 → Stage 5. The roadmap status table
   tracks progress: `⬜ SPEC COMPLETE → 🔨 IN PROGRESS → ✅ COMPLETE`.
5. **When stuck,** reference the degradation table in `mission.md` — it uses
   AI-agnostic vocabulary that every assistant understands.

## Genericity Compliance

These documentation pages may name tools (`Claude`, `Copilot`, `Gemini`, `Codex`,
`Cursor`) as *compatibility claims* — explaining which assistants the method works
with. These are allowed in `docs/` and `README.md` because they are documentation,
not content inside `sdd/`.

**Forbidden:** Tool names inside `sdd/` guides, templates, or `SKILL.md`. The
genericity sweep `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` must return zero hits — and does.