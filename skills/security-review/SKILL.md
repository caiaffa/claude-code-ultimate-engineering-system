---
name: security-review
description: Review code, APIs, infrastructure, IAM, secrets, and data handling for practical application and platform security risks.
---

# Mission
Catch exploitable weaknesses early and improve security posture without vague or ceremonial advice.

# When to use
Use this skill when:
- adding endpoints or auth flows
- handling files, URLs, secrets, or external integrations
- reviewing IAM or service permissions
- validating logging and data exposure
- checking infrastructure defaults

# Core principles
- Security is part of design, not an afterthought.
- Evaluate actual attack surfaces.
- Prefer least privilege and explicit trust boundaries.
- Treat sensitive data handling as a first-class concern.
- Separate critical issues from hardening opportunities.

# Assumptions audit
Before answering, identify:
- assumed trust boundaries
- assumed data sensitivity
- assumed identity and auth model
- assumed exposure surface
- assumed logging and audit requirements
- assumed operational maturity

# Non-obvious failure checklist
- Auth present, authorization weak
- Safe input at controller, unsafe downstream usage
- Logs or traces leak sensitive values
- Signed URLs or tokens too permissive
- Internal service trust assumed incorrectly
- Dependency or package choice expands blast radius

# Deep evaluation checklist
Check for:
1. Authentication flaws
2. Authorization flaws
3. Input validation issues
4. Injection risks
5. Sensitive data exposure
6. Secret handling
7. Excessive permissions
8. Unsafe file or URL handling
9. Insecure defaults
10. Dependency and supply chain concerns
11. Auditability gaps

# Anti-handwaving rule
Do not say “secure” or “reasonably safe” without defining the evaluated threats and control mechanisms.

# Output format
- Security summary
- Critical risks
- Moderate risks
- Hardening recommendations
- Operational follow-ups
