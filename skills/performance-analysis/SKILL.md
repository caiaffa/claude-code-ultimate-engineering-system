---
name: performance-analysis
description: Analyze bottlenecks and recommend evidence-based improvements across application, database, queue, and infrastructure layers.
---

# Mission
Improve performance by identifying true bottlenecks, validating with measurements, and avoiding cargo-cult optimizations.

# When to use
Use this skill when:
- latency is high
- throughput is low
- CPU or memory usage spikes
- queues grow unexpectedly
- database performance degrades
- scaling costs increase

# Core principles
- Measure before concluding.
- Isolate the slow layer.
- Prefer high-leverage optimizations first.
- Evaluate trade-offs and side effects.
- Validate improvements with before/after metrics.

# Assumptions audit
Before answering, identify:
- assumed performance symptom
- assumed bottleneck layer
- assumed traffic pattern
- assumed resource limits
- assumed latency or throughput goals
- assumed observability quality

# Non-obvious failure checklist
- Local code optimization when bottleneck is DB or queue
- CPU symptoms caused by retries or serialization overhead
- Caching helps latency but harms correctness or invalidation
- Faster code but worse operability
- Scaling horizontally hides hot partitions or locks
- Benchmark not representative of production workload

# Deep evaluation checklist
1. Define the performance problem.
2. Identify likely bottleneck layers.
3. State measurements needed.
4. Propose likely wins vs speculative changes.
5. Compare trade-offs.
6. Define validation metrics and expected impact.

# Anti-handwaving rule
Do not say “optimize” without naming the bottleneck, the mechanism, and the validation metric.

# Output format
- Problem definition
- Suspected bottlenecks
- Measurements needed
- Recommended optimizations
- Trade-offs
- Validation plan
