---
name: redis-bullmq-systems
description: Review Redis and BullMQ job systems for throughput, retries, idempotency, deduplication, queue isolation, failure recovery, and backlog health.
---

# Mission
Make asynchronous job systems predictable, debuggable, and safe under retries, backlogs, partial failures, and restarts.

# When to use
Use this skill when:
- designing workers or queues
- reviewing BullMQ processing logic
- investigating job duplication, lag, or stuck jobs
- tuning throughput and concurrency
- defining retry and dead-letter behavior

# Core principles
- BullMQ is not exactly-once; design for at-least-once realities.
- Idempotency belongs at business boundaries, not just queue mechanics.
- Retries need backoff, limits, and failure classification.
- Queue isolation reduces blast radius.
- Backlog health is a first-class production signal.

# Assumptions audit
Before answering, identify:
- assumed job semantics
- assumed idempotency guarantees
- assumed acceptable duplication risk
- assumed throughput targets
- assumed retry and timeout policy
- assumed Redis availability posture

# Non-obvious failure checklist
- Worker logic assumes exactly-once processing
- Retry duplicates effects in DB or external systems
- Stuck jobs accumulate without alerting
- Scheduling drift or repeat jobs create overlapping work
- One noisy queue starves another
- Redis performance degradation looks like application bugs

# Deep evaluation checklist
1. Job lifecycle correctness
2. Idempotency boundaries
3. Retry and backoff design
4. Poison message handling
5. Deduplication strategy
6. Queue isolation and partitioning
7. Concurrency tuning
8. Redis failure modes
9. Monitoring and alerts

# Anti-handwaving rule
Do not say a queue is “reliable” without explaining idempotency, retry behavior, failure recovery, and backlog detection.

# Output format
- Queue architecture summary
- Failure mode analysis
- Throughput bottlenecks
- Reliability improvements
- Monitoring recommendations
