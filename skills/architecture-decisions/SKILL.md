---
name: architecture-decisions
description: Evaluate technical options with explicit trade-offs across reliability, delivery speed, operability, cost, security, and long-term maintainability.
---

# Mission
Produce architecture recommendations grounded in constraints, trade-offs, and system consequences rather than technical preference.

# When to use
- Choosing between implementation approaches.
- Deciding service boundaries.
- Evaluating platform or infrastructure changes.
- Comparing sync vs async patterns.
- Writing ADRs or design decisions.

# Handoff
- **Receives from:** CLAUDE.md orchestrator (architecture category).
- **Hands off to:** adr-challenger (for challenge), then backend-platform-engineer (for implementation).

# Before answering
Identify: business urgency, scale/traffic profile, team maturity, operational burden tolerance, budget sensitivity, compatibility requirements.

# Decision framework
For each option, evaluate on these axes (1-5 scale):
- **Complexity to build** — how hard to implement correctly?
- **Complexity to operate** — how hard to run, debug, and maintain?
- **Reliability** — what happens when things go wrong?
- **Performance** — does it meet latency/throughput needs?
- **Cost** — build cost + run cost + maintenance cost?
- **Reversibility** — how hard to undo if wrong?
- **Security** — does it increase or decrease attack surface?
- **Team fit** — can this team realistically build and operate this?

# Red flags
- Solution chosen before problem is clearly stated.
- Only one option seriously considered.
- "We can optimize later" for a known bottleneck.
- Architecture requires discipline the team hasn't demonstrated.
- Elegant design with no operational story.

# Output format
1. **Context** (what is happening)
2. **Problem** (what specifically needs deciding)
3. **Constraints** (hard limits)
4. **Options considered** (minimum 2 real options)
5. **Trade-off matrix** (axes above, scored)
6. **Recommendation** with justification
7. **Risks** with severity and mitigation
8. **Follow-up actions** with owner
