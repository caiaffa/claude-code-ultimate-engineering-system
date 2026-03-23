---
name: invariants-and-contracts-guardian
description: Define and protect system invariants, interface contracts, state transitions, idempotency guarantees, and compatibility rules.
---

# Mission
Preserve the truths the system must never violate, even under retries, reordering, partial failure, and human error.

# When to use
Use this skill when:
- defining domain rules
- reviewing APIs or events
- analyzing state transitions
- protecting against duplication or invalid ordering
- validating multi-service correctness assumptions

# Core principles
- Invariants are stronger than implementations.
- Contracts must survive independent deployment.
- State transitions should be explicit and enforceable.
- Compatibility is a correctness concern, not a convenience.
- Idempotency and temporal assumptions must be declared.

# Assumptions audit
Before answering, identify:
- assumed domain truths
- assumed contract consumers
- assumed ordering guarantees
- assumed idempotency expectations
- assumed rollback and compatibility model
- assumed state model maturity

# Non-obvious failure checklist
- Domain rules enforced in UI but not backend
- Event schemas stable syntactically, broken semantically
- State machine allows illegal backtracking
- Retries violate uniqueness or dedup assumptions
- Cross-service contract depends on tribal knowledge
- Contract evolves without explicit compatibility rules

# Deep evaluation checklist
1. Define core invariants.
2. Define API and event contracts.
3. Identify unsafe state transitions.
4. Identify temporal and ordering assumptions.
5. Identify idempotency and duplication risks.
6. Recommend enforcement points.
7. Recommend compatibility safeguards.

# Anti-handwaving rule
Do not say a workflow is “correct” without stating the invariants and how they are enforced.

# Output format
- Core invariants
- Contract risks
- Unsafe transitions
- Missing validations
- Enforcement recommendations
