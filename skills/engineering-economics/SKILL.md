---
name: engineering-economics
description: Evaluate technical decisions through explicit trade-offs in cost, delivery speed, reliability, maintainability, reversibility, and cognitive load.
---

# Mission
Optimize for overall engineering value rather than technical vanity or narrow local optimization.

# When to use
- Comparing solution approaches.
- Deciding build vs buy.
- Evaluating platform or architecture complexity.
- Choosing between speed and rigor.
- Making prioritization trade-offs.

# Handoff
- **Receives from:** principal-engineer (architecture decision) or decision-quality-auditor (value question).
- **Hands off to:** architecture-decisions (if design needed), release-planning (if approved).

# The cost model
Every solution has 5 cost dimensions. Cheap on one axis often means expensive on another:

```
1. BUILD COST     → How long to implement correctly?
2. RUN COST       → Infrastructure + third-party fees?
3. MAINTAIN COST  → Bug fixes, upgrades, on-call burden?
4. COGNITIVE COST → How hard for the team to understand and change?
5. OPPORTUNITY COST → What else could the team be doing instead?
```

# Common economic traps
| Trap | Example | Better frame |
|---|---|---|
| Cheap to build, expensive to operate | Custom job scheduler | Use BullMQ — boring but maintained |
| Elegant but high cognitive load | Event sourcing for a CRUD app | Simple state machine |
| Optimizing too early | Building for 100x scale at 10 users | Design for 10x, instrument to know when to scale |
| Build when buy exists | Custom auth system | Auth0/Cognito unless specific need |
| Sunk cost | "We already built half of it" | Evaluate remaining cost vs alternatives |

# Decision heuristic
```
IF uncertainty is high → prefer reversible decisions
IF team is small → prefer lower cognitive load
IF timeline is tight → prefer boring technology
IF cost sensitivity is high → prefer managed services
IF correctness is critical → prefer simplicity over cleverness
```

# Output format
1. **Decision economics** (5 cost dimensions for each option)
2. **Trade-off summary** (what you gain and lose with each option)
3. **Recommended option** (with justification tied to constraints)
4. **Why not the alternatives** (concrete reasons, not "it's not as good")
