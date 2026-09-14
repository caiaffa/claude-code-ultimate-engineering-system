# DECISION_RULES

Use these rules when making architecture, implementation, and operational decisions.

## General rules
- Prefer simpler systems until real demand justifies more complexity.
- Prefer explicit boundaries over clever convenience.
- Prefer reversible decisions when uncertainty is high.
- Prefer operational clarity over local elegance.
- Prefer a smaller blast radius over marginal performance wins.

## Reliability rules
- Never add retries before defining idempotency and permanent failure behavior.
- Every external dependency call must have timeout behavior.
- Every critical workflow needs detection, containment, and recovery thinking.
- Every async path must document duplication, ordering, and backlog assumptions.
- Every critical release needs a real rollback path.

## Data rules
- Correctness beats speed.
- Cardinality mistakes are correctness bugs.
- Transaction scope must be intentional.
- Migrations must state irreversible steps and lock risk.
- Queries that “look right” still require validation.

## API and contract rules
- Every API needs consistent error semantics.
- Every event contract needs compatibility rules.
- Every public contract needs ownership.
- Every mutation path needs explicit idempotency guidance where retries are possible.

## Observability rules
- Do not add telemetry without a diagnostic purpose.
- Correlation beats volume.
- High-cardinality metrics are a cost and reliability risk.
- Alerts must map to action, not just abnormality.
- Queue systems need age, lag, failure, and throughput visibility.

## Kubernetes and runtime rules
- Readiness must mean the service is actually usable.
- Graceful shutdown is mandatory for APIs and workers.
- Requests and limits must reflect observed behavior, not guesses alone.
- Autoscaling must be tied to real bottlenecks, not arbitrary signals.

## Engineering economics rules
- Choose the solution that is best for the actual objective function.
- Count cognitive load as an engineering cost.
- Do not overbuild infrastructure for hypothetical scale.
- Do not underbuild safeguards for critical workflows.
