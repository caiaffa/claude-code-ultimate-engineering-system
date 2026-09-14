---
description: Safe refactor — characterize, plan, challenge, execute in small steps, review
---

Target: $ARGUMENTS

## Phase 1 — Characterize & plan (sequential)
**backend-platform-engineer** (safe-refactoring + test-strategy skills):
current problems, behavior that must NOT change, characterization tests to
write first, and a step plan where every step is independently mergeable.
No structural changes yet.

## Phase 2 — Challenge (sequential, decision gate)
**architecture-challenger**: attack the plan — accidental behavior change,
hidden callers (reflection, config, other services), error-semantics drift,
lost observability, steps that cannot ship incrementally. Critical findings →
revise the plan.

## Phase 3 — Execute (sequential)
**backend-platform-engineer**: one step at a time — green suite → change →
green suite. One commit per step (`refactor(scope): ...`). Never mix a
behavior change into a refactor commit; if one is needed, stop and report.

## Phase 4 — Review (parallel)
- **backend-platform-engineer** (fresh instance, code-review skill) on the full diff
- **security-engineer** — only if auth, data access, or contracts were touched

## Output
Steps executed with test output per step, preserved-behavior evidence,
remaining risks, and whether a release plan (`/release`) is needed.
