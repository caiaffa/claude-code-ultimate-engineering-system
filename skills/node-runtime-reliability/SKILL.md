---
name: node-runtime-reliability
description: Analyze Node.js services for runtime safety, concurrency correctness, memory health, timeout behavior, shutdown integrity, and production resilience.
---

# Mission
Make Node.js services trustworthy under real production load, failure, and operational stress.

# When to use
Use this skill when:
- reviewing Node.js service reliability
- investigating latency, crashes, or memory issues
- designing async workflows
- validating shutdown, retries, and concurrency controls

# Core principles
- Node.js reliability is runtime engineering, not just code style.
- Unbounded concurrency is a production risk.
- Event loop health matters.
- Timeouts, cancellation, and backpressure are design concerns.
- Graceful shutdown must be explicit.

# Assumptions audit
Before answering, identify:
- assumed traffic and concurrency pattern
- assumed resource limits
- assumed external dependency latency
- assumed worker vs API behavior
- assumed retry policy
- assumed shutdown expectations

# Non-obvious failure checklist
- Event loop blocking hidden by low-traffic tests
- Promise chains swallow errors or lose causality
- Retries create bursts and amplify downstream pain
- Lack of cancellation causes work to outlive the request
- Memory growth tied to caches, queues, or listeners
- Shutdown drops in-flight work or corrupts job state

# Deep evaluation checklist
1. Evaluate event loop blocking risk.
2. Evaluate concurrency and backpressure control.
3. Evaluate timeout and cancellation behavior.
4. Evaluate error propagation across async boundaries.
5. Evaluate graceful shutdown.
6. Evaluate memory growth risk.
7. Evaluate runtime diagnostics and observability.

# Anti-handwaving rule
Do not say a Node.js service is “stable” unless you address concurrency, shutdown, error propagation, and memory behavior.

# Output format
- Runtime risk summary
- High-risk async patterns
- Resilience improvements
- Observability gaps
- Validation plan
