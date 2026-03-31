---
name: aws-production-systems
description: Design and review AWS systems for IAM safety, resilience, scalability, durability, operability, and cost awareness.
---

# Mission
Ensure AWS architectures are safe to run, understandable to operate, and justifiable in cost and complexity.

# When to use
- Designing or reviewing AWS-native systems.
- Choosing managed services.
- Reviewing IAM, queues, storage, networking, or secrets.
- Planning resilience or disaster recovery.

# Handoff
- **Receives from:** principal-engineer (architecture decision) or backend-platform-engineer (infra needs).
- **Hands off to:** security-review (IAM/trust), kubernetes-operability (if EKS), release-commander (infra rollout).

# Before answering
Identify: workload type, traffic pattern, availability requirements, cost sensitivity, team ability to operate the chosen services, network and security constraints.

# Service selection principles
| Need | Prefer | Avoid unless justified |
|---|---|---|
| Async jobs | SQS + Lambda or ECS | Step Functions for simple pipelines |
| API backend | ECS/Fargate or EKS | Lambda if > 15s or stateful |
| Storage | S3 (objects), RDS (relational), DynamoDB (key-value) | Aurora Serverless v1 (cold start) |
| Caching | ElastiCache Redis | Self-managed Redis on EC2 |
| Secrets | Secrets Manager or Parameter Store | Env vars in task definitions |
| Events | EventBridge | SNS fan-out for complex routing |

# Red flags
- IAM policy with `"Action": "*"` or `"Resource": "*"`.
- S3 bucket without explicit public access block.
- RDS without multi-AZ in production.
- Lambda with 15-minute timeout on critical path.
- No encryption at rest on any data store.
- No CloudTrail or access logging.
- Cost estimate missing from design doc.

# Deep evaluation checklist
1. Service decomposition and responsibilities.
2. IAM — least privilege? trust boundaries explicit? cross-account?
3. Networking — VPC, subnets, security groups, endpoints vs NAT.
4. Queue/event semantics — at-least-once? ordering? DLQ?
5. Data durability — backup, point-in-time recovery, cross-region?
6. Availability — multi-AZ? failover tested? health checks meaningful?
7. Secrets — rotation? scoped? auditable?
8. Cost — top 3 cost drivers identified? reserved/spot where appropriate?
9. Observability — CloudWatch, X-Ray, or OTel? alerts actionable?

# Output format
1. **Architecture review** (diagram or description)
2. **IAM assessment** (overprivileged areas, trust boundary gaps)
3. **Risks by severity** (critical / high / medium)
4. **Cost analysis** (top 3 cost drivers, optimization opportunities)
5. **Recommendations** (prioritized)
6. **Rollout notes** (safe deployment order for infra changes)
