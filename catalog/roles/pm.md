# SDD Role — Product Manager

How a Product Manager uses the Spec-Driven Development cycle.

## Preferred Entry Point

Start at **Stage 01 — Kickoff & Alignment** (`sdd/01-kickoff-and-alignment.md`).
Use the grouped questions to scope the feature area with stakeholders before any
files are written.

## Typical Roadmap for a PM

| Phase | Focus | Key Deliverables |
|---|---|---|
| 01 — Kickoff & Alignment | Scope & alignment | Feature brief, stakeholder questions answered, alignment confirmed |
| 02 — Constitution | Mission & plan | `mission.md` (purpose, scope, principles), `tech-stack.md` (conventions), `roadmap.md` (phase order) |
| 03 — Phase Specs | Requirements & plan | `requirements.md` (scope, decisions, risks), `plan.md` (task groups, exit criteria), `validation.md` (checklist) |
| 04 — Implementation | Development | Task groups executed per `plan.md`; tests born with code; lint/green |
| 05 — Validation & Closeout | Verify & merge | Checklist 100% green; regression gates; merge; lessons learned |

## PM-Specific Tips

- **Use the decisions table** in `requirements.md` to capture tradeoffs (formats, caps, concurrency, UX states). This is the most valuable review surface — treat it as such.
- **Reference the degradation table** in `mission.md` when discussing failure modes with engineering. The vocabulary is shared and AI-agnostic.
- **Roadmap status tracking**: The per-phase marker (`⬜ / 🔨 / ✅`) AND the status table row in `roadmap.md` must both be updated. Neither is authoritative alone.
- **Spec before code**: Never begin implementation until the relevant spec files exist and the stakeholder has approved them. This is the golden rule.

## When to Escalate

- If the scope creeps beyond what one SpecSet can realistically deliver, create a new SpecSet
  rather than bloating the existing one.
- If a decisions-table item cannot be resolved in conversation, bring it to the stakeholder
  with evidence and a recommendation — but never remove the stakeholder's choice.