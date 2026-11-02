# Python FastAPI Kit

## Description
A complete SpecSet starter for Python + FastAPI projects with Pydantic validation and pytest testing.

## Tech Stack
- **Framework**: FastAPI
- **Language**: Python
- **Build**: pip/poetry
- **Lint**: ruff
- **Testing**: pytest
- **Backend**: PostgreSQL

## Installation
```bash
opensdd kit install python-fastapi
# or: npx opensdd kit install python-fastapi
```

## Generated SpecSet Structure
After running the install command, your project will have:
- `specs/<project-name>/mission.md` — API description
- `specs/<project-name>/tech-stack.md` — FastAPI + Pydantic pre-configured
- `specs/<project-name>/roadmap.md` — Phase 1 defined
- `specs/<project-name>/2026-11-02-1-core-endpoints/requirements.md` — Core endpoint requirements
- `specs/<project-name>/2026-11-02-1-core-endpoints/plan.md` — Phase 1 task groups
- `specs/<project-name>/2026-11-02-1-core-endpoints/validation.md` — Phase 1 validation

## Customization
- Edit `tech-stack.md` to match your exact stack
- Modify Phase 1 task groups in `plan.md` for your features
- Add new phases following the OpenSDD discipline in `sdd/`

## Kit Version
0.1.0 — Initial release. Follow SpecSet-1 discipline for phase management.