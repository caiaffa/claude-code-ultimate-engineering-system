---
description: Implement a feature end to end — context, design, challenge, build, review, release
---

Feature: $ARGUMENTS

Governance lives in `~/.claude/engineering/`. Every phase receives only the
context it needs (files, diff, prior phase output) — not the whole conversation.

## Phase 0 — Context (sequential; skip if the repo is already mapped this session)
**backend-platform-engineer** (repo-onboarding skill) or an **Explore** agent:
map the modules, contracts, tests, and conventions the feature touches.
Output: list of files + boundaries + existing tests. This feeds Phase 1.

## Phase 1 — Design (sequential)
**principal-engineer**: propose architecture, boundaries, contracts, and the
test strategy, grounded in the Phase 0 map. Reference SYSTEM_INVARIANTS.md and
DECISION_RULES.md. Must end with "what the challenger should attack first".

## Phase 2 — Challenge (sequential, decision gate)
**architecture-challenger**: attack the design. REJECTED or critical findings →
back to Phase 1 with the findings (max 2 loops; then surface the disagreement
to the user instead of looping).

## Phase 3 — Build (sequential)
**backend-platform-engineer**: implement the approved design with tests; run
the suite and report output. Escalate the builder to `model: opus` (Agent tool
`model` param) when the change is multi-service, touches migrations or async
contracts, or spans more than ~5 files.

## Phase 4 — Review (parallel, after the code exists)
Give each reviewer the diff (`git diff <base>...HEAD`) and the design:
- **backend-platform-engineer** (fresh instance, code-review skill) — correctness,
  boundaries, error handling; check DEFINITION_OF_DONE.md
- **security-engineer** — only if auth, data, uploads, or PII are involved
- **reliability-engineer** — instrumentation, trace propagation, alertability

## Phase 5 — Fix (sequential, only if 🔴/🟡 findings)
**backend-platform-engineer** addresses the findings; re-run the suite.

## Phase 6 — Release (sequential)
**release-commander**: rollout plan with gates and rollback triggers.

## Done gate
Run `~/.claude/hooks/dod-check.sh` (yarn repos) or the equivalent checks. Then
synthesize: Decision · Evidence (test output) · Risks · Next actions.
