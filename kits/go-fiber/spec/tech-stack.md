# Go API — Tech Stack

## Application

| Layer | Technology |
|---|---|
| Framework | Fiber |
| Language | Go 1.22+ |
| Build | go mod |
| Lint | staticcheck |
| Testing | testify |
| Backend | PostgreSQL |

## Conventions

- Route handlers return `{"status": "ok"}` shape
- Testify assertions use `require()` or `assert()` matchers
- All routes documented via `fiber.Middleware(func(c *fiber.Context) error {})`
- Tests born with the behavior (within task groups)
EOF