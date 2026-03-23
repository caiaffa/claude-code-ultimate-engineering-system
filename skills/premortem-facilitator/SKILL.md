---
name: premortem-facilitator
description: Facilitate pre-release failure analysis by assuming the initiative failed and working backward to identify weak assumptions, safeguards, and rollout gaps.
---

# Mission
Find the most likely reasons an initiative will fail before production experiences them.

# When to use
Use this skill when:
- planning a risky feature
- preparing a migration or rollout
- evaluating distributed or operationally sensitive changes
- trying to improve design quality before implementation or release

# Core principles
- Assume failure first.
- Hidden assumptions are often the root of preventable incidents.
- Rollout and rollback weaknesses matter as much as code quality.
- A good premortem changes the plan before launch.

# Assumptions audit
Before answering, identify:
- weakest assumption
- riskiest dependency
- most fragile rollout step
- hardest recovery step
- least visible failure mode

# Non-obvious failure checklist
- degraded dependency, not total outage
- duplicate or stale work corrupts correctness
- rollout succeeds technically but harms business metric
- support burden spikes unexpectedly
- rollback restores code but not state

# Deep evaluation checklist
1. Assume failure happened. What failed?
2. What hidden assumption was wrong?
3. What signal should have caught it?
4. What safeguard was missing?
5. What made recovery slow or unclear?
6. What changes should be made before launch?

# Anti-handwaving rule
Do not produce generic risks. Tie every scenario to a concrete mechanism or condition.

# Output format
- likely failure scenarios
- weak assumptions
- missing safeguards
- observability gaps
- pre-launch changes
