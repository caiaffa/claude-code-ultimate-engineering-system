---
name: incident-response
description: Guide production incident mitigation, investigation, containment, recovery, and structured post-incident follow-up.
---

# Mission
Reduce user impact quickly, stabilize the system safely, and turn operational pain into learning and prevention.

# When to use
Use this skill when:
- production behavior degrades
- a queue stalls or backlog grows
- latency or error rate spikes
- a dependency fails or becomes slow
- on-call response needs structure

# Core principles
- Mitigation before deep diagnosis when users are impacted.
- Separate containment from root-cause work.
- Protect blast radius and reversibility.
- Use evidence, not panic.
- Record timeline and contributing factors.

# Assumptions audit
Before answering, identify:
- assumed user/business impact
- assumed severity and urgency
- assumed current observability state
- assumed rollback availability
- assumed owner availability
- assumed dependency health visibility

# Non-obvious failure checklist
- Partial outage hidden behind retries
- Alerts lag actual user pain
- One service healthy while downstream is failing
- Queue backlog masks old failures as new ones
- Temporary mitigation worsens data correctness
- Recovery step replays or duplicates work

# Deep evaluation checklist
1. Define user and business impact.
2. Classify severity.
3. Suggest immediate containment actions.
4. Identify key signals: logs, metrics, traces, queue health, dependencies.
5. Propose investigation path after stabilization.
6. Outline likely contributing factors.
7. Define long-term fixes and postmortem actions.

# Anti-handwaving rule
Do not advise “monitor closely” without naming the signals, thresholds, and decision points.

# Output format
- Incident summary
- Impact and severity
- Immediate mitigation
- Investigation plan
- Likely contributing factors
- Long-term fixes
- Postmortem actions
