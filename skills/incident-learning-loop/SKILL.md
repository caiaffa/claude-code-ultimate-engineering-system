---
name: incident-learning-loop
description: Convert incidents into durable standards, safeguards, templates, and design rules that reduce recurrence across the system.
---

# Mission
Ensure every serious incident improves the engineering system, not just the affected service.

# When to use
Use this skill when:
- closing a postmortem
- deciding what should become a standard
- updating templates, checklists, or runbooks after incidents
- propagating lessons beyond the local failure

# Core principles
- Incidents should create durable learning.
- Fix the class of failure, not only the instance.
- Standards and templates should evolve after real pain.
- Cross-system learning is more valuable than isolated fixes.

# Assumptions audit
Before answering, identify:
- assumed class of failure
- assumed affected services or workflows
- assumed missing safeguard
- assumed standards that should change
- assumed recurrence risk elsewhere

# Non-obvious failure checklist
- lesson stays local to one team
- fix applied to code, not to standards
- runbook improved but design rule unchanged
- incident exposed weak template that remains unchanged
- same class of failure still possible in similar systems

# Deep evaluation checklist
1. What class of failure occurred?
2. What invariant or safeguard was missing?
3. What template, checklist, or standard should change?
4. What should become a new review requirement?
5. Which other services are likely exposed?
6. What durable change reduces recurrence?

# Anti-handwaving rule
Do not stop at “we learned a lot.” Name the standard, template, or guardrail that should change.

# Output format
- class of failure
- systemic lesson
- standards to update
- templates or checklists to add
- wider rollout recommendations
