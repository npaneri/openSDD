# SpecSet-3 — Requirements: CLI Prototype with Project Detection

## Scope

Define the requirements for building a working `opensdd` CLI prototype with project type detection and SpecSet generation capabilities. This SpecSet implements the skill-based model from SpecSet-2 without requiring users to copy `sdd/` into their working repos.

**In scope:**
- CLI subcommands: `kickoff`, `phase`, `status`
- Project type detection via 2-3 question prompt
- SpecSet generation: mission.md, tech-stack.md, roadmap.md, Phase 1 skeleton
- Zero `sdd/` in user repos — `sdd/` stays in OpenSDD package
- Genericity preservation: `sdd/` sweep unchanged
- Skill registry mapping project types → skill definitions

**Out of scope:**
- Full npm package publishing (SpecSet-5+)
- All framework integrations (initial 3 options: Node.js + Express, Node.js + FastAPI, Python + FastAPI)
- GUI or web interface (CLI only)
- Skill marketplace (SpecSet-4+)
- Advanced project detection (beyond 2-3 questions)

## Requirements

### 1. CLI Subcommands

| Subcommand | Arguments | What It Does |
|---|---|---|
| `kickoff` | `<type>` or interactive prompt | Detects project type; generates complete SpecSet in user repo |
| `phase` | `<N>` | Generates next phase skeleton; updates roadmap status |
| `status` | none | Reads and displays roadmap status table from user's SpecSet |

### 2. Project Type Detection

Must ask exactly 2-3 questions:
- Question 1: Language/framework (predefined options + "Other")
- Question 2: Project name (if not derivable from CWD)
- Question 3: Description (optional, for mission.md)

Options for Q1 (minimum 3):
- Node.js + Express
- Node.js + Fastify
- Python + FastAPI
- (If "Other": ask for framework name)

### 3. SpecSet Generation

Upon `kickoff`, generate these files in user's repo (NO `sdd/` folder):

| File | Content |
|---|---|
| `specs/<name>/mission.md` | Project purpose, problem statement, solution, core principles, scope — filled with project-type-appropriate content |
| `specs/<name>/tech-stack.md` | Stack table (framework, build, language, lint, testing, backend) — pre-filled for detected type, user customizes |
| `specs/<name>/roadmap.md` | Phase order, philosophy, one section per phase — Phase 1 defined |
| `specs/<name>/2026-XX-XX-1-<slug>/plan.md` | Phase 1: task groups with exit criteria, Date, Branch, Status ✅ COMPLETE |
| `specs/<name>/2026-XX-XX-1-<slug>/requirements.md` | Phase 1: scope, in/out, decisions table, context, dependencies, risks |
| `specs/<name>/2026-XX-XX-1-<slug>/validation.md` | Phase 1: definition of done, verification checklist, merge criteria |

### 4. Zero `sdd/` in User Repo

**Requirement**: User's git repo must contain zero `sdd/` files after `opensdd kickoff`.

**How**:
- `sdd/` remains in the OpenSDD package (npm-installed, not repo-copied)
- Skills reference `sdd/` from the package for template content
- Only project-relevant artifacts (SpecSets, code) go to user repo
- Verification: `git ls-files` shows no `sdd/` entries; `find . -name ".DS_Store" | grep sdd` returns empty

### 5. Genericity Preservation

**Requirement**: `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` returns zero hits.

**How**:
- Skills use placeholders `[FRAMEWORK]`, `[LANGUAGE]` in generated content, resolved at install time
- No framework/tool names in `sdd/` guides, templates, or skill definitions
- The `sdd/` directory itself remains unchanged and genericity-verified

### 6. Skill Registry

Mapping from project detection answers to skill definitions:

| Detection Answer | Skill Generated |
|---|---|
| Node.js + Express | `api-node-express` skill |
| Node.js + Fastify | `api-node-fastify` skill |
| Python + FastAPI | `api-python-fastapi` skill |

Each skill is a Markdown definition that:
- References `sdd/` from the installed package
- Generates project-relevant files only
- Has trigger/prerequisites/what it does/exit state/next steps

## Success Criteria

- [ ] `opensdd kickoff api` works with 3 framework options
- [ ] Generated SpecSet has zero `sdd/` files (verified by `git ls-files` and `find`)
- [ ] `sdd/` genericity sweep unchanged (verified independently)
- [ ] Project detection asks exactly 2-3 questions, selects appropriate skill
- [ ] Generated SpecSet has all 6 required files (mission, tech-stack, roadmap, plan, requirements, validation)
- [ ] `opensdd phase 1` continues from kickoff-generated SpecSet
- [ ] `opensdd status` reads and displays roadmap table
- [ ] User can run full cycle: kickoff → phase 1 → validate → merge, without ever copying `sdd/`

