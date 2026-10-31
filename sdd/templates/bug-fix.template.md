# Bug Fix — OpenSDD Extension Template

An optional extension template for assessing and tracking bug fixes. This template
slots into a team's existing flow as needed — it is **not** a new cycle stage.

## Symptom → Cause Assessment → Scoped Fix → Verification Record

### Symptom

- **What is the observed behavior that indicates a bug?**
- **Where does it appear?** (file paths, UI locations, error messages, commit hashes)
- **How often does it reproduce?** (once, intermittently, always)
- **Severity/impact:** (blocker, critical, major, minor, cosmetic)

### Cause Assessment

- **Root cause:** (what is the underlying issue — code defect, configuration, environment, design flaw?)
- **Evidence:** (logs, stack traces, test output, prior similar fixes)
- **Is this a new bug or a regression?** (if regression, from which prior change/version?)
- **Related components:** (which parts of the system are affected)

### Scoped Fix

- **Proposed fix:** (concise description of the code change or configuration update)
- **Files to modify:** (list affected files, with line numbers if applicable)
- **Risk of fix:** (potential side effects, areas that might break)
- **Estimated effort:** (T-shirt size: XS, S, M, L, XL, or person-days)

### Verification Record

- **How the fix was verified:** (steps to reproduce, expected vs. actual output)
- **Test cases run:** (specific test IDs or descriptions)
- **Regression check:** (confirm no existing behavior was broken)
- **Deployment note:** (if applicable, how the fix was deployed and confirmed in production/staging)
- **Follow-up:** (any known remaining issues, future improvements, related bugs)

## Usage

1. Copy this template into `sdd/templates/` (or `extensions/` for team-specific variants):
   ```sh
   cp sdd/templates/bug-fix.template.md sdd/templates/bug-fix-myapp.template.md
   ```

2. Customize the content for the specific bug being addressed.

3. Fill out every section before marking the bug fix complete. Incomplete templates
   delay the merge process and make it harder to track patterns across fixes.

4. Reference the filled template from the phase's `validation.md` as evidence of
   the fix having been verified.

## Notes

- This template is entirely optional. Teams that do not use this workflow can
  ignore it without affecting the core SDD cycle.
- The template follows OpenSDD's conventions: Markdown-only, no framework names,
  no tool-specific syntax. It works with any AI assistant.
- No loader or registry exists — discovery is by reading the `sdd/templates/` directory
  or the `extensions/` index.
- The "Verification Record" section is critical — it provides the evidence that
  satisfies the validation checklist in `sdd/05-validation-and-closeout.md`.