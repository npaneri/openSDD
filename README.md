# openSDD — Spec-Driven Development, as a Skill

**openSDD turns Spec-Driven Development from a manual, copy-paste practice into a portable skill.**

Traditional SDD asks you to copy a methodology folder (`sdd/`) into every project. openSDD reverses this: the methodology lives here, in the openSDD repo, and your project only contains your specifications and code.

| Problem (Traditional SDD) | openSDD Solution |
|---|---|
| Copy 12+ methodology files into every repo | Zero methodology files in your repo |
| Methodology pollutes git history | Clean history — only your SpecSets and code |
| "Upgrade the methodology" = manual copy in every repo | Re-clone or re-symlink; always latest |
| Cognitive load: methodology tangled with your spec files | Only your SpecSets are visible; methodology is invisible but active |
| AI assistants don't know SDD discipline | Skill-aware assistants: point at `sdd/` guides — they follow immediately |

---
## How It Works

openSDD has three usage paths. **Choose one:**

| Path | Best For | First Command |
|---|---|---|
| **[1] AI Assistant (Recommended)** | Teams using Claude, Gemini, Copilot, Codex | Clone repo; tell your assistant to follow `sdd/01-kickoff-and-alignment.md` |
| **[2] CLI (scaffold only)** | Those who want a terminal-first setup | `sdd init <SpecSetName>` |
| **[3] Manual (no tooling)** | Minimal setup; maximum control | Copy templates directly from `sdd/templates/` |

> **Note:** The CLI currently handles scaffolding (`init`, `phase`, `status`). Kit installation via CLI is coming in a future release. Use Path 1 (AI Assistant) for the richest experience today.

---
## Path 1: AI Assistant (Recommended)

The methodology is in `sdd/`. Point your AI assistant there and it drives the entire cycle.

### Setup

```bash
# 1. Clone openSDD alongside your project
git clone https://github.com/npaneri/openSDD.git ~/.opensdd
# or clone it anywhere you like — the path is what matters
```

### Starting a New Project

Tell your AI assistant (Claude, Gemini, Copilot, Codex, etc.):

```
"Follow ~/.opensdd/sdd/01-kickoff-and-alignment.md to start a new SpecSet
 for the <your project> project. The project is a <brief description>."
```

The assistant reads the guide, asks you grouped questions, and then follows the stage cycle:

| Your prompt | What happens |
|---|---|
| `"Follow sdd/01-kickoff-and-alignment.md to start a new SpecSet for <X>"` | Kickoff conversation; scope + naming confirmed |
| `"Follow sdd/02-constitution.md to create the constitution"` | Generates `mission.md`, `tech-stack.md`, `roadmap.md` |
| `"Follow sdd/03-phase-specs.md to create phase specs for phase 1"` | Generates `requirements.md`, `plan.md`, `validation.md` |
| `"Implement phase 1 following sdd/04-implementation-and-testing.md"` | Implements per task groups; tests born with code |
| `"Follow sdd/05-validation-and-closeout.md to close out phase 1"` | Checklist filled; merge criteria verified |

**Using the SKILL.md shortcut:** Some assistants (Claude, Copilot) can load `SKILL.md` as a skills file. This maps all 5 stages automatically — ask your assistant to load it at session start.

---
## Path 2: CLI (Scaffold)

The `sdd` CLI scaffolds SpecSet directories and phase directories from templates. It does not replace the AI-driven methodology — it handles the boilerplate so your assistant can focus on content.

### Install

```bash
# Option A: Clone and symlink (recommended — keeps bin/sdd connected to scripts/)
git clone https://github.com/npaneri/openSDD.git ~/.opensdd
ln -s ~/.opensdd/bin/sdd /usr/local/bin/sdd

# Option B: Run directly from clone root
git clone https://github.com/npaneri/openSDD.git ~/.opensdd
export PATH="$HOME/.opensdd/bin:$PATH"  # Add to your shell profile

# Verify
sdd --help
```

### Commands

```bash
# Create a new SpecSet (generates mission.md, tech-stack.md, roadmap.md)
sdd init <SpecSetName>
# Example: sdd init linkedin-automation

# Add a new phase to an existing SpecSet
sdd phase <SpecSetName> <N> <slug>
# Example: sdd phase linkedin-automation 1 session-management

# Show phase status across your SpecSet
sdd status
```

