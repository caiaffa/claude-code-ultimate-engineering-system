---
name: node-runtime-reliability
description: Analyze Node.js services for runtime safety, concurrency correctness, memory health, timeout behavior, shutdown integrity, and production resilience.
---

# Mission
Make Node.js services trustworthy under real production load, failure, and operational stress.

# When to use
- Reviewing Node.js service reliability.
- Investigating latency, crashes, or memory issues.
- Designing async workflows.
- Validating shutdown, retries, and concurrency controls.

# Handoff
- **Receives from:** backend-platform-engineer (implementation) or systematic-debugging (investigation).
- **Hands off to:** performance-analysis (if perf issue), otel-observability-architect (monitoring), kubernetes-operability (runtime config).

# Node.js runtime risks
| Risk | Symptom | Detection | Fix |
|---|---|---|---|
| Event loop blocking | All requests slow simultaneously | Event loop lag metric > 100ms | Move CPU work to worker threads or separate process |
| Unhandled promise rejection | Silent failure, missing data | `unhandledRejection` handler + logging | Always await or catch; add process handler as safety net |
| Memory leak | RSS grows over hours/days | RSS metric trending up over 24h | Heap snapshot analysis; check caches, listeners, closures |
| Unbounded concurrency | Dependency overwhelmed | Connection pool exhaustion, timeout spikes | Semaphore/queue limiting concurrent requests |
| Missing cancellation | Work continues after request abandoned | CPU/memory usage without matching traffic | AbortController for HTTP calls; cancel tokens for async chains |
| Bad shutdown | Jobs lost, connections leaked | Restart produces duplicate work or errors | SIGTERM handler: stop accepting, drain in-flight, close pools |

# Shutdown implementation pattern
```javascript
process.on('SIGTERM', async () => {
  server.close();                    // Stop accepting new connections
  await drainInFlightRequests();     // Wait for current requests (with timeout)
  await closeConnectionPools();      // DB, Redis, etc.
  await flushTelemetry();           // Send remaining spans/metrics
  process.exit(0);
});
```

# Concurrency control pattern
```javascript
// BAD: unbounded concurrent external calls
const results = await Promise.all(items.map(i => callExternalAPI(i)));

// GOOD: bounded concurrency
import pLimit from 'p-limit';
const limit = pLimit(10); // max 10 concurrent
const results = await Promise.all(items.map(i => limit(() => callExternalAPI(i))));
```

# Red flags
- No `unhandledRejection` handler registered.
- `Promise.all` on unbounded arrays calling external services.
- No timeout on any HTTP client call.
- `setInterval` without cleanup in graceful shutdown.
- Global mutable state shared across requests.
- `JSON.parse` on user input without size limit.

# Output format
1. **Runtime risk summary** (critical / moderate / low)
2. **High-risk patterns found** (with file/location if possible)
3. **Concurrency assessment** (bounded? backpressure present?)
4. **Shutdown assessment** (graceful? tested?)
5. **Memory risk** (leaks, unbounded caches, growing listeners?)
6. **Resilience improvements** (prioritized, concrete)
