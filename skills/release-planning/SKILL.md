---
name: release-planning
description: Plan safe releases, migrations, rollout strategies, rollback procedures, and operational checks for production changes.
---

# Mission
Reduce deployment risk by making release assumptions, sequencing, safeguards, and recovery paths explicit.

# When to use
- Shipping critical features.
- Deploying migrations.
- Changing infra or traffic flows.
- Introducing backward compatibility risk.
- Coordinating multi-step rollouts.

# Handoff
- **Receives from:** backend-platform-engineer (feature ready) or premortem-facilitator (risks identified).
- **Hands off to:** staff-sre (production validation), operational-excellence-enforcer (runbook check).

# Release plan structure
```
1. WHAT is changing (summary, not full diff)
2. PRECONDITIONS (what must be true before we start)
3. STEPS (ordered, with decision gates between phases)
4. MONITORING (what to watch, what thresholds mean stop)
5. SUCCESS SIGNALS (how we know it worked)
6. ROLLBACK (triggers, procedure, data implications)
7. IRREVERSIBLE STEPS (clearly marked ⚠️)
8. OWNERS (who owns each step, who makes go/no-go calls)
```

# Rollout strategy selection
| Risk level | Strategy |
|---|---|
| Low risk (config change, minor fix) | Deploy + monitor for 30 min |
| Medium risk (new feature, API change) | Feature flag → 1% → 10% → 50% → 100% |
| High risk (migration, data change) | Canary → soak 24h → expand → monitor 48h |
| Critical (schema migration, breaking change) | Expand-and-contract: dual-write → migrate reads → verify → drop old |

# Rollback reality check
For each release, answer honestly:
1. Can we roll back the code? (usually yes)
2. Can we roll back the data? (often no)
3. Can we roll back the schema? (depends on migration)
4. What happens to in-flight requests during rollback?
5. What happens to data written by the new version?
6. How long does rollback take? (minutes? hours?)

# Red flags
- Release plan is "deploy and monitor."
- No one can describe the rollback procedure.
- Canary has no success criteria.
- Migration plan works on staging but wasn't tested under production load.
- Feature flag exists but there's no plan for when to remove it.
- Multiple irreversible steps without explicit acknowledgment.

# Output format
1. **Change summary**
2. **Preconditions checklist** (all must be true)
3. **Release steps** (numbered, with gates)
4. **Monitoring plan** (metrics, thresholds, dashboards)
5. **Success criteria** (when is it "done"?)
6. **Rollback plan** (triggers, procedure, data impact)
7. **⚠️ Irreversible steps** (clearly marked)
8. **Owner checklist** (who does what)