**After running `sdd init`:** Follow the AI Assistant path above to fill in the generated files.

### Telemetry

The CLI counts command names and version only — never paths, arguments, or file contents. To disable:

```bash
sdd --no-telemetry init <SpecSetName>
# or permanently:
export OPENSDD_TELEMETRY=0  # Add to shell profile
# or:
export DO_NOT_TRACK=1
```

Telemetry is automatically disabled in CI environments.

---
## Path 3: Manual (No Tooling)

Copy templates directly:

```bash
git clone https://github.com/npaneri/openSDD.git ~/.opensdd

# Create a SpecSet directory in your project
mkdir -p specs/my-feature

# Copy constitution templates
cp ~/.opensdd/sdd/templates/mission.template.md    specs/my-feature/mission.md
cp ~/.opensdd/sdd/templates/tech-stack.template.md specs/my-feature/tech-stack.md
cp ~/.opensdd/sdd/templates/roadmap.template.md    specs/my-feature/roadmap.md

# Add a phase (use today's date)
mkdir -p specs/my-feature/2026-11-05-1-core-setup
cp ~/.opensdd/sdd/templates/requirements.template.md specs/my-feature/2026-11-05-1-core-setup/requirements.md
cp ~/.opensdd/sdd/templates/plan.template.md         specs/my-feature/2026-11-05-1-core-setup/plan.md
cp ~/.opensdd/sdd/templates/validation.template.md   specs/my-feature/2026-11-05-1-core-setup/validation.md

Then read `sdd/02-constitution.md` and fill in the placeholders.
```

---
## What Your Project Gets

After running `sdd init linkedin-automation` and completing Stage 2, your project looks like this:

```
my-project/
├── specs/
│   └── linkedin-automation/          # Your SpecSet (stays in git — it's your spec history)
│       ├── mission.md                # Why this project exists; core principles; scope
│       ├── tech-stack.md             # Framework, tools, conventions, components being changed
│       ├── roadmap.md                # Phase order and status table
│       └── 2026-11-05-1-session-mgmt/   # Stage 1 (dated, numbered, named)
│           ├── requirements.md           # Scope, decisions, context, risks
│           ├── plan.md                   # Task groups with exit criteria
│           └── validation.md             # Definition of done + verification checklist
├── src/                              # Your implementation code
└── ...
```

**The `~/.opensdd/` directory stays on your machine — it never gets copied into your project repo.** Only your SpecSets and implementation code live in your project.

> **Should `specs/` be in git?** Yes — commit your specs. The whole point of spec-driven development is traceability: linking business intent to implementation decisions over time. Your specs are your project's decision history.

---
## The Development Cycle

```
Stage 01 — Kickoff & Alignment
  Scope + naming confirmed in conversation before any files are written

Stage 02 — Constitution Creation
  mission.md · tech-stack.md · roadmap.md
  The contract everything later is validated against

Stage 03 — Phase Spec Creation (repeat per phase)
  requirements.md · plan.md · validation.md
  Written and stakeholder-approved before any implementation

Stage 04 — Implementation & Testing
  Task groups in plan order · tests born with code · small commits

Stage 05 — Validation, Merge & Closeout
  Checklist filled with real outcomes · regression gates green · roadmap updated
  → back to Stage 03 for next phase
```

Each stage has a guide file in `sdd/`. Each guide states: **when** to use it, **what** it produces, the **anti-patterns** to avoid, and the **exit criteria** that must be true before moving to the next stage.

---
## Available Kits

Kits are pre-built SpecSet starters for common tech stacks. Install via CLI *(coming in v1.1)*:

```bash
sdd kit install python-fastapi    # coming soon
sdd kit install node-express      # coming soon
sdd kit install go-fiber          # coming soon
```

Until CLI kit support lands, copy from `kits/<name>/` manually or use the AI Assistant path.

| Kit | Framework | Language | Test | Lint |
|---|---|---|---|---|
| `python-fastapi` | FastAPI | Python | pytest | ruff |
| `node-express` | Express.js | JavaScript/TypeScript | vitest | biome |
| `go-fiber` | Fiber | Go | testify | staticcheck |
| `python-playwright*` | Playwright | Python | pytest + pytest-playwright | ruff |

