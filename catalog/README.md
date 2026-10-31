# Catalog — Role-based phase-cycle variants

The `catalog/` folder contains phase-cycle variants for common roles. Each file is a
self-contained "how this role uses the SDD cycle" guide, readable without tooling.
No loader, no code, no registry — discovery is by reading.

## Available role variants

| Role | File | Description |
|---|---|---|
| PM (Product Manager) | `catalog/roles/pm.md` | Focuses on scope, priorities, and roadmap alignment |
| Developer | `catalog/roles/developer.md` | Focuses on implementation, task groups, and code quality |
| QA (Quality Assurance) | `catalog/roles/qa.md` | Focuses on testing, validation checklists, and acceptance criteria |
| Architect | `catalog/roles/architect.md` | Focuses on design, degradation tables, and system boundaries |
| Your Role | `catalog/roles/<role>.md` | Add a new role variant by copying an existing file and customizing |

## How to use a role variant

1. Copy the role file that matches your role (or create a new one):
   ```sh
   cp catalog/roles/pm.md catalog/roles/your-team-pm.md
   ```

2. Customize the content for your team's context. You may add, remove, or reorder
   sections. The role file format follows OpenSDD's conventions: Markdown-only,
   no framework names, no tool-specific syntax.

3. Reference the role guide when starting a new SpecSet or phase. For example,
   a PM might say: "Let's follow the PM role guide from `catalog/roles/pm.md`
   to scope this SpecSet."

4. No loading mechanism exists — the role guide is invoked by mentioning its
   filename or by copying it into the active SpecSet.

## Adding a new role variant

1. Copy an existing role file:
   ```sh
   cp catalog/roles/pm.md catalog/roles/new-role.md
   ```

2. Edit the content to suit your team's perspective. Keep the format as Markdown
   only, and avoid framework/tool names (the genericity sweep applies).

3. The new role file is immediately usable — no registry update, no loader
   configuration required. Discovery is always by reading the `catalog/` directory.

## Philosophy

- **Readable Markdown configs**, not installable packages. Variants are discovered
  by reading, not by tooling.
- **Zero framework cost** — each role file is a plain text file that any editor
  can open and customize.
- **Optional, not mandatory** — teams that do not need role-specific guidance
  can ignore the catalog without affecting the core SDD cycle.
- **Built from the same conventions** as the core `sdd/` guides, using the same
  Markdown style and terminology vocabulary.