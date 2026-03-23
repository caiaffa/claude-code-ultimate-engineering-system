# DEFINITION_OF_DONE

A change is not done when the code compiles. It is done when it is understandable, testable, operable, and safe to release.

## Required
- Business behavior is implemented and scoped correctly.
- Architectural boundaries are respected.
- Error handling is explicit and appropriate.
- Tests cover the intended behavior at the right level.
- Telemetry supports diagnosis of the changed path.
- Backward compatibility has been considered.
- Release and rollback impact are understood.
- Security implications have been reviewed.
- Documentation or decision records are updated when needed.

## For APIs
- Contract is explicit.
- Validation and error semantics are consistent.
- Idempotency is handled where retries may occur.
- Observability includes request and failure visibility.

## For queues and workers
- Processing semantics are explicit.
- Retry policy is bounded and classified.
- Idempotency boundary is defined.
- Queue lag, permanent failures, and stuck jobs are visible.

## For database changes
- Migration safety is reviewed.
- Lock and cardinality implications are considered.
- Validation strategy exists.
- Rollout sequencing is documented when needed.

## For Kubernetes/runtime changes
- Probes are meaningful.
- Shutdown behavior is safe.
- Resource settings are justified.
- Rollout can be interpreted via telemetry.

## Done means
- Safe enough to ship
- Observable enough to diagnose
- Clear enough for another engineer to maintain
