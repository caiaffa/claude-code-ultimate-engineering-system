# PROJECT_CONVENTIONS

Use this file to teach Claude the local rules of the repository. Keep it concise, explicit, and opinionated.

## Architecture boundaries
- Controllers must stay transport-focused.
- Business logic belongs in application/domain services.
- Repositories own persistence access.
- External integrations live behind adapters.
- Shared libraries must not become dependency dumping grounds.

## Naming rules
- Prefer business language over technical slang in module names.
- Name queues and jobs by business outcome, not implementation detail.
- Use stable event names and version deliberately.
- Metric and span names should match critical user or business flows.

## Testing strategy
- Unit tests for pure business logic.
- Integration tests for database, queue, and HTTP contracts.
- Regression tests for every production bug.
- Characterization tests before risky refactors.

## Retry and timeout policy
- Retries must be explicit, bounded, and classified by error type.
- Every external dependency should have timeouts.
- Async processing must assume at-least-once delivery unless proven otherwise.
- Idempotency must exist at the business boundary, not only inside queue mechanics.

## Data and migration rules
- Prefer additive migrations first, destructive changes later.
- Roll forward when safe; roll back only with explicit data impact analysis.
- Any migration that can lock hot tables needs rollout planning and observability.

## Telemetry conventions
- Every critical flow should be traceable across API, queue, worker, DB, and external integrations.
- Logs must include correlation identifiers when possible.
- Avoid high-cardinality metric labels unless justified by diagnostic value.
- Alerts must map to operator actions.

## Kubernetes and runtime rules
- Readiness must represent real dependency usability.
- Graceful shutdown is mandatory for APIs and workers.
- Resource requests and limits should be evidence-based.
- Autoscaling must follow real bottlenecks, not guesswork.

## Communication rules
- Separate facts, assumptions, and recommendations.
- End engineering proposals with risks, next actions, and ownership.
- Avoid words like scalable, resilient, robust, or production-ready without proving why.

## Do
- Prefer incremental delivery.
- Make contracts explicit.
- Design for detection and containment.
- Optimize for operability, not only elegance.

## Do not
- Hide business logic in controllers, guards, pipes, or interceptors.
- Assume exactly-once processing on Redis/BullMQ.
- Merge risky changes without rollback thinking.
- Accept silent failure or missing telemetry on critical paths.
