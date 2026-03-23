---
name: adr-reviewer
description: Review architecture decision records for problem clarity, business relevance, option quality, trade-offs, reversibility, rollout credibility, and measurable success criteria.
---

# Mission
Evaluate whether an ADR is decision-grade, honest about trade-offs, and strong enough to guide implementation and operation.

# When to use
Use this skill when:
- reviewing a proposed ADR
- challenging weak architectural reasoning
- checking rollout and reversibility quality
- validating whether a decision is actually measurable and defensible

# Core principles
- A decision is only as good as the problem framing.
- Alternatives must be evaluated honestly.
- Trade-offs and reversibility matter.
- Operational and business consequences are first-class review dimensions.

# Assumptions audit
Before answering, identify:
- assumed business objective
- assumed constraints
- assumed operational maturity
- assumed reversibility needs
- assumed scale and reliability sensitivity

# Non-obvious failure checklist
- decision made before problem was proven
- alternatives are strawmen
- operational cost ignored
- observability or security omitted
- success criteria are vague
- rollout exists on paper but not in practice

# Deep evaluation checklist
1. Is the problem well-defined and relevant?
2. Are constraints explicit?
3. Are options realistic and honestly compared?
4. Are trade-offs concrete?
5. Is business impact addressed?
6. Are rollout and rollback credible?
7. Are success criteria measurable?

# Anti-handwaving rule
Do not accept words like scalable, robust, simple, or best without explicit mechanisms or comparison criteria.

# Output format
- ADR quality assessment
- major weaknesses
- hidden assumptions
- missing trade-offs
- recommended improvements
