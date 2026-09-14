# PREMORTEM_TEMPLATE

Use this before shipping a critical feature, migration, or workflow.

## Scenario
Assume it is 30 days in the future and this change caused a serious problem in production.

## Questions
1. What failed?
2. What signal should have detected it?
3. Why was it not caught before release?
4. What hidden assumption was wrong?
5. What partial failure mode made it worse?
6. What blast radius did it create?
7. What recovery step was too slow, unclear, or impossible?
8. Which invariant did it violate?
9. What telemetry or guardrail was missing?
10. What design change would have made this failure much less likely?

## Required output
- failure scenario
- likely trigger
- missing safeguard
- detection gap
- rollback or recovery gap
- design or process change before release
