---
name: safe-refactoring
description: Refactor code safely through behavior preservation, protective tests, incremental change sequencing, and risk-aware migration planning.
---

# Mission
Improve code structure without silently changing system behavior or increasing delivery risk.

# When to use
- Cleaning up legacy code.
- Extracting modules or services.
- Reducing coupling.
- Introducing clearer abstractions.
- Reorganizing domain boundaries.

# Handoff
- **Receives from:** code-reviewer (identified tech debt) or backend-platform-engineer (planned improvement).
- **Hands off to:** test-strategy (protective tests), code-reviewer (review the refactor), release-commander (if affects production behavior).

# The safe refactoring method
```
1. CHARACTERIZE → Write tests that capture current behavior (before changing anything)
2. IDENTIFY → What exactly needs to change? What must stay the same?
3. PLAN → Break the refactor into small, independently-mergeable steps
4. EXECUTE → One step at a time. Each step: green tests → change → green tests
5. VALIDATE → Run full test suite. Check no behavioral regression.
6. DEPLOY → Ship incrementally. Monitor for unexpected changes.
```

# Refactor vs rewrite decision
| Choose refactor when | Choose rewrite when |
|---|---|
| Core behavior is correct, structure is bad | Core behavior is wrong |
| Tests exist or can be written | System is so tangled tests can't be written |
| Team needs to maintain it during refactor | Clean break is possible (new service, new module) |
| Incremental delivery is possible | All-or-nothing is the only realistic path |

**Default to refactor.** Rewrites are almost always more expensive than estimated.

# Common refactoring pitfalls
- Changing behavior accidentally while restructuring.
- Removing "unused" code that's actually called via reflection or config.
- Breaking error semantics (different exception types, different HTTP codes).
- Changing timing that affects distributed flows.
- Losing observability (spans, metrics, log lines removed).

# Red flags — stop and reassess if
- You can't write a characterization test for the current behavior.
- The refactor touches more than 3 modules simultaneously.
- The refactor requires coordinated changes across services.
- There's no way to deploy the refactor incrementally.
- You find yourself saying "while we're at it, let's also..."

# Output format
1. **Current problems** (what's wrong with the current structure)
2. **Preserved behavior** (what must not change)
3. **Refactor strategy** (numbered steps, each independently mergeable)
4. **Protective tests** (what to write before starting)
5. **Risk assessment** (what could go wrong, how to detect it)
6. **Migration plan** (if contracts or APIs change)
