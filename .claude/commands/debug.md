---
description: Debug a bug, regression, or flaky test — reproduce, hypothesize, confirm, fix, prevent
---

Problem: $ARGUMENTS

## Phase 1 — Reproduce & frame (sequential)
**backend-platform-engineer** (systematic-debugging skill): state the symptom
precisely (observed vs expected, when it started, what changed), reproduce it
(failing test or command), and list the top 3 hypotheses — each with the ONE
signal that confirms or kills it. No code changes in this phase.

## Phase 2 — Investigate (parallel)
- **backend-platform-engineer** — test the hypotheses in order, cheapest
  signal first, in code and tests.
- **reliability-engineer** — traces, metrics, logs around the window (use the
  Grafana MCP tools when available). If the symptom is latency/throughput,
  apply performance-analysis.

For an intermittent/flaky issue, reproduce with repeated runs before
declaring it flaky; look for shared state, timing, ordering, real clock.

## Phase 3 — Fix (sequential, decision gate)
Only after the full chain is confirmed (trigger → mechanism → symptom):
**backend-platform-engineer** implements the fix, a regression test for the
exact scenario, and tests for neighboring scenarios. Run the suite; paste output.
If the root cause is architectural, stop and route to `/adr` or `/rfc`.

## Phase 4 — Prevent
What detection or guardrail would have caught this class earlier? Update the
relevant governance doc in `~/.claude/engineering/` if the standard has a gap.

## Output
```
# DEBUG REPORT
Symptom / Confirmed root cause (with evidence) / Full chain
Fix (symptom-level) / Prevention (class-level) / Test output
```
