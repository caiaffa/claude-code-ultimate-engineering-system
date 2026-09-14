---
description: Create a release plan with premortem analysis
---

Change: $ARGUMENTS

## Phase 1 — Premortem (parallel)
- **principal-engineer** — assume the change failed in production 30 days after
  launch; generate the top 5 failure scenarios and missing safeguards
  (`~/.claude/engineering/PREMORTEM_TEMPLATE.md`)
- **reliability-engineer** — production readiness against
  `~/.claude/engineering/SERVICE_SCORECARD.md`

## Phase 2 — Plan (sequential)
**release-commander**: read the actual diff/migrations, incorporate the
premortem findings and readiness gaps; produce the step-by-step rollout plan
with gates, success signals (metric + threshold), and rollback triggers per
`~/.claude/engineering/RELEASE_RULES.md`.

If the user wants it saved, write to
`~/code/kovi/staff/claude/vault/premortems/<date>-<slug>.md`.