## Risks

| Risk | Mitigation |
|---|---|
| CLI accidentally creates `sdd/` in user repo | Design review; verification step in merge criteria; `git ls-files` check in validation |
| Project detection selects wrong framework | User override option; 6 predefined options; "Other" with manual entry |
| Generated content contains framework names breaking genericity | Placeholder resolution at install; `sdd/` sweep unchanged; template placeholders, not runtime values |
| User expects to manually copy `sdd/` | Documentation-first approach; "you don't need to copy sdd/" is primary message; backward compat in SpecSet-5 |
| `phase` subcommand loses context from `kickoff` | Skill registry stores generated SpecSet path; `phase` reads from last `kickoff` location |

## Dependencies

- **SpecSet-1**: Closeout complete — methodology source-of-truth verified
- **SpecSet-2**: Model defined — zero `sdd/` in user repos approved; skill model defined
- **sdd/ toolkit**: Genericity-verified source-of-truth (sweep zero hits)
- **Node.js 18+** (for CLI); Python 3.10+ (if Python kits); FastAPI/Express knowledge for template content

## Verification

External verification should check:

1. **CLI installation and subcommands**: `npm i -D opensdd` (or equivalent); `opensdd kickoff`, `opensdd phase`, `opensdd status` all work
2. **Zero `sdd/` in user repo**: After `opensdd kickoff api`, `git ls-files` shows no `sdd/`; `find . -name "sdd*"` returns only non-sdd entries
3. **Genericity preserved**: `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` returns zero hits
4. **SpecSet completeness**: After `opensdd kickoff api`, all 6 expected files exist in `specs/my-api/`
5. **Project detection**: 2-3 questions asked; based on answers, appropriate skill/kit generates SpecSet
6. **Full cycle**: `opensdd kickoff api` → implement per Phase 1 specs → `opensdd phase 1` → validate → merge, all without manual `sdd/` copying

## Merge Criteria

- [ ] All 6 success criteria above met
- [ ] CLI `opensdd --help` works, documents 3 subcommands
- [ ] Error handling for missing arguments, bad framework names
- [ ] Genericity verification: `sdd/` sweep zero hits
- [ ] User documentation: README with "you don't need to copy sdd/" message
- [ ] Backward compatibility note: existing users who copied `sdd/` can continue; new users use skill model

## Commands to Implement

```bash
# Installation (future npm package)
npm i -D opensdd   # or: pip install opensdd, or: download CLI binary

# Usage
opensdd kickoff api          # 3 questions, generates SpecSet
opensdd kickoff api --framework fastapi  # skip questions, use FastAPI
opensdd phase 1              # continue from last kickoff
opensdd status               # display roadmap status table

# Example flow
$ opensdd kickoff
? What is your project's language/framework? Node.js + Express
✅ Detected: Node.js + Express
✅ Created specs/my-api/ with mission, tech-stack, roadmap, Phase 1 skeleton
$ code specs/my-api/       # user's editor opens their SpecSet
$ opensdd phase 1          # continue implementation
```

## QA Checklist

- [ ] CLI installs and `opensdd --help` documents 3 subcommands
- [ ] `opensdd kickoff` asks 2-3 questions, generates SpecSet
- [ ] Generated SpecSet has all 6 required files, zero `sdd/` entries
- [ ] `sdd/` genericity sweep unchanged
- [ ] `opensdd phase 1` generates next phase skeleton
- [ ] `opensdd status` reads and displays roadmap table
- [ ] Error handling for missing/cmd arguments
- [ ] User can run full cycle without ever copying `sdd/`
- [ ] Documentation mentions "you don't need to copy sdd/"
- [ ] Error messages are helpful and actionable

## Independent Verification Steps

1. **Install**: `npm i -D opensdd` (or equivalent path); verify `opensdd --help`
2. **Kickoff**: `opensdd kickoff api`; observe 3 questions; verify SpecSet generated
3. **Zero `sdd/` check**: `cd /tmp/test-project; git init; opensdd kickoff api; git ls-files | grep sdd` → should return nothing
4. **Genericity**: `cd /tmp; grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` → zero hits
5. **Phase**: `opensdd phase 1`; verify next phase skeleton generated
6. **Status**: `opensdd status`; verify roadmap table displayed
5. **Full cycle review**: User runs kickoff → phase 1 → validate → merge, noting no `sdd/` copying needed
<tool_call>