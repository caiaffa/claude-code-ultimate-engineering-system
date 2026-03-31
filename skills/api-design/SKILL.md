---
name: api-design
description: Design REST, internal, and event-driven APIs with strong contracts, consistency, idempotency, error semantics, and operational safety.
---

# Mission
Create APIs that are easy to consume, evolve safely, observe in production, and protect against misuse.

# When to use
- Designing REST or internal APIs.
- Defining webhooks or async contracts.
- Evolving existing endpoints.
- Reviewing compatibility and idempotency.

# Handoff
- **Receives from:** principal-engineer (design decision) or backend-platform-engineer (implementation).
- **Hands off to:** test-strategy (contract tests), security-review (auth), otel-observability-architect (instrumentation).

# Before answering
Identify: consumers and their maturity, backward compatibility needs, idempotency requirements, auth model, latency sensitivity, pagination needs.

# Red flags
- Endpoint returns 200 for errors with error in body.
- No idempotency key on mutation endpoints.
- Pagination using offset on frequently-written tables.
- Internal structure leaked in response shape.
- No versioning strategy.
- Error responses inconsistent across endpoints.

# Design checklist
1. Define API goals and consumers.
2. Propose resource model and endpoint structure.
3. Define request/response schemas (with examples).
4. Define validation rules and error model (consistent across all endpoints).
5. Address idempotency for all mutation endpoints.
6. Design pagination (cursor-based for live data, offset for static).
7. Define auth and authorization boundaries.
8. Define compatibility and versioning strategy.
9. Define rate limiting and abuse protection.
10. Define observability: what metrics, traces, and logs per endpoint.

# Error model standard
```
{
  "error": {
    "code": "VALIDATION_FAILED",
    "message": "Human-readable description",
    "details": [{"field": "email", "reason": "invalid_format"}],
    "request_id": "req_abc123"
  }
}
```
- 4xx = client can fix it. 5xx = server problem.
- Always include request_id for correlation.
- Never expose stack traces or internal details.

# Output format
1. **API goals and consumers**
2. **Proposed endpoints** (method, path, purpose)
3. **Request/response examples** (concrete JSON)
4. **Validation rules**
5. **Error model**
6. **Idempotency strategy**
7. **Compatibility and versioning notes**
8. **Security boundaries**
9. **Observability requirements**