*\*New kit — available in kits/ directory*

**Don't see your stack?** Use Path 1 (AI Assistant) — your assistant generates a custom SpecSet from the stage guides regardless of tech stack.

---
## Extensions

Extensions add optional methodology layers (new phase types, alternate gates, template variants) without modifying core guides. Each extension is a single Markdown file.

Browse extensions: [`extensions/`](extensions/)

Example extension: [`extensions/example-idea-assessment.template.md`](extensions/example-idea-assessment.template.md) — adds an idea-assessment phase before committing to implementation.

---
## Stage Guide Reference

| Stage | Guide | When to Use |
|---|---|---|
| 01 — Kickoff & Alignment | `sdd/01-kickoff-and-alignment.md` | At the start of any new SpecSet, before any files are written |
| 02 — Constitution Creation | `sdd/02-constitution.md` | After kickoff alignment is confirmed |
| 03 — Phase Spec Creation | `sdd/03-phase-specs.md` | After constitution is approved, before each phase |
| 04 — Implementation & Testing | `sdd/04-implementation-and-testing.md` | After phase specs are approved; roadmap shows `🔨 IN PROGRESS` |
| 05 — Validation & Closeout | `sdd/05-validation-and-closeout.md` | After implementation is complete |

For a full methodology overview, see [`sdd/README.md`](sdd/README.md).

---
## AI Assistant Compatibility

openSDD is designed to work with any AI assistant that can read files:

| Assistant | How to reference guides |
|---|---|
| **Claude / Claude Code** | `"Follow sdd/01-kickoff-and-alignment.md to …"` |
| **Gemini / Antigravity** | `"Read sdd/01-kickoff-and-alignment.md and start a SpecSet for …"` |
| **GitHub Copilot** | `"Use sdd/01-kickoff-and-alignment.md to …"` |
| **Codex / ChatGPT** | `"Execute the kickoff stage from sdd/01-kickoff-and-alignment.md for …"` |

For a full compatibility table, see `docs/integrations.md`.

---
## Why openSDD? — Our Competitive Strengths

| Concern | openSDD Model |
|---|---|
| **Repo size** | +0 files of methodology (vs. +12 from copying `sdd/`) |
| **Git tracking** | Clean — only your SpecSets and code in history |
| **Updates** | Re-download CLI from GitHub; always latest; no manual copy |
| **Onboarding** | "`sdd` skill — zero `sdd/` in your repo" vs. "copy this, then run 10 commands" |
| **Cognitive load** | Only see your SpecSets and code; methodology is invisible but active |
| **Professionalism** | Clean separation of concerns; methodology as package, not repo dependency |
| **OS compatibility** | CLI (`sdd`) runs natively on macOS/Linux; Windows users need [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) or [Git Bash] |
| **Internal files** | `brainstorm_ideas.md` and `openSDD.html` moved to `internal/`; root README links to them |

### Design Strengths (8/10)

| Strength | Assessment |
|---|---|
| **Methodology-as-skill model** | Truly original insight: keeping `sdd/` out of user repos eliminates copy-paste methodology debt |
| **5-stage cycle is complete and coherent** | Kickoff → Constitution → Phase Specs → Implement → Closeout covers the full SDLC |
| **Template set is well-structured** | 6 templates (mission, tech-stack, roadmap, requirements, plan, validation) match the guide stages exactly |
| **Guides are precise and anti-pattern aware** | Each guide explicitly names failure modes (e.g., "writing files before stakeholder confirms scope") |
| **Tool-agnostic by design** | SKILL.md works with Claude, Copilot, Gemini, Codex — no tool-specific syntax in methodology files |
| **Status vocabulary** | `⬜ SPEC COMPLETE — not started → 🔨 IN PROGRESS → ✅ COMPLETE` is clean and unambiguous |
| **Genericity guarantee in SKILL.md** | Explicit grep-based verification that methodology stays framework-neutral |
| **Phase isolation** | Each phase gets an independently implementable, testable, mergeable slice — excellent for agentic coding |
| **Validation checklists as truth** | Requiring real, recorded outcomes (not memory) in `validation.md` is a strong correctness gate |
| **scaffold.sh is robust** | Input validation (non-empty, no spaces, numeric N, kebab slug), duplicate-directory guard, loud failure messages |
| **Self-dogfooding** | The repo's own development used its own SDD process — credibility points |

