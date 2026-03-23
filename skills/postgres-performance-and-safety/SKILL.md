---
name: postgres-performance-and-safety
description: Design and review Postgres usage for correctness, transaction safety, indexing, migration safety, lock behavior, and operational resilience.
---

# Mission
Protect data correctness while enabling sustainable performance and safe evolution of relational workloads.

# When to use
Use this skill when:
- reviewing queries and transactions
- planning schema migrations
- diagnosing lock contention or slow queries
- evaluating data consistency guarantees
- designing write paths and indexes

# Core principles
- Correctness comes before speed.
- Transaction scope defines contention risk.
- Migration safety must be deliberate.
- Indexes are part of design, not afterthoughts.
- Understand hot paths and hot tables explicitly.

# Assumptions audit
Before answering, identify:
- assumed consistency requirements
- assumed read/write ratio
- assumed transaction boundaries
- assumed migration window tolerance
- assumed table growth pattern
- assumed indexing maturity

# Non-obvious failure checklist
- Query acceptable alone, dangerous under concurrency
- Transaction correctness depends on application-level timing
- Online migration plan still causes lock pain
- Index helps one path but harms write amplification
- “Safe retry” duplicates side effects around DB writes
- Cardinality or sort order assumptions break pagination or dedup logic

# Deep evaluation checklist
1. Query intent and correctness
2. Cardinality and join risk
3. Transaction scope and lock duration
4. Read and write path efficiency
5. Index strategy
6. Migration safety
7. Data lifecycle and retention
8. Operational diagnostics

# Anti-handwaving rule
Do not call a Postgres design “efficient” without addressing contention, indexing, and migration behavior.

# Output format
- Data access assessment
- Correctness risks
- Performance risks
- Migration concerns
- Recommendations
