---
name: kubernetes-operability
description: Review Kubernetes workloads for deployment safety, probe correctness, scaling behavior, disruption tolerance, and diagnosability.
---

# Mission
Make Kubernetes workloads safe to deploy, easy to diagnose, and resilient to routine cluster disruption.

# When to use
- Reviewing K8s manifests or Helm charts.
- Diagnosing pod health or rollout issues.
- Validating autoscaling and runtime settings.
- Improving service operability.

# Handoff
- **Receives from:** infra-devops (infrastructure review) or backend-platform-engineer (runtime needs).
- **Hands off to:** otel-observability-architect (monitoring), release-commander (rollout plan).

# Probe rules
| Probe | Purpose | Common mistake |
|---|---|---|
| `readinessProbe` | "Can this pod serve traffic?" | Returns 200 before DB/cache connected |
| `livenessProbe` | "Is this pod stuck?" | Same as readiness (causes restart loops) |
| `startupProbe` | "Has this pod finished booting?" | Missing for slow-starting apps (liveness kills during boot) |

**Rule:** Readiness should check actual dependency availability. Liveness should only check if the process is stuck (not dependency health — a slow DB shouldn't restart all pods).

# Resource settings
```yaml
resources:
  requests:    # What the scheduler guarantees — base on p50 usage
    cpu: 250m
    memory: 256Mi
  limits:      # Hard ceiling — base on p99 + headroom
    cpu: 1000m       # Or omit CPU limit (throttling is worse than burst)
    memory: 512Mi    # Always set memory limit (OOM is better than node pressure)
```

# Red flags
- `requests` = `limits` (no burst room, constant throttling).
- No `requests` set (scheduler can't make good decisions).
- Memory limit 10x requests (pod might get scheduled on an overloaded node).
- HPA scaling on CPU when the bottleneck is I/O or queue depth.
- No PodDisruptionBudget on critical services.
- `terminationGracePeriodSeconds` still at default 30s for services that need longer shutdown.
- Liveness probe with aggressive timeout that kills healthy-but-busy pods.

# Graceful shutdown checklist
1. SIGTERM received → stop accepting new requests.
2. Finish in-flight requests (within `terminationGracePeriodSeconds`).
3. Close database connections cleanly.
4. Deregister from service discovery (readiness goes false).
5. Exit 0.

# Output format
1. **K8s health assessment** (ready / has issues / critical)
2. **Probe corrections** (specific fixes)
3. **Resource tuning** (based on actual usage if available)
4. **Disruption tolerance** (PDB, rollout strategy, grace period)
5. **Scaling assessment** (HPA signal quality)
6. **Diagnostic gaps** (what's hard to debug today)