### Implementation Strengths (3/10 → improving to 5/10)

- Telemetry is opt-out (`--no-telemetry`, `OPENSDD_TELEMETRY=0`, `DO_NOT_TRACK=1`, CI auto-detect)
- scaffold.sh resolves paths relative to script location — deterministic, no CWD dependency within the cloned repo
- Phase directory naming convention (`YYYY-MM-DD-N-slug`) is chronologically sortable and meaningful
- Validation of slug as kebab-case (alphanumeric + hyphens only) prevents naming chaos
- **All P0-P1 bugs fixed:** Install URL, help flag, status command, install architecture, command name unification, kit list

### Where openSDD Is Unique (vs. Competitors)

1. **Methodology-as-skill model** — No competitor separates the methodology repo from user repos this cleanly
2. **Stage guides with explicit anti-patterns** — The "what not to do" sections in each guide are more prescriptive than most tools
3. **Genericity guarantee** — The formal grep-based test for framework names in SKILL.md is a distinctive quality gate
4. **Self-dogfooding** — The repo used its own process to build itself (credibility other tools often lack early on)

### Competitive Comparison

| Criterion | **openSDD** *(fixed)* | **GitHub Spec Kit** | **BMAD Method** | **Amazon Kiro** | **Tessl** |
|---|---|---|---|---|---|
| **Core metaphor** | Methodology as skill; SpecSets in user repo | Pipeline toolkit: `spec → plan → tasks` | Simulated agile team | Spec-first IDE (VS Code fork) | Spec-as-source registry |
| **Installation** | ✅ Clone-and-symlink model | ✅ npm install | ✅ npx | ✅ IDE download | ✅ SaaS |
| **CLI tooling** | ✅ Fixed (init/phase/status working) | ✅ `specify-cli` works | ✅ `npx bmad-method` | ✅ IDE-native | ✅ MCP server |
| **Kit/starter support** | ✅ Kits defined; CLI kit install coming v1.1 | ✅ Bundled templates | ✅ 21-role workflows | ✅ EARS-based starters | ✅ 10,000+ specs |
| **Status/progress tracking** | ✅ Dynamic discovery from `specs/` | ✅ Via speckit | ✅ Via roles | ✅ IDE tasks | ✅ Built-in |
| **IDE lock-in** | None ✅ | None ✅ | None ✅ | AWS Kiro IDE | Via MCP ✅ |
| **Cost** | Free/OSS ✅ | Free/OSS ✅ | Free/OSS ✅ | Free (model costs) | Paid SaaS |
| **Methodology quality** | ✅ Excellent (8/10) | ✅ Good | ✅ Strong | ✅ Strong | ✅ Strong |
| **Community** | Solo project | GitHub backing ✅ | Active Discord ✅ | AWS backing ✅ | VC-funded ✅ |
| **Lock-in risk** | 10/10 (Zero) | Low | Medium | Medium | Low |
| **Innovation** | 9/10 (Methodology-as-skill) | 7/10 | 8/10 | 6/10 | 5/10 |

**openSDD's design intent sits at Level 2.5** — a novel position no competitor currently occupies cleanly. If the implementation matched the design intent, openSDD would be one of the strongest independent SDD tools available.

---
## Updating openSDD

If you have already cloned the repository, getting the latest updates is simple:

```bash
# From your cloned openSDD directory
git pull

# Then reload the CLI (if installed via symlink)
# The CLI picks up changes on next invocation no restart needed
```

**Note:** If you modified `kits.json` or added new kits, you may need to re-run the CLI or refresh your PATH.

---
## License

[MIT](LICENSE) — free to use, adapt, and distribute.

---

*openSDD v1.0.0 — the skill-based Spec-Driven Development system. The `sdd/` methodology is transparent: it powers the CLI and kits from the OpenSDD ecosystem, never copied to your repo.*