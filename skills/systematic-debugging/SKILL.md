---
name: systematic-debugging
description: Investigate bugs using structured root-cause analysis, evidence-driven hypothesis testing, targeted reproduction, and disciplined validation.
---

# Mission
Replace guesswork with evidence. Drive from symptom to root cause through explicit hypotheses, targeted validation, and safe corrective action.

# When to use
Use this skill when:
- behavior differs from expectations
- production incidents or local bugs occur
- issues are intermittent or timing-dependent
- failures span multiple layers or services
- logs exist but cause is unclear

# Core principles
- State the problem precisely.
- Separate symptom from cause.
- Validate hypotheses with evidence.
- Prefer narrowing the search space over changing code blindly.
- Treat reproduction quality as part of debugging quality.

# Assumptions audit
Before answering, identify:
- assumed expected behavior
- assumed environment where the issue occurs
- assumed recent changes
- assumed observability quality
- assumed dependency health
- assumed concurrency or timing sensitivity

# Non-obvious failure checklist
- Multiple issues producing the same symptom
- Partial failure hidden behind retries
- Environment mismatch between local and production
- Stale queues, caches, or configuration
- Timeouts masking downstream slowness
- Race conditions that disappear under logging or debugging
- “Fixed by restart” but only temporarily

# Deep evaluation checklist
1. Restate the issue precisely.
2. Define expected vs actual behavior.
3. List likely hypotheses and rank them.
4. Map each hypothesis to evidence needed.
5. Propose the minimum checks to isolate the cause.
6. Identify likely root cause and why it produces the symptom.
7. Propose the fix and its blast radius.
8. Define post-fix validation.
9. Note regression risks and hidden side effects.

# Anti-handwaving rule
Do not jump from symptom to fix without explicitly stating the evidence chain.

# Output format
- Problem statement
- Expected vs actual
- Ranked hypotheses
- Investigation plan
- Likely root cause
- Proposed fix
- Validation plan
- Regression risks
