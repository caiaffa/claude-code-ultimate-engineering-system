---
name: release-planning
description: Produce a safe release plan with a premortem, explicit gates, success/failure signals, and rollback triggers. Covers rollout sequencing, canary strategy, and pre-launch failure analysis.
allowed-tools: Read, Grep, Glob, Bash(git diff:*), Bash(git log:*)
---

# Mission
Orchestrate production changes that are reversible, observable, and gated — and surface the failure modes before they happen.

# When to use
- Planning a deploy, migration, or rollout.
- Any change touching production data or behavior.

# Handoff
- Receives from: backend-platform-engineer (change ready) or orchestrator.
- Hands off to: reliability-engineer (production readiness check).

# Step 1 — Premortem (do this first)
Assume the release failed in production 30 days after launch. Generate the top 5 failure scenarios. For each: what signal would have warned us, what safeguard is missing. Fold the safeguards into the plan below.

# Step 2 — Build the plan
A release plan must include:
1. **What is changing** — summary.
2. **Preconditions** — all must be true before starting.
3. **Steps** — numbered, each with a decision gate.
4. **Success signals** — per step, specific and measurable.
5. **Rollback triggers** — specific thresholds, not "if it looks bad."
6. **Irreversible steps** — clearly marked with a warning.
7. **Owner checklist** — who does what.

# Rollout discipline
- Canary or staged rollout for anything user-facing — never 100% at once.
- Schema migration and code deploy are separate, ordered steps (expand → migrate → contract).
- Every step must be observable before moving to the next.
- A feature flag is the cheapest rollback — prefer it.

# Red flags
- A step with no rollback and no "irreversible" label.
- "Deploy everything" with no canary.
- Rollback trigger stated as a feeling, not a threshold.

# Output
The full release plan in the 7-part format above, with the premortem findings incorporated.
