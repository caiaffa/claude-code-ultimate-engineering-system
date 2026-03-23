# RELEASE_RULES

## Principles
- Prefer staged rollout over all-at-once release.
- Define success and failure signals before deploying.
- Rollback must be realistic, not ceremonial.
- Irreversible steps require explicit acknowledgement.

## Pre-release checklist
- Change summary is clear.
- Dependencies and ordering are known.
- Feature flags are identified when applicable.
- Monitoring and alerts for changed paths exist.
- Rollback steps are documented.
- Data migration impact is understood.

## Rollout rules
- Start with the smallest safe blast radius.
- Observe key signals between rollout steps.
- Do not expand rollout while diagnosis is unclear.
- Pause rollout on unexplained error, latency, queue lag, or resource instability.

## Rollback rules
- Roll back when user impact is growing and cause is not yet controlled.
- Roll back when compatibility assumptions are broken.
- Roll back when telemetry shows the system is outside safe thresholds and mitigation is uncertain.
- Do not assume code rollback restores data state.

## Queue and async rules
- Do not increase retries during incidents without understanding duplicate side effects.
- Watch queue lag, active jobs, failure rates, and job age.
- Treat dead-letter growth as a signal of correctness or dependency failure, not just capacity.

## Migration rules
- Prefer expand-and-contract for hot paths.
- Separate deploy from activation when possible.
- Validate reads and writes before cleanup steps.
- Destructive cleanup should follow observed stability, not deploy completion alone.

## Communication rules
- State the decision.
- State the current risk.
- State the next action.
- State the owner.
