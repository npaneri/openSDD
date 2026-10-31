# OpenSDD — SpecSet-1 Roadmap

## Philosophy

**Very small phases.** Each phase is a single, focused change that can be implemented, tested, and verified independently. A phase is complete when:

1. The change is implemented
2. `sh -n` syntax check passes for any shell script touched (no shellcheck dependency required)
3. The genericity sweep on `sdd/` still returns zero hits for project/tool framework names
4. The new artifact works when followed by a human OR any AI assistant (no tool-specific dependency)
5. The dogfooding requirement holds: nothing added contradicts the stage guides in `sdd/`

**Basis**: settled `brainstorm_ideas.md` (all 6 decisions adopted 2026-10-31) + the OpenSpec/Spec-Kit repository study recorded in the phase requirements. No TODO.md exists or is needed.

## Phase Order

Ten sequential phases, ordered by dependency. Each phase has a dated spec directory under this SpecSet with `requirements.md`, `plan.md`, and `validation.md`.

| Phase | Feature | Spec directory | Status |
|---|---|---|---|
| 1 | Repo scaffolding (README, LICENSE, git init) | `2026-10-31-1-repo-scaffolding/` | ⬜ SPEC COMPLETE — not started |
| 2 | Minimal example SpecSet (template proof) | `2026-10-31-2-minimal-example/` | ⬜ SPEC COMPLETE — not started |
| 3 | `scaffold.sh` scaffolding script | `2026-10-31-3-scaffold-script/` | ⬜ SPEC COMPLETE — not started |
| 4 | AI-compatibility documentation | `2026-10-31-4-ai-compatibility/` | ⬜ SPEC COMPLETE — not started |
| 5 | Extensions mechanism | `2026-10-31-5-extensions-mechanism/` | ⬜ SPEC COMPLETE — not started |
| 6 | Bug-fix + idea-assessment templates | `2026-10-31-6-bug-idea-templates/` | ⬜ SPEC COMPLETE — not started |
| 7 | Terminology alignment + catalog/role configs | `2026-10-31-7-terminology-catalog/` | ⬜ SPEC COMPLETE — not started |
| 8 | Minimal `sdd` CLI wrapper | `2026-10-31-8-cli-wrapper/` | ⬜ SPEC COMPLETE — not started |
| 9 | Cross-repo store guidance | `2026-10-31-9-stores-guidance/` | ⬜ SPEC COMPLETE — not started |
| 10 | Agent-skill wrapper + integrations + closeout | `2026-10-31-10-skill-integrations-closeout/` | ⬜ SPEC COMPLETE — not started |

Status vocabulary: `⬜ SPEC COMPLETE — not started` → `🔨 IN PROGRESS` → `✅ COMPLETE` (checklist filled in `validation.md`, committed).

---

## Phase 1: Repo Scaffolding

**Status**: ⬜ SPEC COMPLETE — not started

Establish the repository as a publishable open-source project: top-level `README.md` (what/why/quick-start), MIT `LICENSE`, `.gitignore` (`.DS_Store`, editor droppings), `CHANGELOG.md` seeded at `0.1.0`, `git init` + initial commit. The top-level README is the front door — a visitor must understand OpenSDD and reach the toolkit in under a minute.

**Files**: `README.md`, `LICENSE`, `.gitignore`, `CHANGELOG.md`
**Test**: Fresh-clone readability check; genericity sweep on `sdd/` unchanged.
**Dependencies**: None.

---

## Phase 2: Minimal Example SpecSet

**Status**: ⬜ SPEC COMPLETE — not started

Build `examples/minimal-specset/` — a complete, toy SpecSet (constitution + one phase spec) written **only** from `sdd/templates/`, with placeholder content replaced by a tiny universal feature (e.g., a "greeting widget"). Proves template self-sufficiency, gives adopters a worked example, and exercises every template end-to-end. Includes a short `examples/README.md` explaining what the example demonstrates.

**Files**: `examples/README.md`, `examples/minimal-specset/` (constitution ×3 + one phase dir ×3)
**Test**: Every template file has exactly one corresponding filled example file; no template placeholder (`<...>`) remains unfilled; a newcomer can trace stage guide → template → example.
**Dependencies**: Phase 1.

---

## Phase 3: `scaffold.sh` Scaffolding Script

**Status**: ⬜ SPEC COMPLETE — not started

Zero-dependency POSIX shell script at `scripts/scaffold.sh` automating adoption: `scaffold.sh specset <name>` creates a SpecSet folder with the three constitution files from templates; `scaffold.sh phase <specset> <N> <slug>` creates a dated phase directory with the three phase files. Interactively prompts for placeholders (or accepts flags); fails loudly when templates are missing. Lowers adoption friction from "copy 12 files and edit" to "run one command."

**Files**: `scripts/scaffold.sh`
**Test**: `sh -n` clean; dry-run on a temp dir produces byte-valid structure from the real templates; missing-template case exits non-zero with a clear message.
**Dependencies**: Phase 2 (example validates the templates the script copies).

---

## Phase 4: AI-Compatibility Documentation

**Status**: ⬜ SPEC COMPLETE — not started

