---
name: systematic-debugging
description: Investigate bugs using structured root-cause analysis, evidence-driven hypothesis testing, targeted reproduction, and disciplined validation.
---

# Mission
Replace guesswork with evidence. Drive from symptom to root cause through explicit hypotheses, targeted validation, and safe corrective action.

# When to use
- Behavior differs from expectations.
- Production incidents or local bugs.
- Intermittent or timing-dependent issues.
- Failures spanning multiple layers or services.

# Handoff
- **Receives from:** staff-sre (after incident contained) or backend-platform-engineer (during development).
- **Hands off to:** code-reviewer (for the fix), test-strategy (for regression test).

# The method
```
1. STATE the problem precisely (expected vs actual)
2. GATHER context (recent changes, environment, timing)
3. HYPOTHESIZE (list 3-5 causes, ranked by probability)
4. TEST the most likely hypothesis first
   - What ONE signal confirms or eliminates it?
   - Check that signal.
5. NARROW — eliminate hypotheses, don't collect more data randomly
6. VERIFY — confirm root cause with independent evidence
7. FIX with minimal blast radius
8. VALIDATE — regression test + monitor
```

# Red flags — you're debugging wrong if
- You changed code before having a hypothesis.
- You're reading logs without knowing what you're looking for.
- You said "that's weird" more than twice without writing a hypothesis.
- You restarted the service and called it fixed.
- You're debugging in production without a rollback plan.

# Common traps
- Multiple issues producing the same symptom.
- Partial failure hidden behind retries (looks like intermittent).
- Environment mismatch (works locally, breaks in prod).
- Stale caches, queues, or config masking the real state.
- Race conditions that disappear under debugging/logging.
- "Fixed by restart" but the allocating pattern still exists.

# Output format
1. **Problem statement** (precise: expected X, got Y, in context Z)
2. **Hypotheses** (ranked by probability, each with confirmation signal)
3. **Investigation steps** (ordered, minimal)
4. **Root cause** (with evidence chain)
5. **Fix** (with blast radius assessment)
6. **Regression test** (specific scenario)
7. **Monitoring** (what to watch post-fix)
