# SpecSet-5 — Requirements: Publish, Docs, and Backward Compatibility

## Scope

Define the requirements for publishing the OpenSDD skill-based system, writing full documentation, and providing backward compatibility for existing users.

**In scope:**
- npm package skeleton (package.json, main entry point, scripts)
- Full documentation set (onboarding guide, CLI reference, kit docs, migration guide)
- Backward compatibility strategy for existing users who copied `sdd/`
- Changelog from 0.1.0 to 1.0.0
- Version bump to 1.0.0
- npm package publish process

**Out of scope:**
- Actual `npm publish` execution (dry-run sufficient; production publish is ops decision)
- Custom domain for npm registry
- Private npm package hosting

## Requirements

### 1. package.json

The package.json must include:
- `name`: `opensdd` (or scoped: `@org/opensdd`)
- `version`: `0.1.0` (will bump to `1.0.0` at release)
- `main`: `opensdd.js` or `opensdd.sh` entry point
- `bin`: `{"opensdd": "opensdd"}` for global install
- `description`: "Spec-Driven Development kit — skill-based onboarding, zero `sdd/` copying"
- `keywords`: ["spec-driven", "development", "methodology", "skill-based", "CLI"]
- `scripts`:
  - `build`: any build steps
  - `test`: any test steps
  - `prepare`: any prep steps for publish
  - `publish`: `npm publish` (this will be a `dry-run` in verification)
- `files`: list of files to include in the npm package (must include `opensdd`, `sdd/`, `specs/`, `README.md`, `CHANGELOG.md`, ` kits/` if applicable)
- `license`: `MIT`

### 2. Full Documentation Set

**A. Onboarding Guide** (max 300 words):
- "Install: `npm i -D opensdd`"
- "Kick off: `opensdd kit install node-express` (or `opensdd kickoff` with 3 questions)"
- "First SpecSet ready"
- "Continue: `opensdd phase 1`"
- "Check status: `opensdd status`"

**B. CLI Reference** (all subcommands):
- `opensdd kickoff` — 3 questions, auto-detection
- `opensdd kickoff --framework <name>` — skip questions
- `opensdd phase <N>` — next phase skeleton
- `opensdd status` — roadmap table
- `opensdd kit install <name>` — kit installation
- `opensdd kit list` — available kits

**C. Kit Documentation** (each kit's README, already created):
- node-express, python-fastapi, go-fiber

**D. Migration Guide**:
- "You don't need to copy `sdd/`"
- "Three access patterns: npm package, CLI, assistant"
- "Migration steps for existing users"
- "Version bump: 0.1.0 → 1.0.0"

### 3. Backward Compatibility Guide

Document for existing users who copied `sdd/` into their repos:
- "You don't need to remove `sdd/` — it continues to work"
- "New SpecSets should be generated via `opensdd kit install <name>`"
- "Old SpecSets in `specs/sdd/` continue to work unchanged"
- "New SpecSets go in `specs/<my-project>/`"
- "Version bump: 0.1.0 → 1.0.0"

### 3. Changelog (0.1.0 → 1.0.0)

Follow Keep a Changelog format. Must include:
- **Added**: Full SpecSet-1 closeout, skill-based model, 3 kits, CLI, zero `sdd/` model
- **Changed**: Version bump, migration guide, documentation
- **Deprecated**: Copying `sdd/` explicitly (documented as no longer needed but supported)
- **Fixed**: Any bugs from earlier specs
- **Security**: N/A

### 3. Version Bump

- Update `version` in `package.json` from `0.1.0` to `1.0.0`
- Update `CHANGELOG.md` from 0.1.0 closeout entry to 1.0.0 closeout entry
- Tag: `v1.0.0` (git tag)

## Success Criteria

- [ ] `package.json` complete with all required fields
- [ ] Onboarding guide (max 300 words) complete
- [ ] CLI reference complete (all subcommands documented)
- [ ] Migration guide complete (existing users)
- [ ] Changelog complete (0.1.0 → 1.0.0, Keep a Changelog format)
- [ ] Version bumped to 1.0.0 in package.json and CHANGELOG.md
- [ ] Backward compatibility guide complete
- [ ] `sdd/` genericity sweep still passes (verified independently)

## Risks

| Risk | Mitigation |
|---|---|
| Package publish failure | `npm publish --dry-run` first; have documentation ready |
| User confusion on migration | Clear, step-by-step guide with examples |
| Version confusion | Explicit: 0.x.y during dev, 1.0.0 at release; documented |
| Documentation too verbose | Onboarding guide max 300 words; link to full docs |

## Dependencies

- **SpecSet-1**: Closeout complete, version 1.0.0 concept ✅
- **SpecSet-2**: Skill-based model, zero `sdd/` ✅
- **SpecSet-3**: CLI prototype ✅
- **SpecSet-4**: Kit system ✅
- **sdd/ toolkit**: Genericity-verified ✅

## Verification

External verification should check:

1. **package.json**: Valid JSON with all required fields; version 0.1.0 (will bump to 1.0.0)
2. **Onboarding guide**: Max 300 words; covers install → kickoff → first SpecSet → phase → validate
3. **CLI reference**: All 5 subcommands documented (kickoff, phase, status, kit install, kit list)
4. **Migration guide**: Addresses existing `sdd/` users; provides 3 options (keep, migrate, side-by-side)
5. **Changelog**: Keep a Changelog format; 0.1.0 → 1.0.0; includes Added/Changed/Deprecated/Fixed sections
6. **Version bump**: package.json and CHANGELOG.md both bumped to 1.0.0
7. **Backward compatibility guide**: Complete; explains that `sdd/` continues to work

## Merge Criteria

- [ ] package.json complete with all required fields and version 0.1.0
- [ ] Onboarding guide complete (max 300 words)
- [ ] CLI reference complete (all 5 subcommands)
- [ ] Migration guide complete (existing users)
- [ ] Changelog complete (0.1.0 → 1.0.0, Keep a Changelog)
- [ ] Version bumped to 1.0.0 in package.json
- [ ] Backward compatibility guide complete
- [ ] `sdd/` genericity sweep verified independent of this SpecSet

## Independent Verification Steps

1. **package.json check**: Read the file; verify all required fields present; version is 0.1.0
2. **Onboarding guide check**: Read the guide; verify it's ≤300 words; verify it covers install → kickoff → SpecSet → phase → validate
3. **CLI reference check**: Read the CLI docs; verify all 5 subcommands documented with usage + description
4. **Migration guide check**: Read the guide; verify it addresses existing `sdd/` users; verify 3 options provided
5. **Changelog check**: Read the Changelog; verify Keep a Changelog format; verify 0.1.0 → 1.0.0 transition; verify Added/Changed/Deprecated/Fixed sections present
6. **Version bump check**: Verify package.json version changed from 0.1.0 to 1.0.0; verify CHANGELOG.md has 1.0.0 closeout entry
7. **sdd/ sweep**: Run `grep -rn "react|vite|vitest|npm|firebase|fluidchart|bridge|toon|jsx" sdd/` → zero hits