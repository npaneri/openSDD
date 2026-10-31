# Greeting Widget — Minimal SpecSet: Tech Stack

## Application

| Layer | Technology |
|---|---|
| Framework | None (plain HTML/JS) |
| Build | None |
| Language | JavaScript (ES2024) |
| Lint | None |
| Testing | None |
| Backend | None |

## Relevant Existing Components

- No existing components are touched; the greeting widget is a new addition.

## Target Addition(s)

| Decision | Choice | Rationale |
|---|---|---|
| Widget name | `GreetingWidget` | Universally understood; no domain jargon |
| Greeting format | `Hello, Alice!` | Simple, positive, universally understood |
| Render failure mode | Plain-text fallback | Zero-dependency; works without CSS or frameworks |

## Conventions

- Markdown files use CommonMark compliance.
- File names are lowercase kebab-case where possible.
- All spec files follow the stage-guide anatomy from `sdd/02-constitution.md` and `sdd/03-phase-specs.md`.
- The degradation table (mission.md) uses the exact vocabulary: "Widget render failure → Show plain-text fallback".

## Notes

- This tech stack is intentionally generic; it proves the templates work for any stack without implying OpenSDD has stack opinions.
- No build steps, no test frameworks, no lint rules are needed for this toy feature.