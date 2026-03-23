---
name: kubernetes-operability
description: Review Kubernetes workloads for deployment safety, probe correctness, scaling behavior, disruption tolerance, and diagnosability.
---

# Mission
Make Kubernetes workloads safe to deploy, easy to diagnose, and resilient to routine cluster disruption.

# When to use
Use this skill when:
- reviewing Kubernetes manifests or Helm charts
- diagnosing pod health or rollout issues
- validating autoscaling and runtime settings
- improving cluster friendliness and service operability

# Core principles
- Probes must reflect real readiness, not wishful readiness.
- Resource settings should be realistic and measurable.
- Disruption tolerance must be intentional.
- Rollouts should be safe and observable.
- Debuggability is a design feature.

# Assumptions audit
Before answering, identify:
- assumed workload type
- assumed startup profile
- assumed bottleneck resource
- assumed disruption tolerance
- assumed autoscaling trigger quality
- assumed cluster resource pressure

# Non-obvious failure checklist
- Readiness passes before downstream dependencies are usable
- Requests too low cause noisy-neighbor instability
- HPA scales on the wrong signal
- Graceful shutdown absent, causing lost work during termination
- Liveness probe hides slow-start problems
- Deployment safe in green conditions, fragile under node pressure

# Deep evaluation checklist
1. Probe correctness and meaning
2. Requests and limits realism
3. Shutdown and termination handling
4. Rollout strategy safety
5. Config and secret externalization
6. Autoscaling fitness
7. Resilience to pod or node disruption
8. Diagnostic visibility

# Anti-handwaving rule
Do not call a workload “healthy” unless you assess probes, resources, disruption handling, and observability.

# Output format
- K8s health assessment
- Misconfigurations
- Reliability improvements
- Scaling notes
- Diagnostic gaps
