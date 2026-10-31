# Stage 04 — Implementation & Testing

**When**: A phase's spec files exist and are approved.
**Goal**: Working, tested code that satisfies every plan task group and every checklist expectation — in small, auditable commits.

## Preconditions

- [ ] Phase spec directory complete (requirements / plan / validation)
- [ ] Stakeholder approved (per the stage-01 flow answer)
- [ ] Roadmap status → `🔨 IN PROGRESS`
- [ ] Project environment ready (per tech-stack.md: dependencies installed, local services running, etc.)

## Working order

1. Execute task groups **in plan order**. Each group's exit criteria is a gate — do not start the next group until it passes.
2. Follow the requirements' Decisions table literally. It is the approved contract; creative deviations are spec changes (see *Escaping the spec* below).
3. Match the project's code conventions exactly (tech-stack.md): language subset, quoting, imports, style.

## Testing discipline

- **Tests are born with the behavior.** Each task group writes its tests in the same group. The spec's "Test" line in the roadmap and the validation checklist together are the behavior contract.
- **Deterministic and isolated.** External services (network, databases, clocks) are mocked or faked per the project's mock conventions; the unit suite must run with no secrets and no network.
- **Test the contract, not the implementation.** Every Decisions-table item with observable behavior gets a test — or, if it is genuinely manual-only, a recorded manual check in the validation checklist.
- **Integration/emulator tests** (where the project has them) cover only what units cannot (e.g. security rules, real service round-trips); they run under their own gate command.
- **Protect the baseline.** Note the pre-change test count; after the phase the count must be ≥ baseline (new tests added, none silently lost).

## Escaping the spec

Implementation sometimes proves a spec wrong. When it does:

1. STOP coding the affected part.
2. Amend the phase's spec files (and the constitution, if a contract changes) with a brief note on why.
3. Get stakeholder sign-off if the change alters scope or a Decisions-table entry.
4. Then implement the amended plan.

Silent divergence between spec and code is the one unforgivable sin of this method — the specs are the merge contract.

## Commit hygiene

- Small commits: per task group (preferred) or per phase — follow the project's convention.
- Message style: `<type>(<scope>): <what> (Phase <N>, <SpecSet>)`, with a body explaining *why* when non-obvious.
- Never commit artifacts the project excludes (build outputs, local service directories, secrets — check tech-stack.md / the project's agent instructions).

## Phase implementation exit criteria

- [ ] All task groups pass their exit criteria
- [ ] Project gates green: lint, full test suite, and any project-specific gates — commands from tech-stack.md
- [ ] New/changed behavior covered; baseline test count not reduced
- [ ] Commits landed; ready for stage 05 validation
