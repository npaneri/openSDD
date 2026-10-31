# <Project> — <SpecSet Name>: Tech Stack

## Application

| Layer | Technology |
|---|---|
| Framework | <...> |
| Build | <...> |
| Language | <language + hard restriction, e.g. "plain JS — no TypeScript"> |
| Linting | <...> |
| Testing | <framework + critical usage rules> |
| Backend | <...> |

## Relevant Existing Components

### `<path/to/component>` — <role>

<Current behavior: the key methods, endpoints, or shapes the feature builds on. Evidence-based — read the code. Use tables where helpful.>

## Target Addition: <name>

| Aspect | Decision |
|---|---|
| Path / location | <...> |
| Shape | `<exact fields + types>` |
| Access | <who can read / write; validation guards> |
| Format | <caps and units, e.g. "≤ 500 entries, each ≤ 200 chars"> |

## Conventions (project hard rules)

- <language subset, e.g. "plain JS — no TypeScript">
- <test framework usage rule, e.g. "globals only; never import the framework in tests">
- <mocking rule, e.g. "all external services mocked; no network in unit tests">
- <import/style rules>
- <commit style>

## Notes

- <deviation from the request + reason — e.g. a referenced input that does not exist; flag it, do not invent it>
