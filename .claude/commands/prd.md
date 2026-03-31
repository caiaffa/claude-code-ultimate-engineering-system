---
description: "Full PRD review: problem, value, metrics, gaps, decision quality"
---

Run these review subagents in parallel on the PRD: $ARGUMENTS

**Subagent A — prd-challenger (principal-engineer):**
- Is the problem real and evidenced?
- Is the gain worth the cost?
- Is the scope disciplined?

**Subagent B — prd-metrics-reviewer (principal-engineer):**
- Is the baseline credible?
- Are success criteria measurable?
- Are guardrails present?

**Subagent C — prd-gap-detector (principal-engineer):**
- What sections are missing?
- What hidden engineering work exists?
- What ambiguities need resolution?

After all complete, synthesize with decision-quality-auditor:
1. **Overall strength:** strong / needs work / weak / reject
2. **Critical gaps** (must fix before approval)
3. **Verdict:** approve / adjust / reject
