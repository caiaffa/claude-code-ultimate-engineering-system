---
name: production-readiness
description: Assess whether a service is ready for production and operable at scale — reliability, capacity, infrastructure (Kubernetes/AWS), and operational excellence. Use before launch and in periodic service reviews.
allowed-tools: Read, Grep, Glob
---

# Mission
Verify a service can be run, scaled, and recovered in production — not just that the code works.

# When to use
- Before launching a new service or major feature.
- Periodic service health / scorecard review.

# Handoff
- Receives from: release-planning or reliability-engineer.
- Hands off to: reliability-engineer (gaps with severity).

# Operational excellence
- Every service has a runbook. Every alert maps to an action.
- Health checks: liveness and readiness, distinct and meaningful.
- Graceful shutdown and startup ordering handled.
- Configuration via environment, secrets never in code.
- SLIs/SLOs defined with concrete numbers (see observability skill).

# Capacity & scaling
- Known load profile: expected and peak RPS, growth rate.
- Resource requests/limits set from measured usage, not guesses.
- Autoscaling signal is the real bottleneck (CPU, queue depth), not a proxy.
- A failure-mode plan for the dependency that saturates first.

# Infrastructure (Kubernetes / AWS)
- Pods: requests/limits set; no single point of failure; PodDisruptionBudget for critical workloads.
- Rollout strategy is safe (rolling/canary); probes tuned so a slow start isn't killed.
- IAM least-privilege; no wildcard permissions.
- Stateful dependencies (DB, cache, queue) have defined failover behavior.
- Cost: right-sized instances, no idle over-provisioning (cross-check engineering-economics).

# Service scorecard
Evaluate against ~/.claude/engineering/SERVICE_SCORECARD.md section by section; report each as pass / gap / blocker.

# Red flags
- No runbook. Alert with no action. Resource limits unset.
- Autoscaling on a proxy metric. Wildcard IAM. No failover plan for a stateful dependency.

# Output
```
# PRODUCTION READINESS
Overall: READY | READY WITH GAPS | NOT READY
Gaps by severity (blocker / high / medium) with specific fixes
Scorecard section results
```
