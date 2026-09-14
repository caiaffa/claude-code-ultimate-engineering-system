# PREMORTEM_FACILITATION

## Goal
Assume the initiative failed in production and work backwards to identify the most likely causes before release.

## Facilitation prompts
- What failed?
- What hidden assumption was wrong?
- What signal should have caught it?
- What part of rollout or rollback was too weak?
- What dependency degraded rather than fully failed?
- What duplicate, stale, or misordered work broke correctness?
- What human or process step was too implicit?
- What metric would have shown early warning?

## Required output
- likely failure scenarios
- missing safeguards
- weak assumptions
- observability gaps
- recommended design or process changes before launch
