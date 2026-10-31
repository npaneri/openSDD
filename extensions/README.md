# Extensions — OpenSDD extension mechanism (zero framework cost)

OpenSDD adopts the extensibility concept from rival repos at zero framework cost.
An extension is a **single Markdown file** (a phase type, a gate, a template variant)
plus **one index line**. There is no loader, no code, no registry — discovery is
reading the index. Teams customize the cycle without forking `sdd/`.

## Convention

An extension consists of:

1. **One Markdown file** placed in `extensions/`. The filename determines its type:
   - `extensions/bug-fix.template.md` — a bug-fix assessment template
   - `extensions/idea-assessment.template.md` — an idea-evaluation template
   - `extensions/<name>.template.md` — any custom variant

2. **One index line** in `extensions/index.txt` (or the bottom of `README.md`):
   ```
   <filename> | <one-line description>
   ```

3. **No loading mechanism**. Extensions are discovered by reading, not by tooling.
   A team adds an extension by: (a) copying an existing template, (b) customizing
   the content, (c) adding one line to the index.

## Adding an Extension — Step by Step

### Step 1: Copy an existing template

```sh
cp extensions/idea-assessment.template.md extensions/feature-proposal.template.md
```

### Step 2: Customize the content

Edit the new file to suit your team's needs. You may add, remove, or reorder
sections. The template format follows OpenSDD's standard patterns (scopes,
decisions tables, risks, etc.) but your content is entirely project-specific.

### Step 3: Register in the index

Add one line to the bottom of `extensions/README.md` (or `extensions/index.txt`):

```
feature-proposal.template.md | A template for assessing new feature ideas
```

### Step 4: Use it

Reference the extension from your team's workflow. Since there is no loader,
the extension is invoked by mentioning its filename or by copying it into the
active SpecSet.

## Worked Example

See `extensions/example-idea-assessment.template.md` for a complete example
extension — an idea-assessment template inspired by Spec Kit's bundled processes,
adapted to OpenSDD's zero-weight philosophy.

## Philosophy

- **Single-file processes**, not new cycle stages — extensions slot into a team's
  existing flow as needed.
- **Delivered as readable Markdown configs**, not installable packages.
- **Discovery by reading**, not by tooling — the index is the only "registry."
- **Core `sdd/` untouched** — teams customize without modifying the shipped toolkit.

## Current Extensions

| File | Description |
|---|---|
| `example-idea-assessment.template.md` | Idea assessment template (worked example) |