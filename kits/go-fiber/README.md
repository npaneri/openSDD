# Go Fiber Kit

## Description
A complete SpecSet starter for Go + Fiber projects with testify validation.

## Tech Stack
- **Framework**: Fiber
- **Language**: Go
- **Build**: go mod
- **Lint**: staticcheck
- **Testing**: testify
- **Backend**: PostgreSQL

## Installation
```bash
opensdd kit install go-fiber
# or: npx opensdd kit install go-fiber
```

## Generated SpecSet Structure
After running the install command, your project will have:
- `specs/<project-name>/mission.md` — API description
- `specs/<project-name>/tech-stack.md` — Fiber + testify pre-configured
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