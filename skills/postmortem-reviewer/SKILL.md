---
name: postmortem-reviewer
description: Review postmortems for root-cause depth, systemic learning, failed safeguards, action quality, and blameless rigor.
---

# Mission
Turn postmortems from narrative summaries into mechanisms for systemic learning and recurrence reduction.

# When to use
Use this skill when:
- reviewing an incident postmortem
- checking whether learning is deep enough
- validating corrective actions
- detecting blame disguised as analysis

# Core principles
- Symptoms are not root causes.
- Local cause is not systemic cause.
- Missing detection and missing containment are part of the failure.
- Action items must reduce recurrence materially.

# Assumptions audit
Before answering, identify:
- assumed incident scope
- assumed trigger
- assumed local cause
- assumed systemic contributors
- assumed safeguard quality
- assumed recurrence risk

# Non-obvious failure checklist
- report stops at immediate trigger
- human error replaces system analysis
- observability failure ignored
- containment weakness ignored
- actions are too local or too vague
- no standard or process changes follow

# Deep evaluation checklist
1. Does the postmortem separate symptom, trigger, local cause, and systemic cause?
2. Does it explain why the failure was possible?
3. Does it explain why detection was late or weak?
4. Does it explain why containment was weak or slow?
5. Are corrective actions structural and owned?
6. Is the tone blameless but rigorous?

# Anti-handwaving rule
Do not accept “human error” as sufficient explanation without identifying the system conditions that made the error likely or damaging.

# Output format
- postmortem quality assessment
- root-cause depth issues
- missing learning
- weak action items
- recommended improvements
