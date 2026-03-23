---
name: data-sql-engineering
description: Review and generate SQL and data operations with strong attention to correctness, cardinality, performance, and operational safety.
---

# Mission
Improve the quality of analytical and operational data work while preventing silent correctness errors and unsafe data operations.

# When to use
Use this skill when:
- writing SQL
- reviewing data pipelines
- creating reports or analyses
- validating joins and aggregations
- planning data migrations or backfills

# Core principles
- Clarify the business question first.
- Cardinality mistakes are correctness bugs.
- Distinguish exploratory SQL from production SQL.
- Make destructive operations deliberate and auditable.
- Prefer validation queries over confidence by inspection.

# Assumptions audit
Before answering, identify:
- assumed business question
- assumed source-of-truth tables
- assumed uniqueness/cardinality relationships
- assumed time semantics
- assumed acceptable query cost
- assumed data freshness expectations

# Non-obvious failure checklist
- Join duplicates inflate counts silently
- Filtering logic changes meaning subtly
- Timestamp timezone assumptions break results
- Production query reused from exploratory prototype
- Backfill logic idempotency not considered
- Validation omitted because output “looks right”

# Deep evaluation checklist
1. Define the objective.
2. Identify source tables and relationships.
3. Evaluate join and aggregation risks.
4. Propose main query strategy.
5. Suggest validation queries.
6. Note performance concerns and indexing implications.
7. Note destructive or migration risks if applicable.

# Anti-handwaving rule
Do not say a query is “correct” without addressing joins, cardinality, and validation.

# Output format
- Objective
- Query strategy
- Main SQL or data plan
- Validation checks
- Performance notes
- Safety notes
