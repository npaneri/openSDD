# Cross-Repo Store Guidance — OpenSDD shared-spec patterns

OpenSDD documents three adoption patterns for shared-spec repos — one spec store,
many code repos — delivered as guidance, not infrastructure. Explicitly not hosted,
not beta, not a service.

## Three Adoption Patterns

### Pattern 1: Git Subtree — One Repo to Rule Them All

**When it fits:**
- You control all code repos and can coordinate subtree merges.
- You want a single source of truth for specs that is automatically propagated.
- Your team is comfortable with git subtree workflows.

**How it works:**
1. Add the OpenSDD spec repo as a remote: `git remote add -f spec-store <url>`
2. Pull the specs into a subtree: `git subtree add --prefix specs/sdd spec-store main`
3. Whenever the spec store updates: `git subtree pull --prefix specs/sdd spec-store main`
4. Your code repos have `specs/sdd/` with the latest spec content automatically.

**SDD cycle across the boundary:**
- Read specs from `specs/sdd/` just like any local SpecSet — no difference in the cycle.
- Write new SpecSets or phases using the normal `sdd/01 → sdd/02 → sdd/03` flow.
- After committing, run `git subtree push` to propagate the new spec to the store repo.

**Pros:** Single source of truth; automatic propagation; works with the full SDD cycle.
**Cons:** Requires coordinated git workflow across all repos; merge conflicts in the subtree can block propagation.

---

### Pattern 2: Mono-Repo Specs Folder — Shared Within One Organization

**When it fits:**
- Multiple code repos exist within the same organization.
- You want a shared `specs/` folder accessible to all repos via git subtree or symlink.
- You don't need a separate repo — the specs live alongside the code.

**How it works:**
1. Create a centralized `org-specs/` repo (or use an existing mono-repo).
2. Add `specs/` to each code repo via git subtree subtree split or as a symlink.
3. Each code repo has its own `specs/` directory with the shared content.

**SDD cycle across the boundary:**
- Read specs from the shared `specs/` directory — the cycle is identical to a local SpecSet.
- Write new SpecSets or phases in the shared folder; all consuming repos see the update
  (via subtree or symlink refresh).
- No separate "store" repo — the shared folder is the store.

**Pros:** Simple; no separate repo needed; works well for org-wide adoption.
**Cons:** Requires organizational coordination; not ideal if repos are independently managed;
  subtree conflicts can occur.

---

### Pattern 3: Separate Store Repo with Pointer Files — Decoupled, Read-Only

**When it fits:**
- Repos are independently managed (different teams, different update cycles).
- You want a canonical spec source without imposing git workflows on code repos.
- The specs are effectively read-only for most code repos — only a designated team writes them.

**How it works:**
1. A dedicated "spec store" repo contains the canonical specs.
2. Each code repo includes a pointer file (e.g., `SPEC_VERSION`, `SPEC_COMMIT`, or `.spec-ptr`)
   that references the exact commit in the store repo.
3. To update specs: read the pointer, fetch the referenced commit from the store repo,
   and update the pointer.

**SDD cycle across the boundary:**
- Read specs from `specs/<PointerName>/` — the cycle is identical to a local SpecSet.
- When it's time to update specs, follow the repo's pointer-update procedure.
- New SpecSets or phases are developed in the store repo; code repos consume the updated
  specs by fetching the new commit.

**Pros:** Fully decoupled; code repos are not burdened with git workflows for specs;
  clear ownership (the store repo team writes specs, code repo teams consume them).
**Cons:** Not real-time — there is a delay between store update and code repo consumption;
  pointer management overhead; read-only for most consumers.

## Pattern Comparison

| Pattern | Best For | Decoupling | Real-time Updates | Git Expertise Required |
|---|---|---|---|---|
| Subtree | One team controlling all repos | Low | Yes (on push) | High |
| Mono-Repo | Org-wide shared within one org | Medium | Yes (on pull) | Medium |
| Pointer Files | Independently managed repos | High | No (delayed) | Low |

## How the SDD Cycle Reads/Writes Across the Boundary

**Reading (consuming a shared spec):**
1. The SDD cycle starts the same way — `sdd/01-kickoff-and-alignment.md` → constitution from
   the shared `specs/` directory.
2. Every stage guide (`sdd/02`, `sdd/03`, `sdd/04`, `sdd/05`) reads spec files from the
   same paths — `specs/<SpecSetName>/mission.md`, etc. — regardless of whether they
   are local or fetched from a store.
3. The genericity sweep on `sdd/` still applies — no framework/tool names in the guides.

**Writing (creating a new spec that propagates):**
1. After committing a new SpecSet or phase to a code repo, the propagation method
   depends on the pattern:
   - **Subtree:** `git subtree push` propagates to the store repo.
   - **Mono-Repo:** The update is already in the shared folder; all consumers see it.
   - **Pointer Files:** Update the pointer file to reference the new commit; the designatd
     team fetches the new spec into the store repo.
2. The key invariant: the spec files (`mission.md`, `tech-stack.md`, `roadmap.md`,
   `requirements.md`, `plan.md`, `validation.md`) are always in the same format,
   regardless of where they physically live.

## Anti-Patterns

- **Treating the store as a hosted service.** OpenSDD explicitly does not host specs,
  provide a web dashboard, or offer a cloud API. The store pattern is documented as a
  pattern, never a service.
- **Assuming real-time consistency across independently managed repos.** Pointer-file
  patterns inherently have delay; subtitle patterns can have merge conflicts. Build this
  expectation into your team's workflow.
- **Writing project-specific code that reads the store directly.** The SDD cycle should
  always read from the local `specs/` path. If a code repo needs to fetch from a store,
  that logic lives outside the SDD cycle (in your CI or tooling), not inside `sdd/`.

## Getting Started — Minimal Setup (Pattern 2: Mono-Repo)

If you want to start with the simplest pattern today:

1. Create a centralized specs repo: `git init --bare org-specs.git` (or use an existing repo).
2. In each code repo, add the shared specs via subtree:
   ```sh
   git subtree add --prefix specs/sdd <org-repo-url> main
   ```
3. Start using the SDD cycle — read specs from `specs/sdd/` just like a local SpecSet.
4. When you want to update specs in all repos, run `git subtree pull` in each code repo.

## FAQ

**Q: Can I mix patterns?**
A: Yes. Some repos can use subtree, others can use pointer files. The patterns are
described as guidance, not rigid rules. Choose per-repo what fits your situation.

**Q: What if the store repo goes down?**
A. If you have a local copy of the specs (via subtree or clone), the repo is fully
functional offline. The pointer-file pattern relies on the store being available,
but the delay between updates means a temporary outage is not fatal.

**Q: Does OpenSDD plan to host a spec store?**
A. No. Decision #6 in the brainstorm explicitly defers distribution polish until after
content proves itself. Copy-the-folder is v1. Hosted stores, cloud services, or accounts
are out of scope (see mission.md and brainstorm_ideas.md).