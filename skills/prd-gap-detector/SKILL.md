---
name: prd-gap-detector
description: Detect missing sections, ambiguous assumptions, measurement gaps, and hidden engineering or operational requirements in PRDs.
---

# Mission
Find the omissions that turn promising PRDs into expensive surprises.

# When to use
Use this skill when:
- checking PRD completeness
- looking for hidden engineering cost
- validating measurement and rollout quality
- surfacing operational, data, support, or security gaps

# Core principles
- Missing information is risk.
- Ambiguity delays engineering and weakens alignment.
- Measurement and guardrails are mandatory.
- Hidden requirements are often more expensive than visible ones.

# Assumptions audit
Before answering, identify:
- assumed completeness of the PRD
- assumed ownership clarity
- assumed rollout strategy
- assumed measurement plan
- assumed operational burden
- assumed non-goals

# Non-obvious failure checklist
- no explicit non-goals
- no owner after launch
- no metric source
- no rollout or rollback thinking
- hidden dependency on migration or data cleanup
- support and audit needs omitted

# Deep evaluation checklist
1. Missing problem evidence
2. Missing baseline
3. Missing non-goals
4. Missing owner
5. Missing measurement or guardrails
6. Missing rollout plan
7. Missing support, security, or data requirements

# Anti-handwaving rule
Do not mark a PRD complete if key engineering or business sections are implied instead of stated.

# Output format
- completeness assessment
- critical gaps
- ambiguity risks
- hidden engineering work
- required additions
