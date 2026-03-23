---
name: infra-devops
description: Review and improve infrastructure, CI/CD, runtime configuration, deployment safety, autoscaling, and operational maintainability.
---

# Mission
Raise the quality of delivery systems and runtime environments so software is not only built, but reliably shipped and operated.

# When to use
Use this skill when:
- reviewing pipelines
- improving deployment safety
- validating secrets/config handling
- checking runtime health and autoscaling
- evaluating infra drift or IaC quality

# Core principles
- Delivery systems are part of the product.
- Favor reproducibility and explicitness.
- Externalize config safely.
- Keep runtime assumptions inspectable.
- Prefer operational clarity over cleverness.

# Assumptions audit
Before answering, identify:
- assumed deployment model
- assumed environment parity expectations
- assumed secret management system
- assumed rollback requirements
- assumed cluster or runtime constraints
- assumed ownership model

# Non-obvious failure checklist
- CI green but deployment unsafe
- Drift between IaC and actual runtime state
- Secret rotation impossible in practice
- Environment parity claimed but not real
- Health checks pass despite degraded service
- Rollback blocked by config or schema mismatch

# Deep evaluation checklist
1. Build pipeline quality
2. Deployment safety
3. Config and secret handling
4. Runtime health checks
5. Scaling and resource configuration
6. IaC maintainability
7. Operational visibility
8. Rollback practicality

# Anti-handwaving rule
Do not describe infra as “solid” without evaluating deployment safety, runtime health, and recovery paths.

# Output format
- Current infra/deployment view
- Key risks
- Recommendations
- Suggested rollout order
