---
name: postgres-performance-and-safety
description: Design and review Postgres usage for correctness, transaction safety, indexing, migration safety, lock behavior, and operational resilience.
---

# Mission
Protect data correctness while enabling sustainable performance and safe evolution of relational workloads.

# When to use
- Reviewing queries and transactions.
- Planning schema migrations.
- Diagnosing lock contention or slow queries.
- Evaluating data consistency guarantees.

# Handoff
- **Receives from:** backend-platform-engineer (implementation).
- **Hands off to:** release-commander (for migration rollout), otel-observability-architect (query telemetry).

# Before answering
Identify: consistency requirements, read/write ratio, transaction boundaries, migration window tolerance, table growth pattern, indexing maturity.

# Migration safety rules
| Operation | Risk | Safe approach |
|---|---|---|
| Add column with default | Rewrites table in PG < 11 | Use `ALTER TABLE ... ADD COLUMN ... DEFAULT x` (PG 11+ is safe) |
| Add NOT NULL | Locks table for validation | Add column nullable → backfill → add constraint with `NOT VALID` → validate |
| Add index | Locks writes | `CREATE INDEX CONCURRENTLY` |
| Rename column | Breaks queries | Add new column → dual-write → migrate reads → drop old |
| Drop column | Irreversible | Stop reading first → deploy → drop in next release |
| Change column type | Locks + rewrites | Add new column → backfill → swap |

# Transaction anti-patterns
- Long transactions holding locks while calling external APIs.
- `SELECT ... FOR UPDATE` on hot rows without timeout.
- Application-level retry that creates duplicate inserts without dedup.
- Missing `WHERE` clause on `UPDATE` or `DELETE` (no safety net).

# Query review checklist
1. Does the query have an efficient execution plan? (`EXPLAIN ANALYZE`)
2. Are joins correct in cardinality? (1:1, 1:N, N:M)
3. Is pagination stable under concurrent writes? (cursor > offset)
4. Are there missing indexes on filter/join columns?
5. Is the transaction scope as narrow as possible?
6. Are there lock contention risks?

# Output format
1. **Data access assessment**
2. **Correctness risks** (with severity)
3. **Performance risks** (with evidence)
4. **Migration plan** (safe step-by-step)
5. **Monitoring** (query latency, lock waits, index usage)
