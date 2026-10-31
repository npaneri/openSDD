# OpenSDD — Spec-Driven Development, as a skill

OpenSDD is a standalone, publishable repository that turns the Spec-Driven Development (SDD) practice into a portable toolkit any team or individual can adopt with any AI coding assistant.

## Quick Start — three steps to your first SpecSet

1. **Copy `sdd/` into your repo** (e.g. `<repo>/specs/sdd/`).
2. **Tell your agent (or team):** "Follow `specs/sdd/01-kickoff-and-alignment.md` to start a new SpecSet for `<feature>`."  
   The kickoff stage will produce your first constitution (`mission.md` / `tech-stack.md` / `roadmap.md`) — which captures everything project-specific. From then on, every phase follows: **spec → implement → validate → merge**.
3. **Follow the cycle** — use stages 02–05 to create phase specs, implement code, validate against checklists, and merge. See the `sdd/` stage guides for detailed instructions.

> **Works with any AI assistant** — Claude, OpenAI ChatGPT, GitHub Copilot, Gemini, Codex, or any model that reads Markdown. No tool-specific syntax, no framework dependencies.

## Repository Structure

```
OpenSDD/
  README.md                 — this file (front door — readable in under a minute)
  LICENSE                   — MIT license
  .gitignore                — osdd-specific git ignores
  CHANGELOG.md              — release history
  sdd/                      — the toolkit: 5 stage guides + 6 templates
    README.md               — the map: core rules, cycle diagram, glossary
    01-kickoff-and-alignment.md
    02-constitution.md
    03-phase-specs.md
    04-implementation-and-testing.md
    05-validation-and-closeout.md
    templates/              — 6 fill-in skeletons (mission, tech-stack,
                              roadmap, requirements, plan, validation)
  specs/                    — this repo's own SpecSets (dogfooding; SpecSet-1 lives here)
    2026-10-31-1-repo-scaffolding/
    2026-10-31-2-minimal-example/
    2026-10-31-3-scaffold-script/
    …
  brainstorm_ideas.md       — original idea backlog (settled decisions marked ✅)
  examples/                 — future: a minimal example SpecSet built purely from the templates
  docs/                     — future: adoption guides, case studies
  scripts/                  — future: scaffold.sh + optional CLI wrapper
```

## Why OpenSDD?

- **Portability**: Zero project-specific references (verified by genericity sweep). Any team can copy it, run stage 01, and be operational.
- **AI-agnostic by design**: No integration is first-class. Every guide, template, and script works when followed by a human, by Claude, by OpenAI models, by Copilot, or by any future assistant.
- **Dogfood or discard**: The toolkit is developed using itself. Every improvement is discovered by running the cycle, not by speculation.
- **Battle-tested content**: The intellectual content comes from two completed real-world SpecSets (a 7-phase library upliftment and a 5-phase LLM feature).
- **Zero dependencies**: Pure Markdown and POSIX shell scripts — run on a stock macOS/Linux shell. No Node, no Python, no runtime.

## License

MIT. See `LICENSE` for details.

## Changelog

See `CHANGELOG.md` for the release history.

## Getting Help

- Read the stage guides in `sdd/` in order: `01 → 02 → 03 → 04 → 05`
- Each guide's **Exit criteria** tells you when that stage is complete
- Ask your AI assistant: "Follow `sdd/01-kickoff-and-alignment.md` to start a SpecSet for …"
- Issues and PRs are welcome on GitHub — see the `CODE_OF_CONDUCT` and `CONTRIBUTING` guides (to be added)