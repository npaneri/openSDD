# Idea Assessment — OpenSDD Extension Template

An optional extension template inspired by Spec Kit's bundled processes, adapted to
OpenSDD's zero-weight philosophy. This template deliberately does not introduce a
new cycle stage — it slots into a team's existing flow as needed.

## Idea → Evidence → Go/Clarify/Stop Decision

### Idea

- **What is the new idea, feature, or improvement being considered?**
- **Who proposed it?** (team member, stakeholder, AI assistant, customer)
- **Why is it being suggested?** (problem it solves, value it adds, use case)

### Evidence

- **User feedback:** (quotes, feature requests, support tickets, interview notes)
- **Use cases:** (specific scenarios where the idea would provide value)
- **Benchmark data:** (if available, metrics or measurements that support the idea)
- **Market/industry context:** (if applicable, how similar features are implemented elsewhere)
- **Technical feasibility notes:** (preliminary assessments of effort, complexity, risks)

### Go/Clarify/Stop Decision

| Decision | Criteria |
|---|---|
| **Go** | Conditions under which the idea should be pursued. Include concrete criteria such as: user demand threshold, alignment with mission, estimated effort < X person-days, technical feasibility confirmed, no showstopper risks. |
| **Clarify** | Open questions or ambiguities that need resolution before making a go/stop decision. List each question and note who is responsible for answering it, and by when. |
| **Stop** | Conditions under which the idea should be explicitly declined. Include "deal-breaker" criteria such as: conflicts with mission, disproportionate effort (> Y person-days), technical impossibility, lower-priority work preempts it, existing roadmap items take precedence. |

## Usage

1. Copy this template into `sdd/templates/` (or `extensions/` for team-specific variants):
   ```sh
   cp sdd/templates/idea-assessment.template.md sdd/templates/idea-assessment-featurex.template.md
   ```

2. Customize the content for the specific idea being assessed.

3. The completed template can be:
   - Included as part of a phase's `requirements.md` Decisions table
   - Referenced from `validation.md` as evidence of thoughtful evaluation
   - Archived for future reference, or dropped if the idea is not pursued

4. No loader or registry exists — the template is discovered by reading `sdd/templates/`.

## Notes

- This template is entirely optional. Teams that do not need idea assessment
  can ignore it without affecting the core SDD cycle.
- The template follows OpenSDD's conventions: Markdown-only, no framework names,
  no tool-specific syntax. It works with any AI assistant when invoked by filename.
- The "Go/Clarify/Stop" framework provides a clear, binary-decision structure that
  teams can adopt quickly.
- This template complements (but does not replace) the core SDD stages 01–05.
- The Decisions table in the filled template can be copied directly into a
  phase's `requirements.md` if the idea is approved (Go decision).