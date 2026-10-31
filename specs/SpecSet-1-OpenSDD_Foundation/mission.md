# OpenSDD — Mission

## Purpose

OpenSDD is a standalone, publishable repository that turns the Spec-Driven Development (SDD) practice — authored and battle-tested inside FluidChartApp across two full SpecSets — into a portable toolkit any team or individual can adopt with any AI coding assistant.

The core value proposition: **adopt a proven spec-first development cycle in under five minutes, with zero runtime dependencies, working equally with Claude, OpenAI, Gemini, Copilot, Codex, or any AI that reads Markdown — no lock-in, no framework, no ceremony.**

## Problem Statement

AI coding assistants are powerful but unpredictable when requirements live only in chat history. Two popular toolkits address this — OpenSpec (73k stars) and GitHub's Spec Kit (144k stars) — but both carry weight: OpenSpec requires a CLI, a TypeScript toolchain, and teaches its own command vocabulary; Spec Kit requires Python 3.11+, `uv`, and a multi-capability architecture of extensions, presets, bundles, workflows, and catalogs. Teams that want a lightweight, immediately-adoptable SDD practice have no zero-dependency option, and none of the existing tools are designed AI-agnostic-first — they optimize for specific toolchains and specific numbers of them.

Meanwhile, a complete, generic, battle-tested SDD method exists in FluidChartApp's `specs/sdd/` folder: six stage guides and six templates, proven across two real SpecSets (a 7-phase library upliftment and a 5-phase LLM feature), with zero project-specific references (verified by genericity sweep). It needs a home where it can be published, evolved, and adopted independently of any single project.

## Solution

A repository containing:

1. **The toolkit (`sdd/`)** — the five stage guides (kickoff → constitution → phase specs → implement & test → validate & closeout) plus six fill-in templates. Pure Markdown. Copy into any repo and run.
2. **An example SpecSet** built *only* from the templates — proving template self-sufficiency and giving adopters a worked example.
3. **A scaffolding script and (later) a minimal CLI** — reducing adoption friction from "copy 12 files and edit" to "run one command."
4. **AI-compatibility layer** — explicit guidance and invocation mappings so the toolkit works with every major AI assistant, not just one.
5. **Extension surface** — a documented, minimal mechanism for teams to add their own phase types, bug-fix/idea-assessment templates, and role-based configurations without forking the core.

The repo develops itself using the toolkit it ships (dogfooding): this SpecSet-1 lives in `specs/` and follows the exact cycle the `sdd/` guides prescribe.

## Core Principles

### 1. Simplicity is the feature

Every addition is weighed against a zero-dependency, copy-the-folder baseline. A CLI wrapper, extension mechanism, or catalog earns its place only by materially lowering adoption friction — never by showcasing sophistication. Where OpenSpec and Spec Kit add layers, OpenSDD adds a paragraph.

### 2. AI-agnostic by design

No integration is first-class. Every guide, template, and script must work when followed by a human, by Claude, by OpenAI models, by Copilot, or by any future assistant. Tool-specific invocation syntax is documented as a mapping table, never baked into the core.

### 3. Dogfood or discard

The toolkit is developed using itself. Every guide improvement is discovered by running the cycle, not by speculation. SpecSet-1's phases are the proof: if a stage guide or template fails during this repo's own development, fixing it is in scope.

### 4. Battle-tested content, minimal packaging

The intellectual content (stages, templates, status vocabulary, decisions-table discipline) comes from two completed real-world SpecSets. Packaging (scripts, CLI, examples) is deliberately thin and removable — a team can discard every script and still have a complete method.

### 5. Degradation is expected, never fatal

Any layer can fail or be absent: no scripts → follow guides manually; no CLI → use scaffold.sh or copy templates; no example → the templates carry inline guidance. Every layer's absence degrades to the layer below, ending at "read the guides and write the files yourself."

## Scope

**In scope (SpecSet-1 — full vision, per stakeholder decision 2026-10-31):**
- Repo scaffolding: top-level README, MIT LICENSE, .gitignore, git init, initial commit
- `examples/minimal-specset/` — complete worked example built only from templates
- `scaffold.sh` — zero-dependency scaffolding of a SpecSet + phase directories
- AI-compatibility documentation (tool matrix, invocation mappings, context hygiene)
- Extensions mechanism (`extensions/` with placeholder infrastructure + docs)
- Bug-fix and idea-assessment optional templates
- Terminology alignment pass + `catalog/` folder with role-based configurations
- Minimal CLI wrapper (`sdd` command: init / phase / status)
- Cross-repo store guidance (shared-spec-repo patterns, subtree/mono-repo recipes)
- Agent-skill wrapper (`SKILL.md`) + slash-command integration mappings for major tools
- Optional, opt-out telemetry in the CLI + final verification and closeout

**Out of scope (explicitly deferred or rejected):**
- npm/Homebrew package publishing — decision #3 defers distribution polish until after content proves itself; copy-the-folder is v1
- Cloud services, accounts, or hosted stores — the store concept is documented as a pattern, never hosted
- Language-specific linters/formatters for spec files — specs are Markdown; no tooling opinion
- A web dashboard — out of proportion to the simplicity goal

**Non-goals:**
- Competing on feature count with OpenSpec or Spec Kit — the differentiator is zero-weight adoption
- Enforcing a single methodology on teams — the guides describe a cycle; teams adapt it (their adaptations are their extensions)
- Telemetry of any content, paths, or PII — if the CLI counts anything, it counts command names only, is opt-out, and is off by default in CI

## Relationship to prior work

- Toolkit source: FluidChartApp `specs/sdd/` (12 files), authored 2026-10-30, genericity-verified by sweep.
- Provenance cycles: FluidChartApp SpecSet-1 (ToonScript V2 upliftment, 7 phases) and SpecSet-2 (LLM Updates, 5 phases).
- Sync policy (decision #6): OpenSDD becomes canonical once published; the FluidChartApp in-project copy stays until SpecSet-2 closes, then is retired or reduced to a pointer.
