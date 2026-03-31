# Quickstart

Quick guide to using the system. Everything is routed through `CLAUDE.md` automatically.

---

## The one rule

Every important change follows: **Validate value → Design → Challenge → Validate production**

`CLAUDE.md` handles the routing. You just describe what you need (or use a /command).

---

## Slash commands

In Claude Code, type:

| Command | What it does |
|---|---|
| `/implement [context]` | End-to-end feature: design → challenge → code + review + observability (parallel) → release |
| `/review [code]` | Parallel code review: correctness + security + observability → merge verdict |
| `/prd [context]` | Parallel PRD review: challenger + metrics + gaps → approve/adjust/reject |
| `/adr [context]` | ADR: design → parallel challenge → revise → approve |
| `/incident [context]` | Incident: contain (urgent) → parallel investigation → root cause → postmortem |
| `/release [context]` | Release: parallel premortem → rollout plan with gates |

---

## How subagents work

The 7 agents live in `.claude/agents/`. Claude Code recognizes them automatically.

You can invoke explicitly:

```
Use the architecture-challenger to attack this ADR
```

Or let `CLAUDE.md` route automatically:

```
I want to implement a payments API with BullMQ
→ CLAUDE.md classifies as "implementation"
→ Triggers phased pattern: principal-eng → challenger → backend-eng + security + obs (parallel) → release
```

### Force parallelism

```
Run in parallel: security review, observability review, and code review of this change
```

### Force background

Press `Ctrl+B` during any subagent to send it to background and keep working.

---

## Detailed flows

### 1. Implement a feature

```
/implement Checkout API with async payment processing via BullMQ
```

Phases:

1. `principal-engineer` → design (sequential)
2. `architecture-challenger` → attack (sequential)
3. **Parallel:**
   - `backend-platform-engineer` → implement
   - `security-engineer` → security review
   - `observability-engineer` → instrument
4. `backend-platform-engineer` → tests (sequential)
5. `release-commander` → rollout plan (sequential)

### 2. Code review

```
/review [paste or describe the change]
```

**Parallel:**
- `backend-platform-engineer` → correctness, boundaries, errors
- `security-engineer` → auth, injection, data exposure
- `observability-engineer` → instrumentation gaps

Synthesize → **merge verdict:** safe / needs changes / blocked

### 3. PRD review

```
/prd [paste or describe the PRD]
```

**Parallel:**
- `principal-engineer` (prd-challenger) → is the problem real? is the gain worth it?
- `principal-engineer` (prd-metrics-reviewer) → baseline? guardrails?
- `principal-engineer` (prd-gap-detector) → what's missing?

Synthesize → **verdict:** approve / adjust / reject

### 4. ADR

```
/adr Decision: event sourcing vs state machine for orders
```

1. `principal-engineer` → draft ADR (sequential)
2. **Parallel:** `architecture-challenger` + `distributed-systems-skeptic`
3. `principal-engineer` → revise with findings → verdict

### 5. Incident

```
/incident P99 latency jumped from 200ms to 2s on /api/checkout
```

1. `staff-sre` → **CONTAIN NOW** (urgent, sequential)
2. **Parallel:** `backend-platform-engineer` (debug) + `observability-engineer` (telemetry)
3. Synthesize root cause (sequential)
4. `staff-sre` → postmortem + learning loop

### 6. Release

```
/release Deploy new payments API + schema migration
```

1. **Parallel:** `principal-engineer` (premortem) + `staff-sre` (prod readiness)
2. `release-commander` → final plan with gates + rollback triggers

---

## When to use subagents vs act directly

| Situation | Action |
|---|---|
| Simple question | Answer directly, no subagent |
| Single file edit | One subagent is enough |
| New feature | Full phased flow |
| PR review | Parallel fan-out |
| Incident | Urgent → parallel → postmortem |
| "Not sure which to use" | Describe what you need — `CLAUDE.md` routes it |

---

## Golden rule

When in doubt, describe what you need in natural language.
`CLAUDE.md` classifies and triggers the right flow with the right subagents.
