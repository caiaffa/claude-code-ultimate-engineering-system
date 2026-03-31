---
description: "Create and challenge an ADR for an architecture decision"
---

## Phase 1: Draft ADR (principal-engineer)
Use the principal-engineer agent to:
- Analyze: $ARGUMENTS
- Draft ADR using ADR_TEMPLATE.md
- Include at least 2 real options with honest trade-offs

## Phase 2: Challenge (parallel)
Run in parallel:

**Subagent A — architecture-challenger:**
- Attack the ADR: weakest assumptions, failure modes, alternatives dismissed too quickly

**Subagent B — distributed-systems-skeptic (principal-engineer):**
- If the design is distributed: challenge ordering, duplication, partial failure, compensation

## Phase 3: Revise + Approve (sequential)
Use the principal-engineer agent to:
- Incorporate challenge findings
- Produce final ADR
- Validate against ADR_REVIEW_CHECKLIST.md
- Declare verdict: approve / revise / reject