`docs/ai-compatibility.md`: the explicit "works with any AI" story — a tool matrix (Claude, OpenAI/ChatGPT, Copilot, Gemini, Cursor, Codex, Amazon Q, etc.) mapping each tool's invocation syntax to the five stages, guidance on context hygiene per session shape, and the degradation ladder (no tool support → paste guides → read manually). This codifies our core differentiator: AI-agnostic-by-design, versus rivals' toolchain optimization.

**Files**: `docs/ai-compatibility.md`, README link
**Test**: Every stage reachable from every listed tool via documented syntax; no tool-specific syntax inside `sdd/` itself (sweep).
**Dependencies**: Phase 1.

---

## Phase 5: Extensions Mechanism

**Status**: ⬜ SPEC COMPLETE — not started

Adopt the strongest idea from Spec Kit — extensibility — at zero framework cost. `extensions/README.md` defines the convention: an extension = one Markdown file (a phase type, a gate, a template variant) + one index line. Includes one worked example extension. No loader, no code, no registry — discovery is reading the index. Teams customize the cycle without forking `sdd/`.

**Files**: `extensions/README.md`, `extensions/example-<something>.md`
**Test**: A team following the README can add an extension using only a text editor; core `sdd/` untouched.
**Dependencies**: Phase 2.

---

## Phase 6: Bug-Fix + Idea-Assessment Templates

**Status**: ⬜ SPEC COMPLETE — not started

Two optional extension templates inspired by Spec Kit's bundled processes, adapted to OpenSDD's zero-weight philosophy: `templates/bug-fix.template.md` (symptom → cause assessment → scoped fix → verification record) and `templates/idea-assessment.template.md` (idea → evidence → go/clarify/stop decision). Deliberately single-file processes, not new cycle stages — they slot into a team's existing flow as needed.

**Files**: `templates/bug-fix.template.md`, `templates/idea-assessment.template.md`, extension index entries
**Test**: Each template fills cleanly for the worked bug/idea scenarios; no claim in docs implies they are mandatory stages.
**Dependencies**: Phase 5.

---

## Phase 7: Terminology Alignment + Catalog / Role Configs

**Status**: ⬜ SPEC COMPLETE — not started

Two alignment moves from the rival-repo study. (a) Terminology pass: verify OpenSDD vocabulary (constitution, phase, task group, checklist, decisions table) matches broader SDD community usage; adjust glossary where divergence creates friction for adopters coming from OpenSpec/Spec Kit. (b) `catalog/` with `roles/` — phase-cycle variants for common roles (PM, developer, QA, architect), adopted from Spec Kit's bundle idea but delivered as readable Markdown configs, not installable packages.

**Files**: `sdd/README.md` (glossary adjustments if any), `catalog/README.md`, `catalog/roles/*.md`
**Test**: Glossary cross-references verified; each role file is a self-contained "how this role uses the cycle" guide readable without tooling.
**Dependencies**: Phase 2.

---

## Phase 8: Minimal `sdd` CLI Wrapper

**Status**: ⬜ SPEC COMPLETE — not started

`bin/sdd` — a thin POSIX shell entry point wrapping scaffold.sh: `sdd init` (new SpecSet), `sdd phase` (new phase dir), `sdd status` (parse the roadmap status table, print the phase list). Honors `--no-telemetry` / `OPENSDD_TELEMETRY=0` / `DO_NOT_TRACK=1`; when telemetry is on, counts command names + version only (never paths/args/content), off by default in CI. The CLI is the *optional* layer — every subcommand has a documented manual/script fallback.

**Files**: `bin/sdd`, README install note
**Test**: `sh -n` clean; all three subcommands work on a temp dir; telemetry-disabled envs verified via a stub counter; degradation documented and true (no CLI → scaffold.sh → manual).
**Dependencies**: Phase 3.

---

## Phase 9: Cross-Repo Store Guidance

**Status**: ⬜ SPEC COMPLETE — not started

`docs/stores.md`: the cross-repo shared-spec concept from OpenSpec — one spec store, many code repos — delivered as guidance, not infrastructure. Documents three adoption patterns (git subtree, mono-repo specs folder, separate store repo with pointer files), when each fits, and how the SDD cycle reads/writes across the boundary. Explicitly not hosted, not beta, not a service.

**Files**: `docs/stores.md`, README link
**Test**: Each pattern is executable by a competent git user without OpenSDD-specific tooling; scenario walkthrough included.
**Dependencies**: Phase 1.

---

## Phase 10: Agent-Skill Wrapper + Integrations + SpecSet Closeout

**Status**: ⬜ SPEC COMPLETE — not started

The additive agent layer (decision #4): `SKILL.md` at repo root — tool-agnostic prose naming the five stages as invocable resources, so any skill-aware agent (OpenCode, Claude Code, Codex, Copilot) can auto-drive the cycle. `docs/integrations.md` consolidates per-tool invocation syntax (complementing Phase 4's matrix with concrete setup steps). Then SpecSet-1 closeout: full regression sweep, all roadmap statuses ✅, version bump to `1.0.0` (methodology proven across three SpecSets), CHANGELOG, final release commit.

**Files**: `SKILL.md`, `docs/integrations.md`, `CHANGELOG.md`, `specs/.../validation.md` (results)
**Test**: A skill-aware agent reading only `SKILL.md` can locate and follow the correct stage; closeout checklist 100% green.
**Dependencies**: Phases 1–9.
