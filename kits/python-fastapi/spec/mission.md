# Python API — Mission

## Purpose
Delivers a production-ready Python API SpecSet with FastAPI, Pydantic validation, and pytest testing. It proves that the OpenSDD toolkit can be adopted by any team with any AI coding assistant, requiring zero framework-specific knowledge in the initial setup.

Core value proposition: **Spec-Driven Development as a copyable, AI-agnostic toolkit that produces complete SpecSets from pre-configured kits.**

## Problem Statement
Teams starting Python API projects waste time debating request/response formats, validation libraries, and testing setups. Without a standardized starting point, every new API requires decisions about framework, validation, and testing that could be predefined.

## Solution
The target behavior is an API server that accepts JSON requests, validates them with Pydantic models, processes the business logic, and returns validated responses. The feature branches into two paths: (1) a validation failure path that returns structured error objects, and (2) a successful path that returns the created/updated resource.

```
API Server → validates Pydantic model → processes business logic → returns response
```

## Core Principles
1. **AI-agnostic by design** — No integration is first-class. Every guide, template, and script works when followed by a human, by Claude, by OpenAI models, by Copilot, or by any future assistant.
2. **Simplicity is the feature** — Every addition is weighed against a zero-dependency, kit-baseline. Kits earn their place only by materially lowering adoption friction.
3. **Dogfood or discard** — The toolkit is developed using itself. Every improvement is discovered by running the cycle, not by speculation.
4. **Battle-tested content, minimal packaging** — The intellectual content (stages, templates, status vocabulary) comes from verified SpecSets. Kits are deliberately thin and removable — a team can discard every kit and still have a complete method.
5. **Degradation is expected, never fatal** — Any layer can fail or be absent: no scripts → follow guides manually; no CLI → use scaffold.sh → copy kits; no example → the kits carry inline guidance. Every layer's absence degrades to the layer below, ending at "read the guides and write the files yourself."

## Scope
**In scope:**
- Python API SpecSet with FastAPI framework
- Pydantic-based request validation
- pytest-powered test suite
- OpenAPI-ready route definitions
- The entire OpenSDD cycle (stages 01–05) as documented in `sdd/`

**Out of scope (already delivered / owned elsewhere):**
- Actual server deployment (the API SpecSet is a specification artifact, not a deployment target)
- Database schema design (migrations owned elsewhere)
- CI workflows, issue templates, PR templates (nice-to-have; deferred)

**Non-goals:**
- Competing on feature count with other methodology kits — the differentiator is zero-weight adoption
- Enforcing a single methodology on teams — the kits describe a starting point; teams adapt it (their adaptations are their kits)
- Telemetry of any content, paths, or PII

## Degradation Table

| Failure | Behavior |
|---|---|
| Package install failure | Run `pip install` manually; ensure Python 3.10+ is available |
| Pydantic model mismatch | Check model definitions; ensure fields align with expected resource shape |