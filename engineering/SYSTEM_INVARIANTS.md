# SYSTEM_INVARIANTS

These are non-negotiable truths the system must preserve. Every design, implementation, migration, and incident response should be evaluated against them.

## Core invariants

1. **No duplicate irreversible business effect**
   - No job, retry, replay, or duplicate request may create a duplicate irreversible business action.
   - Financial, legal, or user-visible state changes must be protected by idempotency boundaries.

2. **No illegal state transition**
   - A domain entity must not move into an invalid or contradictory state.
   - State transitions must be explicit and enforceable server-side.

3. **No hidden dependency on perfect ordering**
   - Consumers must not assume perfect event ordering unless the mechanism guarantees it and the guarantee is documented.
   - Late or duplicate events must be handled safely.

4. **No silent contract breakage**
   - APIs, events, and queue payloads must evolve with explicit compatibility rules.
   - Schema stability is not enough; semantics must remain compatible.

5. **No release that depends on tribal knowledge**
   - Production changes must not require hidden manual steps.
   - Preconditions, sequencing, monitoring, and rollback must be documented.

6. **No critical workflow without detection**
   - Important failures must have a detection path.
   - Silent corruption, stuck queues, and partial failures are priority design defects.

7. **No retry without safety**
   - Every retry strategy must define:
     - retryable failure class
     - backoff policy
     - max attempts or age
     - idempotency boundary
     - permanent failure handling

8. **No critical queue without backlog visibility**
   - Every important queue must expose backlog, age, processing latency, failure rate, and stuck-job visibility.

9. **No service judged healthy only because the process started**
   - Readiness must reflect actual dependency usability and ability to serve.
   - Health checks must not provide false confidence.

10. **No observability that cannot support diagnosis**
    - Logs, metrics, and traces must allow an engineer to reconstruct critical failure paths.
    - Correlation IDs and async trace continuity matter more than telemetry volume.

11. **No migration with hidden irreversibility**
    - Schema or data migrations must identify irreversible steps.
    - Rollback must address code and data state, not just one of them.

12. **No broad trust without explicit boundary**
    - Service trust, IAM permissions, and internal access assumptions must be explicit and minimal.

## Enforcement expectations
For each critical service or workflow, document:
- invariant owner
- enforcement point
- failure signal
- rollback or recovery path
- related runbook
