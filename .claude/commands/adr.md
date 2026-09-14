---
description: Lightweight decision record for small, local, reversible decisions
---

For SIGNIFICANT decisions — architecture affecting other teams, new tech,
anything over ~2 weeks — use **/rfc** (Kovi's RFC-0001 standard). Use /adr only
for small, local decisions that do not warrant a full RFC.

Decision: $ARGUMENTS

## Phase 1 — Draft (sequential)
**principal-engineer** drafts a short ADR using
`~/.claude/engineering/ADR_TEMPLATE.md`: context, the decision, at least 2
real options with honest trade-offs, consequences, reversibility.

## Phase 2 — Challenge (sequential)
**architecture-challenger** attacks the draft: weakest assumptions, failure
modes, alternatives dismissed too fast. Checklist:
`~/.claude/engineering/ADR_REVIEW_CHECKLIST.md`.

## Phase 3 — Revise & persist (sequential)
**principal-engineer** revises with the findings and returns the final text.
The **orchestrator** writes it (principal-engineer has no Write tool) to
`~/code/kovi/staff/claude/vault/decisions/ADR-<NNNN>-<slug>.md`
(next number = highest existing + 1). If the decision turns out to be
significant, escalate it to a full RFC instead.
