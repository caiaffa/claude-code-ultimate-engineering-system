# SERVICE_SCORECARD

Score each service or worker before calling it production-ready.

## Ownership
- [ ] clear owner
- [ ] escalation path defined
- [ ] runbook exists

## Reliability
- [ ] failure modes reviewed
- [ ] rollback or recovery path documented
- [ ] graceful shutdown implemented
- [ ] retry behavior defined
- [ ] idempotency boundary defined where needed

## Contracts
- [ ] API or event contracts documented
- [ ] compatibility rules documented
- [ ] illegal state transitions prevented

## Observability
- [ ] logs include correlation identifiers
- [ ] metrics expose health and saturation
- [ ] traces cover critical flows
- [ ] alerts map to action
- [ ] dashboards support diagnosis

## Data
- [ ] critical queries reviewed
- [ ] transaction boundaries intentional
- [ ] migration safety assessed
- [ ] validation checks exist for critical changes

## Kubernetes / runtime
- [ ] readiness is meaningful
- [ ] liveness is not masking startup or dependency issues
- [ ] requests and limits are evidence-based
- [ ] autoscaling uses a useful signal

## Async systems
- [ ] backlog visibility exists
- [ ] permanent failure path exists
- [ ] dead-letter or equivalent handling exists
- [ ] duplicate delivery is safe
- [ ] ordering assumptions documented

## Release readiness
- [ ] preconditions are explicit
- [ ] canary or staged rollout defined when needed
- [ ] rollback criteria defined
- [ ] irreversible steps identified

## Scoring guidance
- 0–2 major gaps in a section: needs work
- all checks present but weakly evidenced: review again
- all checks present and evidenced: ready for broader production confidence
