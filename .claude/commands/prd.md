---
description: Full PRD review — problem, value, metrics, gaps, decision quality
---

## Source
The PRD may be passed inline as $ARGUMENTS, OR referenced by name in Google Drive.
If a Drive PRD is named, use the Google Drive MCP to read the current version
live — do not rely on a local copy, which may be stale.

## Review
Use **principal-engineer** with the **prd-review** skill on the PRD.
The skill reviews through two lenses in one pass — an engineering lens
(feasibility, metrics, gaps, dependencies, decision quality, learning plan) and
a product/PM lens (right problem, right audience, solution quality, hypothesis,
documentation completeness, timeline). It produces a completeness scorecard and
a readiness level. Cross-check `~/.claude/engineering/ENGINEERING_RISKS_FROM_PRD.md`
and `PRD_QUESTIONS.md`.

## Output
A PRD readiness report: verdict (APPROVE / ADJUST / REJECT), readiness level
(DRAFT / REVIEWABLE / ENGINEERING-READY), completeness scorecard, product gaps,
engineering gaps, and the unanswered "why"s to ask the PM. Do NOT rewrite the
PM's PRD — produce feedback only. If the user wants it saved, the orchestrator
writes it (principal-engineer has no Write tool).
