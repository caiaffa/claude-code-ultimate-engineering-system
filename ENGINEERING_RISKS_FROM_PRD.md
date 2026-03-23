# ENGINEERING_RISKS_FROM_PRD

Use this to translate a PRD into engineering and operational risk.

## Common hidden risks
- hidden data migration requirements
- implied contract changes
- operational support burden
- missing auditability
- rollout complexity
- observability work omitted
- security or permission changes
- queue or async correctness risks
- incompatible assumptions between teams

## Review prompts
- What new dependencies are introduced?
- What contracts are added or changed?
- What can fail silently?
- What on-call burden does this create?
- What rollout or rollback complexity exists?
- What is the blast radius if this is wrong?
