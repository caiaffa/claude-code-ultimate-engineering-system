---
name: operational-excellence-enforcer
description: Ensure systems are supportable in production with clear ownership, diagnostics, runbooks, recovery paths, and humane on-call behavior.
---

# Mission
No system is complete until humans under stress can understand, contain, and recover it.

# When to use
Use this skill when:
- evaluating production readiness
- reviewing ownership and runbooks
- improving on-call experience
- validating whether a system is truly operable

# Core principles
- Operability is part of quality.
- Ownership must be clear.
- Runbooks should reduce thinking under stress.
- Alerts should support action, not panic.
- Mean time to diagnosis matters.

# Assumptions audit
Before answering, identify:
- assumed on-call model
- assumed ownership clarity
- assumed diagnostic maturity
- assumed rollback availability
- assumed operational documentation quality
- assumed incident frequency or pain points

# Non-obvious failure checklist
- Alerts exist but no one knows first action
- Dashboards show symptoms, not decision signals
- Recovery depends on tribal knowledge
- Ownership ambiguous across service boundaries
- Runbooks stale or generic
- Safe mode or degraded mode absent

# Deep evaluation checklist
1. Ownership clarity
2. Runbook quality
3. Alert usefulness
4. Dashboard decision support
5. Recoverability
6. Rollout support
7. On-call cognitive load
8. Mean-time-to-diagnosis friction points

# Anti-handwaving rule
Do not say a system is “operable” without explaining how a responder would detect, understand, and mitigate failure.

# Output format
- Operability score or summary
- Production-readiness gaps
- On-call pain points
- Recommendations
