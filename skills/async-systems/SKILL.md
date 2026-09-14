---
name: async-systems
description: Design and review queues, workers, and event-driven flows — idempotency, delivery guarantees, contract safety, and partial-failure handling. Covers Redis/BullMQ workers and async invariants/contracts.
allowed-tools: Read, Grep, Glob
---

# Mission
Make asynchronous workflows correct under at-least-once delivery, retries, and partial failure — and guarantee the contracts between producers and consumers hold.

# When to use
- Designing or reviewing a queue, worker, or event flow.
- Adding a BullMQ consumer or a background job.
- Verifying producer/consumer contracts.

# Handoff
- Receives from: architecture-decisions or principal-engineer.
- Hands off to: backend-platform-engineer (implement), observability (async trace continuity).

# Delivery & idempotency
- Assume at-least-once delivery: every consumer MUST handle duplicates safely.
- Idempotency key on every job; dedupe before side effects.
- Distinguish retryable errors from poison messages; cap retries; route to DLQ.
- No unbounded retry — exponential backoff with a ceiling.

# Contract safety
- The job payload is a contract: version it; never break a field consumers read.
- Producers and consumers must agree on schema; additive changes only without a migration.
- Document ordering guarantees — if none, consumers must not assume order.

# Partial failure
- A job that does 3 things: what happens if it dies after thing 2?
- Make multi-step jobs resumable or each step idempotent.
- Compensation path for non-transactional side effects.

# Operational
- Graceful shutdown: drain in-flight jobs, stop accepting new ones.
- Visibility timeout > realistic max processing time.
- Queue depth and job-age must be observable.

# Red flags
- Consumer with side effects and no idempotency key.
- Retries with no DLQ. Job payload with no version. "Order is guaranteed" with no mechanism.

# Output
Implementation/review notes covering: delivery guarantee assumed, idempotency mechanism, retry + DLQ policy, partial-failure behavior, contract version, shutdown handling.
