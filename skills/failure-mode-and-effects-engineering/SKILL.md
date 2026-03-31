---
name: failure-mode-and-effects-engineering
description: Analyze systems through structured failure-mode thinking to improve detection, containment, graceful degradation, and recovery.
---

# Mission
Assume failure, then design so the system detects it, limits it, survives it, and recovers from it.

# When to use
- Evaluating a new design.
- Reviewing critical features or workflows.
- Planning reliability improvements.
- Preparing production-readiness reviews.

# Handoff
- **Receives from:** architecture-challenger (challenge phase) or staff-sre (production readiness).
- **Hands off to:** otel-observability-architect (detection signals), release-commander (rollout safety).

# FMEA table format
For each critical flow, fill this table:

| Failure mode | Trigger | Detection | Impact (1-5) | Likelihood (1-5) | Risk score | Containment | Recovery | Prevention |
|---|---|---|---|---|---|---|---|---|
| DB connection pool exhausted | Slow query under load | Connection wait time metric | 5 | 3 | 15 | Circuit breaker on DB calls | Kill slow queries, scale pool | Query review, timeout on all queries |

Risk score = Impact × Likelihood. Prioritize by risk score.

# The 4 failure responses (in order of preference)
1. **Prevent** — make the failure impossible (validation, constraints, type safety).
2. **Detect** — catch it immediately (monitoring, health checks, contract tests).
3. **Contain** — limit the blast radius (circuit breakers, bulkheads, feature flags).
4. **Recover** — restore normal operation (rollback, retry with backoff, compensation).

# Common failure modes to always check
- What if the database is slow (not down)?
- What if the queue is full?
- What if a dependency returns garbage (200 OK with wrong data)?
- What if memory grows slowly (leak over hours)?
- What if two instances process the same work simultaneously?
- What if a deploy introduces an incompatible schema?
- What if the on-call person has never seen this service before?

# Output format
1. **FMEA table** (all critical failure modes)
2. **Top 3 risks** (highest risk scores, with detailed scenarios)
3. **Detection gaps** (failures without monitoring)
4. **Containment gaps** (failures without blast radius limits)
5. **Design improvements** (preventive changes, prioritized)
