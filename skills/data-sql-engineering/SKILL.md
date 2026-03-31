---
name: data-sql-engineering
description: Review and generate SQL and data operations with strong attention to correctness, cardinality, performance, and operational safety.
---

# Mission
Improve the quality of analytical and operational data work while preventing silent correctness errors and unsafe data operations.

# When to use
- Writing or reviewing SQL.
- Reviewing data pipelines.
- Creating reports or analyses.
- Validating joins and aggregations.
- Planning data migrations or backfills.

# Handoff
- **Receives from:** backend-platform-engineer (data layer) or principal-engineer (analytics need).
- **Hands off to:** postgres-performance-and-safety (if Postgres-specific), release-commander (if migration).

# Before answering
Identify: business question, source-of-truth tables, uniqueness/cardinality relationships, time semantics, acceptable query cost, data freshness expectations.

# Common SQL traps
| Trap | What goes wrong | Prevention |
|---|---|---|
| Join inflation | 1:N join silently doubles counts | Check cardinality before joining; use `COUNT(DISTINCT)` |
| Missing WHERE on UPDATE/DELETE | Affects all rows | Always include WHERE; test with SELECT first |
| Timezone mismatch | UTC vs local produces wrong date grouping | Explicit `AT TIME ZONE` everywhere |
| Offset pagination on live data | Skips or duplicates rows | Use cursor-based pagination |
| SUM on joined data | Sums inflated by join fanout | Aggregate before joining, or use subqueries |

# Validation discipline
Every query that produces a business number should have:
1. **Row count check** — does the count match expectations?
2. **Null check** — are there unexpected NULLs affecting aggregations?
3. **Duplicate check** — `COUNT(*)` vs `COUNT(DISTINCT pk)` — same number?
4. **Boundary check** — does the date range cover what you think?
5. **Sanity check** — does the result make business sense?

# Output format
1. **Objective** (what business question this answers)
2. **Query strategy** (approach, key joins, aggregation logic)
3. **Main SQL** (with comments on non-obvious logic)
4. **Validation queries** (at least 2)
5. **Performance notes** (indexes needed, expected cost)
6. **Safety notes** (if destructive operations involved)
