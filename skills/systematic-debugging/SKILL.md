---
name: systematic-debugging
description: Isolate the root cause of a bug, failure, or flaky test through disciplined hypothesis testing — and trace the full cause chain, not just the surface symptom.
allowed-tools: Read, Grep, Glob, Bash
---

# Mission
Find the real root cause fast, with evidence — never patch a symptom.

# When to use
- A bug, regression, flaky test, or unexpected behavior.
- An incident investigation needs a confirmed cause.

# Handoff
- Receives from: reliability-engineer (during incidents) or backend-platform-engineer.
- Hands off to: backend-platform-engineer (fix) or incident-response (if production).

# Method — hypothesis discipline
1. **State the symptom precisely.** What is observed vs. expected? When did it start? What changed?
2. **List the top 3 hypotheses.** Rank by likelihood.
3. **For each, name the ONE signal that confirms or kills it.** A log line, a value, a test result.
4. **Test in order — cheapest signal first.** Do not guess-fix.
5. **Confirm before fixing.** You must be able to explain the full chain: trigger → mechanism → symptom.

# Root-cause depth
Ask "why" until you reach something you can actually change:
- Symptom: request times out.
- Why? Query takes 8s. Why? Missing index. Why? Migration added a filter column without one. Why? No review step catches index gaps.
The fix at depth 2 stops this bug; the fix at depth 4 stops the class.

# Flaky tests
- Reproduce with repeated runs before declaring it flaky.
- Usual causes: shared state, timing/sleep, ordering, external dependency, real clock.

# Red flags — stop
- About to change code without a confirmed hypothesis.
- "It works now" with no explanation of why it broke.
- Fixing the symptom while the trigger remains.

# Output
```
# DEBUG REPORT
Symptom: [precise]
Confirmed root cause: [with evidence]
Full chain: trigger -> mechanism -> symptom
Fix: [symptom-level] / Prevention: [class-level]
```
