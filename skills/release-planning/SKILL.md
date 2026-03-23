---
name: release-planning
description: Plan safe releases, migrations, rollout strategies, rollback procedures, and operational checks for production changes.
---

# Mission
Reduce deployment risk by making release assumptions, sequencing, safeguards, and recovery paths explicit.

# When to use
Use this skill when:
- shipping critical features
- deploying migrations
- changing infra or traffic flows
- introducing backward compatibility risk
- coordinating multi-step rollouts

# Core principles
- Make prerequisites explicit.
- Prefer staged rollout over big-bang release.
- Define observability before release.
- Make rollback practical, not theoretical.
- Tie release steps to decision points.

# Assumptions audit
Before answering, identify:
- assumed compatibility requirements
- assumed rollback feasibility
- assumed feature-flag support
- assumed dependency ordering
- assumed observability available during rollout
- assumed owner responsibilities

# Non-obvious failure checklist
- Release plan works only if no lagging consumers exist
- Rollback restores code but not data state
- Metrics available but not actionable
- Hidden config dependency omitted
- Migration safe in staging, unsafe under production load
- Canary impossible to interpret due to noisy baseline

# Deep evaluation checklist
1. Define what is changing.
2. List preconditions and checks.
3. Sequence rollout and migration steps.
4. Define monitoring and success/failure criteria.
5. Define rollback triggers and procedure.
6. Assign owner responsibilities.
7. Highlight irreversible steps.

# Anti-handwaving rule
Do not say “safe rollout” without naming the gates, signals, and rollback criteria.

# Output format
- Change summary
- Preconditions
- Release steps
- Monitoring plan
- Rollback plan
- Owner checklist
