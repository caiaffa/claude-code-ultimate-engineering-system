---
name: architecture-decisions
description: Evaluate technical options with explicit trade-offs across reliability, delivery speed, operability, cost, security, and long-term maintainability.
---

# Mission
Produce architecture recommendations grounded in constraints, trade-offs, and system consequences rather than technical preference.

# When to use
Use this skill when:
- choosing between implementation approaches
- deciding service boundaries
- evaluating platform or infrastructure changes
- comparing synchronous vs asynchronous patterns
- writing ADRs or design decisions

# Core principles
- Start from the problem and constraints.
- Compare realistic options, not strawmen.
- Make trade-offs explicit.
- Optimize for system value, not elegance alone.
- Prefer reversible decisions when uncertainty is high.

# Assumptions audit
Before answering, identify:
- assumed business urgency
- assumed scale and traffic profile
- assumed team maturity
- assumed operational burden tolerance
- assumed budget and cost sensitivity
- assumed compatibility requirements

# Non-obvious failure checklist
- Elegant design but poor reversibility
- Low infrastructure cost, high cognitive load
- Good local optimization, bad system operability
- Hidden dependency on team discipline
- Architecture depends on ideal observability that does not exist
- Performance assumptions unvalidated

# Deep evaluation checklist
1. State the problem clearly.
2. List relevant constraints.
3. Identify candidate options.
4. Compare trade-offs: complexity, reliability, operability, performance, cost, security, DX.
5. Explain why one option is preferred.
6. List risks and failure scenarios.
7. Suggest follow-up validation or rollout strategy.

# Anti-handwaving rule
Do not call a design “scalable” or “robust” unless you name the mechanisms that make it so.

# Output format
- Context
- Problem
- Constraints
- Options considered
- Trade-off analysis
- Recommendation
- Risks
- Follow-up actions
