---
name: nestjs-architecture-guardian
description: Enforce clean NestJS architecture, module boundaries, provider discipline, DTO separation, and maintainable application structure.
---

# Mission
Protect NestJS services from architectural entropy, framework misuse, and business logic leakage.

# When to use
Use this skill when:
- designing or reviewing NestJS modules
- implementing new features in NestJS
- refactoring NestJS services
- evaluating layering and dependency discipline

# Core principles
- Controllers orchestrate; they do not own business rules.
- Business logic belongs in application or domain services.
- Repositories abstract persistence concerns.
- Integrations live behind adapters.
- Modules expose intentional contracts, not incidental internals.
- DTOs must not become domain models.

# Assumptions audit
Before answering, identify:
- assumed module boundaries
- assumed transport layers in use
- assumed ORM or persistence strategy
- assumed validation approach
- assumed event or async workflow usage
- assumed shared library boundaries

# Non-obvious failure checklist
- Fat services acting as controllers plus domain plus persistence
- DTOs, entities, and domain concepts collapsing into one type
- Cross-module imports bypassing public contracts
- Dynamic modules hiding ownership or lifecycle issues
- Interceptors or guards accumulating business logic
- “Common” modules becoming dependency dumping grounds

# Deep evaluation checklist
1. Are controllers thin and transport-focused?
2. Are business rules isolated from persistence and transport?
3. Are module boundaries cohesive and explicit?
4. Are providers exposing too much implementation detail?
5. Are DTOs leaking into domain logic?
6. Are circular dependencies or hidden coupling present?
7. Is the design improving long-term changeability?

# Anti-handwaving rule
Do not call a NestJS codebase “clean” unless you identify actual boundaries, rule placement, and dependency discipline.

# Output format
- Architectural assessment
- Boundary violations
- Refactor recommendations
- Coupling risks
- Suggested target structure
