# Phase 10 — Validation

## Definition of Done

1. `SKILL.md` routes all five stage requests; tool-neutral prose only.
2. `docs/integrations.md` covers every Phase 4 matrix row with setup steps; cross-linked with the matrix.
3. Full closeout regression green: genericity sweep, `sh -n`, functional spot checks, link resolution.
4. All 10 roadmap phases ✅; mission In-scope items delivered or deferrals recorded.
5. VERSION 1.0.0; CHANGELOG entry; release commit landed.

## Verification Checklist

### SKILL.md + integrations

| # | Check | Expected | Status |
|---|---|---|---|
| 10a | SKILL.md five stages | Paths + when-to-use, agent-routable | |
| 10b | Invocation contract | "Read guide before acting; follow exit criteria" present | |
| 10c | Tool-neutral | No tool-specific syntax in SKILL.md | |
| 10d | No content mirroring | SKILL.md routes; does not summarize guide content | |
| 10e | integrations.md coverage | Every matrix row has a setup path | |
| 10f | Cross-links | Both docs link each other; no duplication | |

### Closeout regression

| # | Check | Expected | Status |
|---|---|---|---|
| 10g | Genericity sweep (`sdd/`) | Zero hits | |
| 10h | `sh -n` scaffold.sh + bin/sdd | Both clean | |
| 10i | Scaffold spot check | specset + phase work on temp dir | |
| 10j | `sdd status` | All 10 phases listed with statuses | |
| 10k | Telemetry opt-outs | Still honored (one spot check) | |
| 10l | Link resolution | Extension index, catalog, docs cross-links resolve | |
| 10m | Roadmap statuses | All 10 phases ✅ | |
| 10n | Mission re-check | In-scope delivered; deferrals recorded | |
| 10o | VERSION | 1.0.0 | |
| 10p | CHANGELOG | 1.0.0 entry with stability wording | |
| 10q | Release commit | Landed; closeout notes record FluidChartApp-copy follow-up | |

## Merge Criteria

- Checklist 100% green with real outcomes recorded.
- SpecSet-1 complete: repo is release-ready for GitHub publication (manual post-SpecSet action).
- Follow-up recorded: retire FluidChartApp `specs/sdd/` copy when its SpecSet-2 closes (decision #6).
