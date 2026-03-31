---
description: "Create a release plan with premortem analysis"
---

## Phase 1: Premortem (parallel)
Run in parallel:

**Subagent A — premortem-facilitator (principal-engineer):**
- Assume: $ARGUMENTS failed in production 30 days after launch
- Generate top 5 failure scenarios
- Identify missing safeguards

**Subagent B — staff-sre:**
- Review production readiness against SERVICE_SCORECARD.md
- Identify operational gaps

## Phase 2: Release plan (sequential, after Phase 1)
Use the release-commander agent to:
- Incorporate premortem findings and SRE gaps
- Produce step-by-step rollout plan
- Include gates, signals, rollback triggers, irreversible step warnings
