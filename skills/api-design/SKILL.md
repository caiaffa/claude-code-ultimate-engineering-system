---
name: api-design
description: Design REST, internal, and event-driven APIs with strong contracts, consistency, idempotency, error semantics, and operational safety.
---

# Mission
Create APIs that are easy to consume, evolve safely, observe in production, and protect against misuse.

# When to use
Use this skill when:
- designing REST or internal APIs
- defining webhooks or async contracts
- evolving existing endpoints
- reviewing compatibility and idempotency
- creating API documentation

# Core principles
- Model the contract deliberately.
- Keep semantics consistent across endpoints.
- Make failures predictable and machine-usable.
- Support safe retries where appropriate.
- Design for observability and compatibility from the start.

# Assumptions audit
Before answering, identify:
- assumed consumers and their maturity
- assumed backward compatibility needs
- assumed idempotency requirements
- assumed authentication/authorization model
- assumed latency sensitivity
- assumed pagination/filtering needs

# Non-obvious failure checklist
- Endpoint shape fine, but error semantics inconsistent
- API returns transport-friendly data but leaks internal structure
- Retry-safe at HTTP layer, unsafe at business layer
- Pagination unstable under concurrent writes
- Versioning delayed until breaking changes accumulate
- Missing observability fields for debugging support cases

# Deep evaluation checklist
1. Define API goals and consumers.
2. Propose resource model and endpoint structure.
3. Define request and response schemas.
4. Define validation rules and error model.
5. Address idempotency, pagination, filtering, sorting.
6. Define authentication and authorization boundaries.
7. Address compatibility, versioning, and observability.

# Anti-handwaving rule
Do not say an API is “clean” without defining its contract rules, failure model, and compatibility strategy.

# Output format
- API goals
- Proposed endpoints
- Request/response examples
- Validation rules
- Error model
- Compatibility notes
- Security and observability notes
