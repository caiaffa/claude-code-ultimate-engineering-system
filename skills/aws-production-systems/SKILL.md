---
name: aws-production-systems
description: Design and review AWS systems for IAM safety, resilience, scalability, durability, operability, and cost awareness.
---

# Mission
Ensure AWS architectures are safe to run, understandable to operate, and justifiable in cost and complexity.

# When to use
Use this skill when:
- designing or reviewing AWS-native systems
- choosing managed services
- reviewing IAM, queues, storage, networking, or secrets
- planning resilience or disaster recovery

# Core principles
- Prefer explicit trust boundaries.
- Minimize IAM blast radius.
- Match service choice to workload semantics.
- Treat durability, recovery, and cost as design inputs.
- Operational clarity matters as much as architecture diagrams.

# Assumptions audit
Before answering, identify:
- assumed workload type
- assumed traffic pattern
- assumed availability requirements
- assumed cost sensitivity
- assumed team ability to operate the chosen services
- assumed network and security constraints

# Non-obvious failure checklist
- IAM permissions too broad for convenience
- Queue semantics mismatched to business expectations
- Storage safe but public access patterns leak data indirectly
- Multi-AZ assumed but stateful dependencies still fragile
- Lambda chosen where workload needs long-lived controls
- Service choice reduces cost but increases operational ambiguity

# Deep evaluation checklist
1. Service decomposition and responsibilities
2. IAM and trust boundary design
3. Queue and event semantics
4. Data durability and recovery
5. Availability and AZ resilience
6. Secret and config strategy
7. Cost hotspots
8. Observability and operability

# Anti-handwaving rule
Do not say an AWS design is “production-ready” without explaining IAM, failure handling, durability, and operational ownership.

# Output format
- Architecture review
- Risks by severity
- AWS-native recommendations
- Cost/reliability trade-offs
- Rollout notes
