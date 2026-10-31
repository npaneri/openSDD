# Greeting Widget — Minimal SpecSet: Mission

## Purpose

This SpecSet delivers a portable, AI-agnostic methodology for defining and building a greeting widget — a simple user-facing component that displays a personalized greeting. It proves that the OpenSDD toolkit can be adopted by any team with any AI coding assistant, requiring zero framework-specific knowledge.

Core value proposition: **Spec-Driven Development as a copyable, AI-agnostic toolkit that produces complete constitutions from pure Markdown templates.**

## Problem Statement

AI coding assistants are powerful but unpredictable when requirements live only in chat history. Teams without a structured spec process waste time re-clarifying intent, re-working implemented behavior, and debating scope. Existing toolkits require CLI tools, TypeScript toolchains, or multi-capability architectures, creating adoption friction for teams that want a lightweight, zero-dependency method.

## Solution

The target behavior is a reusable greeting widget that accepts a name parameter and renders a personalized greeting. The feature branches into two paths: (1) a plain-text fallback when the widget cannot render, and (2) a styled component when the project has CSS available.

```
GreetingWidget → renders "Hello, Alice!" → shows plain-text fallback on render failure
```

## Core Principles

### 1. AI-agnostic by design

No integration is first-class. Every guide, template, and script works when followed by a human, by Claude, by OpenAI models, by Copilot, or by any future assistant. Tool-specific invocation syntax is documented as a mapping table, never baked into the core.

### 2. Simplicity is the feature

Every addition is weighed against a zero-dependency, copy-the-folder baseline. A CLI wrapper, extension mechanism, or catalog earns its place only by materially lowering adoption friction — never by showcasing sophistication.

### 3. Dogfood or discard

The toolkit is developed using itself. Every guide improvement is discovered by running the cycle, not by speculation. SpecSet-1's phases are the proof: if a stage guide or template fails during this repo's own development, fixing it is in scope.

### 4. Battle-tested content, minimal packaging

The intellectual content (stages, templates, status vocabulary, decisions-table discipline) comes from two completed real-world SpecSets. Packaging (scripts, CLI, examples) is deliberately thin and removable — a team can discard every script and still have a complete method.

### 5. Degradation is expected, never fatal

Any layer can fail or be absent: no scripts → follow guides manually; no CLI → use scaffold.sh → copy templates; no example → the templates carry inline guidance. Every layer's absence degrades to the layer below, ending at "read the guides and write the files yourself."

## Scope

**In scope:**
- A greeting widget that renders "Hello, Alice!"
- A one-row degradation table for render failures
- The entire OpenSDD cycle (stages 01–05) as documented in `sdd/`

**Out of scope (already delivered / owned elsewhere):**
- Actual rendering implementation (the widget is a spec artifact, not a build target)
- Framework-specific code (React, Vue, etc. — the template is generic)
- CI workflows, issue templates, PR templates (nice-to-have; deferred)

**Non-goals:**
- Competing on feature count with OpenSpec or Spec Kit — the differentiator is zero-weight adoption
- Enforcing a single methodology on teams — the guides describe a cycle; teams adapt it (their adaptations are their extensions)
- Telemetry of any content, paths, or PII

## Degradation Table

| Failure | Behavior |
|---|---|
| Widget render failure | Show plain-text fallback: "Hello, {name}!" |