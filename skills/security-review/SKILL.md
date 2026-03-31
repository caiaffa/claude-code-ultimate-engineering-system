---
name: security-review
description: Review code, APIs, infrastructure, IAM, secrets, and data handling for practical application and platform security risks.
---

# Mission
Catch exploitable weaknesses early and improve security posture with practical, auditable controls.

# When to use
- Adding endpoints or auth flows.
- Handling files, URLs, secrets, or external integrations.
- Reviewing IAM or service permissions.
- Validating logging and data exposure.

# Handoff
- **Receives from:** code-reviewer (flagged concern) or backend-platform-engineer (new feature with auth/data).
- **Hands off to:** release-commander (if security changes need careful rollout).

# OWASP-aligned checklist
1. **Authentication** — is identity verified correctly? token validation? session management?
2. **Authorization** — is access checked at every layer? (not just UI/controller)
3. **Injection** — SQL, NoSQL, command, LDAP, XSS, template injection?
4. **Data exposure** — PII in logs? secrets in config? sensitive fields in API responses?
5. **Secret handling** — hardcoded? rotatable? scoped? auditable?
6. **File/URL handling** — path traversal? SSRF? unrestricted upload?
7. **Rate limiting** — brute force protection? abuse protection?
8. **Dependencies** — known vulnerabilities? supply chain risk?
9. **Permissions** — least privilege? overly broad IAM?
10. **Audit trail** — who did what, when? tamper-resistant?

# Red flags — block deploy
- Secrets in code, config files, or logs.
- SQL string concatenation (even with "trusted" input).
- Missing auth check on any mutation endpoint.
- File upload without type/size validation.
- Internal service endpoint exposed without network restriction.
- `*` in IAM policies.

# Output format
1. **Security summary** (risk level: critical / high / moderate / low)
2. **Critical risks** (must fix before deploy)
3. **High risks** (fix in current sprint)
4. **Moderate risks** (fix soon, track in backlog)
5. **Hardening recommendations** (nice to have)
6. **Trust boundary diagram** (who trusts whom)
