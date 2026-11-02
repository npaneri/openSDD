# Python API — Tech Stack

## Application

| Layer | Technology |
|---|---|
| Framework | FastAPI |
| Language | Python 3.11+ |
| Build | pip/poetry |
| Lint | ruff |
| Testing | pytest |
| Backend | PostgreSQL |

## Conventions

- Route handlers return `{"status": "ok", "data": {}}` shape
- Validation errors have `{ "errors": [{ "loc": [], "msg": "", "type": "" }] }` shape
- All routes documented for OpenAPI generation via `fastapi.openapi()`
- Tests born with the behavior (within task groups)
EOF