---
description: "Full code review: correctness + security + tests + observability"
---

Run these review subagents in parallel on the code: $ARGUMENTS

**Subagent A — code-reviewer (backend-platform-engineer):**
- Review for correctness, boundaries, error handling, coupling
- Check against DEFINITION_OF_DONE.md
- Classify issues: 🔴 Block / 🟡 Should fix / 🔵 Suggestion / 🟢 Positive

**Subagent B — security-engineer:**
- Review for auth, injection, data exposure, secrets
- Block deploy for critical security issues

**Subagent C — observability-engineer:**
- Check if new code paths have adequate instrumentation
- Verify trace propagation, metric coverage, log correlation

After all complete, synthesize:
1. **Merge verdict:** safe / needs changes / blocked
2. **Combined findings** (deduplicated, prioritized)
3. **Missing tests** (specific scenarios)
