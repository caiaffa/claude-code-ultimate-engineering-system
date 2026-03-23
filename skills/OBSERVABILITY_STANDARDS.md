# OBSERVABILITY_STANDARDS

## Goal
Production behavior must be explainable. Telemetry should support diagnosis, not just dashboards.

## Tracing
- Trace critical journeys end-to-end.
- Preserve context across API, queue, worker, DB, and external calls.
- Use attributes that help diagnosis and business understanding.
- Avoid low-value spans that add noise without decision support.

## Metrics
- Prefer service, dependency, queue, and business-health metrics tied to action.
- Use RED/USE style thinking where helpful.
- Avoid label cardinality explosions.
- Every alerting metric should map to an operator decision.

## Logging
- Use structured logs.
- Include correlation identifiers where possible.
- Log state transitions, retries, dependency failures, and irreversible actions.
- Do not leak secrets or sensitive data.

## Alerts
- Alerts should fire on actionable conditions.
- Alert on user impact, queue health, error budget burn, dependency degradation, or safety boundary breach.
- Avoid noisy alerts without runbooks or decision guidance.

## Minimum expectations by change type
### API changes
- request visibility
- error visibility
- latency visibility
- dependency visibility

### Queue and worker changes
- enqueue visibility
- processing latency
- failure classification
- permanent failure visibility
- stuck or delayed job visibility

### Database-sensitive changes
- query latency visibility
- lock/contention signals where possible
- migration progress or validation visibility

## Review questions
- Can an on-call engineer identify the failing layer quickly?
- Can they correlate cause across systems?
- Can they distinguish transient from structural failure?
- Can they tell whether the system is recovering or getting worse?
