---
description: "Incident response: triage → contain → investigate → learn"
---

## Phase 1: Triage + Contain (staff-sre, urgent)
Use the staff-sre agent immediately:
- Assess: $ARGUMENTS
- Triage user impact and blast radius
- Contain: rollback, feature-flag, rate-limit — act before deep diagnosis

## Phase 2: Investigate (parallel, after containment)
Run in parallel:

**Subagent A — systematic-debugging (backend-platform-engineer):**
- List top 3 hypotheses for the root cause
- For each, identify the ONE confirmation signal
- Narrow and verify

**Subagent B — observability-engineer:**
- Gather relevant traces, metrics, and logs
- Identify detection gaps
- Check if existing alerts fired (and when)

## Phase 3: Root cause (sequential)
Use the backend-platform-engineer agent with deep-root-cause-investigator skill:
- Build full cause chain: symptom → trigger → local cause → systemic cause
- Identify failed detection and failed containment

## Phase 4: Learn (sequential)
Use the staff-sre agent with postmortem-reviewer and incident-learning-loop skills:
- Fill POSTMORTEM_TEMPLATE.md
- Identify standards/templates that should change
- Assign corrective actions with owner + deadline
