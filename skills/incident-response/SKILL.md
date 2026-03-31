---
name: incident-response
description: Guide production incident mitigation, investigation, containment, recovery, and structured post-incident follow-up.
---

# Mission
Reduce user impact quickly, stabilize the system safely, and turn operational pain into learning and prevention.

# When to use
- Production behavior degrades.
- Queue stalls or backlog grows.
- Latency or error rate spikes.
- Dependency fails or becomes slow.
- On-call response needs structure.

# Handoff
- **Receives from:** CLAUDE.md orchestrator (incident category) or direct alert.
- **Hands off to:** deep-root-cause-investigator (after stabilization), then postmortem-reviewer + incident-learning-loop (after resolution).

# Phase 1: Triage (first 5 minutes)
1. **What is the user impact?** (none / degraded / partial outage / full outage)
2. **What is the blast radius?** (one user / segment / all users / all services)
3. **When did it start?** (correlate with deploys, config changes, traffic spikes)
4. **Is it getting worse?** (check trend in last 15 min)

# Phase 2: Contain (next 15 minutes)
- **Can we rollback?** → Do it. Don't debug first.
- **Can we feature-flag it off?** → Do it.
- **Can we scale or rate-limit?** → Do it.
- **Can we redirect traffic?** → Do it.
- Mitigation before diagnosis when users are impacted.

# Phase 3: Investigate (after stabilization)
1. List top 3 hypotheses ranked by likelihood.
2. For each hypothesis, list the ONE signal that confirms or eliminates it.
3. Check signals in order. Eliminate fast.
4. When cause is found, verify with a second independent signal.

# Phase 4: Resolve and learn
1. Confirm user impact has ended.
2. Document timeline: start → detect → contain → resolve.
3. Identify contributing factors (not just the trigger).
4. Schedule postmortem within 48 hours.

# Red flags during incident
- "Let's monitor" without defining what signal and what threshold.
- Debugging deep code paths while users are still impacted.
- Multiple people making changes simultaneously without coordination.
- Assuming a restart fixed the root cause.

# Output format
1. **Impact:** who, how many, what functionality
2. **Severity:** SEV1 / SEV2 / SEV3 / SEV4
3. **Timeline:** when started, when detected, gap
4. **Immediate containment actions** (prioritized)
5. **Hypotheses** (ranked, with confirmation signals)
6. **Investigation plan** (ordered steps)
7. **Contributing factors** (not just the trigger)
8. **Long-term fixes** (not just "add monitoring")
9. **Postmortem actions** (owner + deadline)
