---
description: Incident response — triage, contain, investigate, learn
---

Incident: $ARGUMENTS

## Phase 1 — Triage & contain (URGENT, sequential)
**reliability-engineer**: assess user impact and blast radius; pull live
signals from Grafana (Prometheus/Loki) when the MCP is available. Contain
immediately (rollback, flag, rate-limit). Do NOT parallelize this phase.
For a severe or unfamiliar incident, run this agent with `model: opus`.

## Phase 2 — Investigate (parallel, after containment)
- **backend-platform-engineer** (systematic-debugging skill) — top 3 hypotheses,
  one confirmation signal each, tested cheapest-first
- **reliability-engineer** — traces, metrics, logs around the start time;
  recent deploys and config changes

## Phase 3 — Resolve & learn (sequential)
Synthesize the confirmed root cause (full chain: trigger → mechanism → symptom).
**reliability-engineer** writes the postmortem using
`~/.claude/engineering/POSTMORTEM_TEMPLATE.md` (Kovi's blameless template):
PT-BR body, no invented data (mark TBD), 5 Whys, action items with owner and
date. Save to `~/code/kovi/staff/claude/vault/incidents/<date>-<slug>.md`
and remove the template's instruction block. Update the relevant governance doc
in `~/.claude/engineering/` with the failure mode.
