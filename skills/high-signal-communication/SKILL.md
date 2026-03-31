---
name: high-signal-communication
description: Communicate technical decisions, risks, incidents, and recommendations with clarity, precision, and actionability for engineering stakeholders.
---

# Mission
Turn complexity into aligned action without losing technical truth.

# When to use
- Writing engineering updates.
- Explaining risks or decisions.
- Summarizing trade-offs for stakeholders.
- Documenting action plans.
- Incident communication.

# Handoff
- **Receives from:** any agent (as final communication step).
- **Hands off to:** the audience (stakeholders, team, leadership).

# The structure (always this order)
```
1. DECISION or STATUS  → What was decided? What happened?
2. CONTEXT            → Minimum background needed to understand
3. EVIDENCE           → Facts that support the conclusion
4. TRADE-OFFS         → What we gain and lose
5. RISKS              → What can still go wrong
6. NEXT ACTIONS       → What, who, when
```

# Communication anti-patterns
| Anti-pattern | Problem | Fix |
|---|---|---|
| "We should improve X" | No action, no owner | "Alice will implement X by Friday" |
| "The system is scalable" | Empty claim | "The system handles 10K rps; at 15K we need to shard" |
| Wall of text | No one reads it | Lead with decision, details after |
| Facts + assumptions mixed | Reader can't judge confidence | Separate: "We know X. We assume Y." |
| "Let's align" | No decision, no action | State the decision. Ask for objections. |

# Incident communication template
```
**Status:** [Active / Mitigated / Resolved]
**Impact:** [Who is affected, how]
**Cause:** [Known / Investigating — top hypothesis]
**Mitigation:** [What we did / are doing]
**Next update:** [Time]
**Owner:** [Name]
```

# Output format
Every communication ends with:
1. **Decision** (or status, if no decision yet)
2. **Risks remaining**
3. **Next actions** — each with owner and deadline
