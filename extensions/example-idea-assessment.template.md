# Idea Assessment — OpenSDD Extension Template

An optional extension template inspired by Spec Kit's bundled processes, adapted to
OpenSDD's zero-weight philosophy. This template slots into a team's existing flow
as needed — it is **not** a new cycle stage.

## Idea → Evidence → Go/Clarify/Stop Decision

| Section | Description |
|---|---|
| **Idea** | A brief description of the new idea, feature, or improvement being considered. |
| **Evidence** | Any existing data, user feedback, use cases, or benchmark results that support (or contradict) the idea. |
| **Go** | Conditions under which the idea should be pursued. Include concrete criteria such as: user demand threshold, technical feasibility, alignment with mission, estimated effort, etc. |
| **Clarify** | Open questions or ambiguities that need resolution before making a go/stop decision. List each question and note who is responsible for answering it. |
| **Stop** | Conditions under which the idea should be explicitly declined. Include "deal-breaker" criteria such as: conflicts with mission, disproportionate effort, technical impossibility, etc. |

## Usage

1. Copy this template into `extensions/` with a descriptive filename:
   ```sh
   cp extensions/example-idea-assessment.template.md extensions/feature-x.template.md
   ```

2. Customize the content for your feature or idea.

3. Register the extension in `extensions/README.md` by adding one line:
   ```
   feature-x.template.md | A template for assessing feature ideas specific to our domain
   ```

4. Use the template as a standalone assessment tool, or include it as part of
   a new phase's requirements when the team adopts it.

## Notes

- This template is entirely optional. Teams that do not need idea assessment
  can ignore it without affecting the core SDD cycle.
- The template follows OpenSDD's conventions: Markdown-only, no framework names,
  no tool-specific syntax. It works with any AI assistant when invoked by filename.
- No loader or registry exists — discovery is always by reading the index.