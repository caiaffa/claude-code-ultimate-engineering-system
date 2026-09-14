---
name: prd-review
description: Full PRD review in one pass through two lenses — engineering (feasibility, metrics, gaps, decision quality, dependencies, learning plan) and product/PM (right problem, right audience, solution quality, hypothesis strength, documentation completeness). Use before committing engineering effort to a PRD.
allowed-tools: Read, Grep, Glob
---

# Mission
Ensure the team builds the right thing AND can build it well. Review the PRD
the way a staff engineer and a senior PM would in a peer review — critique and
ask, never rewrite. The PRD belongs to the PM; this skill produces feedback.

# When to use
- Reviewing a PRD before engineering commitment.
- The daily routine review of PRDs synced from Drive.

# Handoff
- Receives from: principal-engineer (initial review).
- Hands off to: architecture-decisions (if approved) or back to the PM (if not).

---

# Engineering lens

## Front 1 - Problem, value & audience
- What metric proves this problem exists today? How big is it?
- Root cause or symptom?
- "Show me the number": baseline, expected gain, mechanism linking solution to gain.
- Cost-to-value ratio acceptable for the time horizon?
- Which users/personas are affected - and what happens to those who are NOT
  the target audience? What is the blast radius if it goes wrong?

## Front 2 - Metrics & measurement
- Is the baseline credible and measured today?
- Are success criteria specific and measurable?
- Guardrail metrics - what must NOT regress?
- How and when is impact observed?

## Front 3 - Gaps & hidden engineering work
- Sections missing or vague?
- Engineering work implied but unstated: migrations, backfill, infra, auth.
- Ambiguities that will block implementation.
- Quick feasibility check: does this conflict with ~/.claude/engineering/SYSTEM_INVARIANTS.md,
  or depend on a service/data that does not exist? (Deep design goes to /adr.)

## Front 4 - Dependencies & sequencing
- Which other teams, systems, or PRDs does this depend on?
- What must exist before this can start?
- Coupling with work already in flight?
- Sequencing or ownership risk ("we found mid-build we needed team X")?

## Front 5 - Decision quality & risk
- Is the scope disciplined, or a wishlist? Are cuts identified?
- Is the decision reversible if the bet is wrong?
- Operational cost (run + maintain) considered?
- Non-technical risk: legal/compliance, data privacy (LGPD), product-level
  security (does this expose sensitive data?), reputation. Cross-check
  ~/.claude/engineering/ENGINEERING_RISKS_FROM_PRD.md.

## Front 6 - Learning plan
- Should this ship as an experiment or staged rollout, not all at once?
- What is the kill criterion - when do we decide it failed?
- How do we exit or roll back if the hypothesis does not hold?
- Measuring is not learning: is there an actual plan to validate the bet?

---

# Product / PM lens

## Front 7 - Product review (think like a senior PM)
- Right problem? Is this worth solving now, or a pet feature? Is it framed as a
  problem, or smuggled in as a pre-chosen solution?
- Right audience? Is the target user clearly defined and the real beneficiary?
- Solution quality? Were alternatives considered, or is this the first idea?
  Is the proposed solution the simplest one that solves the problem?
- Hypothesis strength? Is the "we believe X will cause Y" explicit and testable?
- User value clarity? Is the value to the user stated plainly, not just
  business value?
- Documentation completeness? Does the PRD contain what a PRD needs - context,
  user stories or scenarios, scope and out-of-scope, open questions, success
  criteria? Flag missing sections by name.
- Timeline & dates? Are there target dates or milestones? Are they justified or
  arbitrary? Is a deadline driving scope instead of the problem?
- Unanswered "why"s? List every decision stated without a reason ("we will do
  X" with no "because"). Those are the questions for the PM.

---

# Red flags - reject
- No baseline metric. Vague "improve UX" goals. Scope with no cuts.
- Expected gain stated with no mechanism.
- Solution presented as the problem. No target user. No open-questions section.
- A date with no rationale, or a deadline silently driving the scope.

# Output - PRD readiness report
Produce feedback for the PM; never rewrite their document.
```
# PRD READINESS - <title>
Verdict: APPROVE | ADJUST | REJECT
Readiness level: DRAFT | REVIEWABLE | ENGINEERING-READY   (score 0-100)

## Completeness scorecard
Problem statement       [ok / weak / missing]
Target audience         [ok / weak / missing]
Evidence & baseline     [ok / weak / missing]
Success metrics         [ok / weak / missing]
Guardrail metrics       [ok / weak / missing]
Scope & out-of-scope    [ok / weak / missing]
Dependencies            [ok / weak / missing]
Risks (legal/privacy)   [ok / weak / missing]
Learning / kill plan    [ok / weak / missing]
Timeline & milestones   [ok / weak / missing]
Rollout & reversibility [ok / weak / missing]

## Product gaps (PM lens)
## Gaps & hidden engineering work (eng lens)
## Unanswered "why"s - questions for the PM
## Top issues blocking approval
```
