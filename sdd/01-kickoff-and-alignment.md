# Stage 01 — Kickoff & Alignment

**When**: A new feature area is proposed. Before ANY file is written.
**Goal**: A shared, unambiguous understanding of what will be built and how the work will be structured — confirmed by the stakeholder.

## Process

1. **Survey the ground truth.** Read the existing constitution(s), recent phases, and the code/docs the feature will touch. Never rely on memory or assumptions about the repository's current state.

2. **Propose, don't presume.** Present the feature scope, a draft phase decomposition, and any structural choices (folder names, numbering, grouping) as concrete proposals in conversation.

3. **Surface ambiguities as grouped questions.** Before writing to disk, ask the stakeholder — ideally with a question tool — grouped into a small number (2–4) of focused questions. Typical categories:
   - **Scope**: all phases at once vs. just the next one; what is in/out
   - **Naming & structure**: directory names, numbering scheme, grouping
   - **Flow**: spec-only-and-review vs. implement immediately after specs
   - **Domain decisions**: data shapes, TTLs, access rules — anything with real tradeoffs that the stakeholder owns
   - When a recommendation exists, mark it as such — but never remove the stakeholder's choice.

4. **Flag missing inputs — never invent them.** If the request references a document, TODO list, or artifact that does not exist, say so explicitly and proceed on an agreed fallback basis. A roadmap "based on X" where X does not exist must record that fact — it must not fabricate X.

5. **Record the alignment.** Every answered question becomes a constraint in the forthcoming constitution or phase specs (usually the Decisions table). Decisions made in chat but not written into specs do not exist.

## Anti-patterns

- Writing files before the stakeholder confirms scope and naming
- Asking questions one-at-a-time in a long serial chain — group them
- Silently guessing when a decision is genuinely the stakeholder's
- Treating a referenced-but-missing input as if it existed
- Starting implementation in the same breath as the specs when the stakeholder asked for review first

## Exit criteria

- [ ] Scope, structure, and flow decisions confirmed by the stakeholder
- [ ] Missing or ambiguous inputs flagged and resolved
- [ ] Next action agreed: create the constitution (stage 02)
