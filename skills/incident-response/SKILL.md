---
name: incident-response
description: Run a production incident end to end — triage, contain, investigate, resolve — then close the loop with a blameless postmortem, failure-mode prevention, and updated standards.
allowed-tools: Read, Grep, Glob, Bash
---

# Mission
Stop user impact fast, then make the same failure impossible to repeat.

# When to use
- A production incident: outage, latency spike, error spike, data issue.
- Post-incident learning and prevention.

# Handoff
- Receives from: orchestrator (incident category).
- Hands off to: systematic-debugging (root cause), release-planning (fix rollout).

# Phase 1 — Triage & contain (URGENT)
1. **Triage:** user impact? blast radius? getting worse?
2. **Contain BEFORE diagnosing:** rollback, feature-flag off, rate-limit. Mitigation beats diagnosis when users are impacted.
3. Declare severity. Assign an incident lead and a comms owner.

# Phase 2 — Investigate
- Hand the root cause to systematic-debugging: top 3 hypotheses, one signal each.
- Gather traces, metrics, logs around the start time.
- Confirm the cause before claiming resolution.

# Phase 3 — Resolve
- Confirm user impact has ended (with a signal, not a feeling).
- Document the timeline as you go.

# Phase 4 — Blameless postmortem
- Write it using `~/.claude/engineering/POSTMORTEM_TEMPLATE.md` (Kovi's standard template).
- Blameless: describe systems and decisions, never blame a person.
- PT-BR body; identifiers, queries, and service names in English.
- Never invent numbers, VINs, timestamps, or names — mark `TBD` instead.
- Fill the 5 Whys until the systemic cause; action items each get an owner and date.
- Remove the template's instruction block in the finished postmortem.

# Phase 5 — Failure-mode prevention
For the failure that occurred, ask:
- What detection would have caught this sooner? (alert + threshold)
- What guardrail would have prevented it? (test, invariant, gate)
- What other code has the same failure mode?
Update the relevant governance doc so the standard now covers it.

# Red flags
- Diagnosing while users are still impacted.
- "Monitor closely" with no named signal/threshold.
- Postmortem with no class-level prevention.

# Output
Incident timeline, confirmed root cause, mitigation applied, postmortem with owned action items, standards updated.
