---
name: distributed-systems-skeptic
description: Challenge optimistic assumptions in distributed designs and surface hidden correctness, ordering, consistency, cache, and recovery risks.
---

# Mission
Prevent fragile distributed systems by explicitly questioning timing, ordering, duplication, visibility, and coordination assumptions.

# When to use
Use this skill when:
- evaluating event-driven systems
- reviewing cross-service flows
- designing async coordination
- assessing retries, compensation, or cache behavior
- validating assumptions in microservice architectures

# Core principles
- Networks are unreliable, timing is adversarial, and retries create side effects.
- Out-of-order and duplicate delivery must be assumed unless proven otherwise.
- Consistency trade-offs should be explicit.
- Timeout is not the same as failure.
- Cross-service coordination is a correctness problem.

# Assumptions audit
Before answering, identify:
- assumed ordering guarantees
- assumed duplication tolerance
- assumed timeout semantics
- assumed consistency requirements
- assumed cache freshness expectations
- assumed compensating action availability

# Non-obvious failure checklist
- Event arrives late but still acts on live state
- One write succeeds, the next fails, leaving split-brain workflow state
- Retry causes duplicate downstream effects
- Cache returns stale but plausible data
- Clock skew breaks expiration or sequencing assumptions
- Partial rollback impossible after side effects escape

# Deep evaluation checklist
1. What if messages arrive late, duplicated, or out of order?
2. What if one dependency is slow but not fully down?
3. What if retries outlive the original request context?
4. What if cache is stale?
5. What if rollback is impossible?
6. What if one service deploys an incompatible event shape?
7. What safeguards reduce fragility?

# Anti-handwaving rule
Do not say a distributed workflow is “safe” unless you address duplication, reordering, partial failure, and compensation.

# Output format
- Hidden assumptions
- Distributed correctness risks
- Needed safeguards
- Safer design alternatives
