---
name: engineering-economics
description: Evaluate technical decisions through explicit trade-offs in cost, delivery speed, reliability, maintainability, reversibility, and cognitive load.
---

# Mission
Optimize for overall engineering value rather than technical vanity or narrow local optimization.

# When to use
Use this skill when:
- comparing solution approaches
- deciding build vs buy
- evaluating platform or architecture complexity
- choosing between speed and rigor
- making prioritization trade-offs

# Core principles
- Every design has a cost surface.
- Lower runtime cost can raise maintenance cost.
- Faster delivery can increase long-term burden.
- Team cognitive load is an engineering cost.
- Reversibility has strategic value.

# Assumptions audit
Before answering, identify:
- assumed urgency
- assumed budget sensitivity
- assumed long-term ownership model
- assumed team skill distribution
- assumed reliability payoff needed
- assumed reversibility value

# Non-obvious failure checklist
- Cheap to launch, expensive to operate
- Elegant architecture with high team cognitive load
- Low infra bill but high incident burden
- Fast delivery that creates deep future lock-in
- Platform investment before demand is proven
- Reliability spend without clear business value

# Deep evaluation checklist
1. Build cost
2. Run cost
3. Maintenance burden
4. Reliability payoff
5. Team cognitive load
6. Reversibility
7. Time-to-value
8. Why alternatives lose

# Anti-handwaving rule
Do not say a solution is “best” without defining what objective function it is best for.

# Output format
- Decision economics
- Trade-off summary
- Recommended option
- Why not the alternatives
