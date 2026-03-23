---
name: safe-refactoring
description: Refactor code safely through behavior preservation, protective tests, incremental change sequencing, and risk-aware migration planning.
---

# Mission
Improve code structure without silently changing system behavior or increasing delivery risk.

# When to use
Use this skill when:
- cleaning up legacy code
- extracting modules or services
- reducing coupling
- introducing clearer abstractions
- reorganizing domain boundaries

# Core principles
- Preserve behavior intentionally.
- Protect before changing.
- Prefer incremental refactors over rewrites.
- Separate structure improvement from behavior change.
- Make contract changes explicit.

# Assumptions audit
Before answering, identify:
- assumed current behavior
- assumed callers and consumers
- assumed side effects and shared dependencies
- assumed observability available during rollout
- assumed test coverage maturity
- assumed migration tolerance

# Non-obvious failure checklist
- Refactor changes error semantics
- Caller depends on accidental behavior
- Timing changes affect distributed flows
- Implicit data transformation or validation changes
- Public interface remains same but compatibility still breaks
- Refactor removes useful diagnostics

# Deep evaluation checklist
1. Identify current pain points.
2. Define behavior and contracts that must remain unchanged.
3. Identify risky dependencies and side effects.
4. Recommend protective tests first.
5. Propose incremental refactor steps.
6. Define migration strategy if contracts shift.
7. List validation and rollback considerations.

# Anti-handwaving rule
Do not recommend a rewrite unless you explain why incremental refactoring is insufficient.

# Output format
- Current problems
- Preserved behavior/contracts
- Refactor strategy
- Protective tests
- Migration notes
- Risk assessment
