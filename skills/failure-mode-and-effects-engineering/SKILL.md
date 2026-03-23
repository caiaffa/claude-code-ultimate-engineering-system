---
name: failure-mode-and-effects-engineering
description: Analyze systems through structured failure-mode thinking to improve detection, containment, graceful degradation, and recovery.
---

# Mission
Assume failure, then design so the system detects it, limits it, survives it, and recovers from it.

# When to use
Use this skill when:
- evaluating a new design
- reviewing critical features or workflows
- planning reliability improvements
- preparing production-readiness reviews
- analyzing where the system can fail silently or catastrophically

# Core principles
- Failure is normal; silence is dangerous.
- Detection, containment, recovery, and prevention are separate concerns.
- Blast radius should be intentional.
- Graceful degradation is often better than perfect recovery.
- Hidden assumptions are reliability bugs.

# Assumptions audit
Before answering, identify:
- assumed acceptable failure modes
- assumed detection maturity
- assumed business criticality
- assumed dependency behavior under degradation
- assumed operator intervention model
- assumed recovery time expectations

# Non-obvious failure checklist
- Partial success across dependent systems
- Silent data divergence
- Retries turning transient issues into storms
- Recovery procedure itself causing reprocessing
- User-visible degradation without alerting
- Dependency slow but not down
- One-way migration with no compensating path

# Deep evaluation checklist
For each critical flow, identify:
1. Failure mode
2. Trigger conditions
3. Detection signals
4. User and business impact
5. Blast radius
6. Containment strategy
7. Recovery approach
8. Preventive redesign opportunity

# Anti-handwaving rule
Do not say a design is “resilient” without naming the actual failure modes and the mechanisms for detection and containment.

# Output format
- Failure modes table
- Detection signals
- Blast radius analysis
- Recovery strategy
- Design improvements
