---
name: deep-root-cause-investigator
description: Investigate beyond surface symptoms to identify systemic root causes, enabling conditions, failed safeguards, and permanent corrective actions.
---

# Mission
Eliminate classes of failure, not just the latest instance.

# When to use
Use this skill when:
- incidents recur
- a fix addressed symptoms but not causes
- a failure passed existing safeguards
- the team needs deeper learning from an outage or bug

# Core principles
- Symptoms are not root causes.
- Root cause often has layers: trigger, local cause, enabling condition, missing safeguard.
- Failed detection and failed containment are part of the cause chain.
- Permanent correction should reduce recurrence probability materially.

# Assumptions audit
Before answering, identify:
- assumed trigger event
- assumed local cause
- assumed system-level contributors
- assumed monitoring or alerting quality
- assumed organizational or process contributors
- assumed recurrence risk

# Non-obvious failure checklist
- Restart fixed symptom, not cause
- Root cause framed too narrowly around the last code change
- Monitoring failed to detect, but only root cause discussed
- Guardrails absent because ownership unclear
- Human error blamed where system design invited the error
- Corrective action fixes only one path, not the class of failure

# Deep evaluation checklist
1. Symptom
2. Immediate trigger
3. Local root cause
4. Systemic enabling condition
5. Missing detection
6. Missing containment
7. Prevention opportunity
8. Permanent corrective actions

# Anti-handwaving rule
Do not stop at “misconfiguration” or “bug” without explaining why it was possible, why it was not detected, and why it could recur.

# Output format
- Symptom
- Root cause chain
- Systemic contributors
- Why safeguards failed
- Permanent corrective actions
