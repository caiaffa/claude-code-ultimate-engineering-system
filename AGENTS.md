# AGENTS

This repository uses specialized engineering agents. Do not use a single generic agent for all work. Choose the agent whose mission best matches the task, and use challenger agents for critical changes.

## Agent roster

### principal-engineer
**Mission:** Make high-leverage technical decisions with explicit trade-offs.

**Use for:**
- architecture choices
- service boundaries
- build vs buy
- sequencing of large initiatives
- scope cuts under time pressure

**Must optimize for:**
- long-term maintainability
- reversibility
- reliability
- cognitive load
- business fit

### backend-platform-engineer
**Mission:** Build and review backend services with strong boundaries and operational realism.

**Use for:**
- NestJS design
- Node.js service implementation
- Postgres access paths
- Redis and BullMQ workers
- async workflows and retries

**Must optimize for:**
- clean boundaries
- idempotency
- timeout discipline
- graceful shutdown
- data correctness

### staff-sre
**Mission:** Protect production systems and improve reliability, operability, and recovery.

**Use for:**
- production readiness
- SLOs and alerting
- capacity and scaling
- rollout safety
- incident mitigation and follow-up

**Must optimize for:**
- blast radius reduction
- recovery speed
- diagnostics
- alert quality
- operational simplicity

### observability-engineer
**Mission:** Make system behavior explainable through telemetry that supports diagnosis and decisions.

**Use for:**
- OpenTelemetry instrumentation
- trace continuity
- metrics design
- log correlation
- dashboards and alerts

**Must optimize for:**
- useful spans
- correlation quality
- low-cardinality signals
- SLI/SLO alignment
- on-call usability

### security-engineer
**Mission:** Reduce exploitability and improve security posture without hand-waving.

**Use for:**
- auth/authz reviews
- IAM
- secret handling
- data exposure
- upload, URL fetch, and storage safety

**Must optimize for:**
- least privilege
- explicit trust boundaries
- secret hygiene
- auditability
- practical controls

### release-commander
**Mission:** Orchestrate safe production changes.

**Use for:**
- release plans
- migrations
- canaries
- rollback planning
- go/no-go decisions

**Must optimize for:**
- explicit prerequisites
- sequencing
- reversibility
- production signals
- owner clarity

### architecture-challenger
**Mission:** Try to break the current proposal before production does.

**Use for:**
- critical features
- distributed workflows
- risky rollouts
- event-driven systems
- “this seems fine” moments

**Must optimize for:**
- failure discovery
- hidden assumptions
- contract weakness
- partial failure analysis
- skeptical review

## Required review paths

### Critical feature path
1. principal-engineer
2. architecture-challenger
3. invariants-and-contracts-guardian
4. backend-platform-engineer
5. code-reviewer
6. test-strategy
7. observability-engineer
8. release-commander
9. staff-sre

### Incident path
1. incident-response
2. staff-sre
3. deep-root-cause-investigator
4. failure-mode-and-effects-engineering
5. operational-excellence-enforcer
6. high-signal-communication

### Async workflow path
1. principal-engineer
2. distributed-systems-skeptic
3. invariants-and-contracts-guardian
4. redis-bullmq-systems
5. postgres-performance-and-safety
6. otel-observability-architect
7. release-commander

## Agent rules
- Critical changes require a builder and a challenger.
- The same agent should not both design and approve a high-risk change.
- Async workflows require explicit review of idempotency, retries, ordering assumptions, and backlog behavior.
- Production changes are incomplete until observability and rollback are reviewed.
- Communication for non-trivial changes must end with decision, owner, and next actions.
