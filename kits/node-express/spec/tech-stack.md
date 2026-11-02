# Node.js API — Tech Stack

## Application

| Layer | Technology |
|---|---|
| Framework | Express |
| Language | JavaScript (ES2024) |
| Build | npm |
| Lint | biomes |
| Testing | vitest |
| Backend | PostgreSQL |

## Conventions

- Route handlers return `{ status, data }` shape
- Validation errors have `{ code, message, }` shape
- All routes documented for OpenAPI generation
- Tests born with the behavior (within task groups)
EOF