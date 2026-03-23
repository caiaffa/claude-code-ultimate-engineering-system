---
name: prd-metrics-reviewer
description: Review PRD metrics for baseline quality, success criteria, guardrails, time horizon, and post-launch measurement credibility.
---

# Mission
Ensure the PRD can actually tell whether the initiative succeeded or failed.

# When to use
Use this skill when:
- reviewing PRD measurement sections
- checking baselines and targets
- validating guardrails
- improving post-launch evaluation quality

# Core principles
- Metrics must be measurable, timely, and decision-useful.
- Baseline quality matters as much as target quality.
- Guardrails prevent false wins.
- Measurement timing must match expected system behavior.

# Assumptions audit
Before answering, identify:
- assumed primary metric
- assumed baseline source
- assumed target horizon
- assumed guardrail set
- assumed reporting latency
- assumed post-launch observability

# Non-obvious failure checklist
- target chosen without stable baseline
- success metric too lagging
- no guardrail for reliability, fraud, cost, or support burden
- metric influenced by unrelated seasonality or traffic mix
- no decision threshold after launch

# Deep evaluation checklist
1. Is the primary metric meaningful?
2. Is the baseline credible?
3. Is the target realistic and useful?
4. Are guardrails sufficient?
5. When and how will measurement happen?
6. What result means the hypothesis failed?

# Anti-handwaving rule
Do not accept “we’ll monitor results” without defined metrics, thresholds, and timing.

# Output format
- metrics quality assessment
- baseline gaps
- missing guardrails
- timing issues
- post-launch measurement recommendations
