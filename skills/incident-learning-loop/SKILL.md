---
name: incident-learning-loop
description: Convert incidents into durable standards, safeguards, templates, and design rules that reduce recurrence across the system.
---

# Mission
Ensure every serious incident improves the engineering system, not just the affected service.

# When to use
- Closing a postmortem.
- Deciding what should become a standard.
- Updating templates, checklists, or runbooks after incidents.
- Propagating lessons beyond the local failure.

# Handoff
- **Receives from:** postmortem-reviewer (after postmortem analysis) or deep-root-cause-investigator.
- **Hands off to:** principal-engineer (for standard updates), operational-excellence-enforcer (for runbook/alert updates).

# The learning extraction process
For every incident, ask:

1. **What class of failure was this?** (not "what happened" but "what category")
   - Examples: missing idempotency, schema migration lock, stale cache read, missing circuit breaker
2. **What invariant was violated?** (check against SYSTEM_INVARIANTS.md)
3. **What standard should change?** (PROJECT_CONVENTIONS.md, DECISION_RULES.md, etc.)
4. **What template or checklist should be updated?** (SERVICE_SCORECARD.md, DEFINITION_OF_DONE.md, etc.)
5. **What other services have this same exposure?** (lateral scan)
6. **What review requirement should be added?** (new item in code review, ADR review, etc.)

# Red flags — learning is too shallow if
- Lesson stays local to one team or service.
- Fix applied to code but no standard or process changes.
- Runbook improved but the design that caused the incident is unchanged.
- Same class of failure is still possible in 3 other services.
- Action items are all "add monitoring" without prevention.

# Output format
1. **Class of failure** (categorized)
2. **Systemic lesson** (what the org should learn)
3. **Standards to update** (specific files and changes)
4. **Templates/checklists to add or modify** (specific)
5. **Other exposed services** (lateral risk scan)
6. **Wider rollout plan** (how to propagate the fix beyond this service)
