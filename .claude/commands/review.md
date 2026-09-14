---
description: Full code review — correctness, security, reliability
---

Target: $ARGUMENTS (a PR number, branch, commit range, or "working tree")

## Phase 0 — Collect the change (orchestrator)
Produce the diff once (`git diff <base>...HEAD`, `gh pr diff <n>`, or
`git diff`) plus the list of touched files. Every reviewer gets this same
input — never the conversation history.

## Phase 1 — Review (parallel)
- **backend-platform-engineer** (code-review skill) — correctness, boundaries,
  error handling, coupling, missing tests. Check against
  `~/.claude/engineering/DEFINITION_OF_DONE.md`.
- **security-engineer** — auth, injection, data exposure, secrets, tenant
  isolation. Blocks for critical findings.
- **reliability-engineer** — instrumentation gaps, trace propagation,
  alertability, runtime risks (timeouts, shutdown, unbounded concurrency).

Skip a reviewer only when the diff clearly cannot concern it (e.g. docs-only
change → skip security), and say so.

## Phase 2 — Synthesize
One merged verdict: **SAFE / NEEDS CHANGES / BLOCKED**, with every finding
kept (🔴 block, 🟡 should fix, 🔵 suggestion), deduplicated across reviewers,
each with `file:line`. Never drop a reviewer's finding.
