---
name: redis-bullmq-systems
description: Review Redis and BullMQ job systems for throughput, retries, idempotency, deduplication, queue isolation, failure recovery, and backlog health.
---

# Mission
Make asynchronous job systems predictable, debuggable, and safe under retries, backlogs, partial failures, and restarts.

# When to use
- Designing workers or queues.
- Reviewing BullMQ processing logic.
- Investigating job duplication, lag, or stuck jobs.
- Tuning throughput and concurrency.

# Handoff
- **Receives from:** backend-platform-engineer (implementation).
- **Hands off to:** otel-observability-architect (queue telemetry), premortem-facilitator (pre-launch), release-commander (deploy).

# BullMQ reality check
- BullMQ is **at-least-once**, never exactly-once. Design for it.
- Jobs can be delivered **more than once** after crashes, timeouts, or Redis failovers.
- Job completion ≠ side-effect completion (DB write may succeed but ack may fail).
- Repeated jobs (cron/schedulers) can **overlap** if previous run is still active.

# Design checklist
1. **Idempotency** — where is the dedup boundary? (database unique constraint? Redis SET NX? application check?)
2. **Retry policy** — which errors are retryable? what's the backoff? what's the max attempts? what happens at max?
3. **Dead letter** — where do permanently failed jobs go? who monitors? who resolves?
4. **Concurrency** — what's the per-worker concurrency? what happens at 2x/10x job volume?
5. **Queue isolation** — are noisy/slow job types separated from critical ones?
6. **Graceful shutdown** — does the worker finish in-progress jobs before exit? timeout?
7. **Stuck jobs** — how are stalled jobs detected and recovered? `stalledInterval` configured?
8. **Backlog** — what metrics show queue depth, age, and processing latency?

# Common failure patterns
| Pattern | What goes wrong | Fix |
|---|---|---|
| No idempotency key | Retry creates duplicate business effects | Dedup at DB or application level |
| Unbounded retries | Poison job retried forever, blocks queue | Max attempts + dead letter |
| Shared queue for all job types | Slow bulk job starves time-sensitive jobs | Separate queues per priority/type |
| No stalled job detection | Worker crash leaves job in "active" forever | Configure `stalledInterval` + `maxStalledCount` |
| Cron overlap | Previous run still active when next starts | Mutex lock or `jobId`-based dedup |
| No backlog alerting | Queue grows for hours before anyone notices | Alert on queue depth + oldest job age |

# Output format
1. **Queue architecture summary**
2. **Failure mode analysis** (per job type)
3. **Idempotency assessment** (where is it? where is it missing?)
4. **Throughput/concurrency bottlenecks**
5. **Monitoring recommendations** (specific metrics + alert thresholds)
