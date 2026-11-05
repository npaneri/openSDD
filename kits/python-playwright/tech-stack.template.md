# <Project> — <SpecSet Name>: Tech Stack

## Application

| Layer | Technology |
|---|---|
| Content | Pure Markdown (CommonMark-compatible) |
| Framework | Playwright (Python) |
| Language | Python |
| Build | pip/uv |
| Lint | ruff |
| Test | pytest + pytest-playwright |
| Backend | None (browser automation) |

## Relevant Existing Components

### Browser Automation Setup

- **Current state**: Describe existing browser automation, if any (scripts, test frameworks, CI configuration).
- **Target additions**: New selectors, pages, or automation patterns this phase introduces.

## Target Addition(s)

| Aspect | Decision |
|---|---|
| Selectors | Use data-testid attributes where possible; avoid brittle XPath |
| Rate limiting | Implement per-action delays; respect X-RateLimit headers |
| Anti-detection | Rotate user-agent headers; manage cookie sessions |
| CAPTCHA handling | Define fallback behavior on CAPTCHA detection |

## Conventions

- Use page object pattern for DOM element encapsulation
- Implement session management with cookie persistence
- Add human-like delays between actions (`time.sleep(1 + random())`)
- Log all automation actions for debugging and audit trails

## Notes

- Degradation table for failure modes see `mission.md` Core Principles
- Ethical guardrails defined in `mission.md` Core Principles section 1-5