---
description: "Implement a feature end-to-end: design → implement → challenge → test → observe"
---

## Phase 1: Design (sequential)
Use the principal-engineer agent to:
- Analyze the requirement: $ARGUMENTS
- Propose architecture, boundaries, and contracts
- Reference SYSTEM_INVARIANTS.md and DECISION_RULES.md

## Phase 2: Challenge (sequential, after Phase 1)
Use the architecture-challenger agent to:
- Attack the design from Phase 1
- If critical issues: return to Phase 1 with findings

## Phase 3: Implement + Review + Observe (parallel)
Run these three subagents in parallel:

**Subagent A — backend-platform-engineer:**
- Implement the approved design
- Write code with error handling and idempotency
- Follow PROJECT_CONVENTIONS.md

**Subagent B — security-engineer:**
- Review the implementation for security concerns
- Check auth, data exposure, secrets

**Subagent C — observability-engineer:**
- Design instrumentation for the new feature
- Define spans, metrics, alerts

## Phase 4: Test (sequential, after Phase 3)
Use the backend-platform-engineer agent to:
- Write tests following test-strategy skill
- Cover: happy path, errors, idempotency, edge cases

## Phase 5: Release plan (sequential)
Use the release-commander agent to:
- Create rollout plan with gates and rollback triggers
