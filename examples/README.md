# Examples — Minimal SpecSet

**What this demonstrates**: A complete, toy SpecSet written purely from `sdd/templates/`, proving template self-sufficiency and giving adopters a worked example to study before authoring their own.

**Stage-guide → file mapping table**:

| Stage guide | Produced file(s) |
|---|---|
| `sdd/02-constitution.md` → `mission.md`, `tech-stack.md`, `roadmap.md` | Constitution (3 files) |
| `sdd/03-phase-specs.md` → `requirements.md`, `plan.md`, `validation.md` | Phase spec (3 files) |
| `sdd/01-kickoff-and-alignment.md` → kickoff discussion | Pre-conditions captured in mission.md Problem Statement |

**Use as a starting point**: Copy this `examples/minimal-specset/` folder as a template for your own SpecSet. Fill the placeholders per your feature, then run `scaffold.sh phase N slug` to add more phases.

**Framing**: This is a *syntax demo*, not an architecture model. It demonstrates that every token in every template can be replaced with real content. Your SpecSet will have different scope, decisions, and widget names — this example uses a "greeting widget" because it is universally understood and requires no domain knowledge.

**How to use**:
1. Copy `examples/minimal-specset/2026-01-01-1-greeting-widget/` to `specs/SpecSetName/YYYY-MM-DD-1-slug/`
2. Fill the three `*.md` files using the `sdd/templates/` as reference
3. Run `sh -n sdd/templates/` to verify no framework names leaked into content
4. Follow `sdd/01-kickoff-and-alignment.md` to start a new SpecSet for your feature