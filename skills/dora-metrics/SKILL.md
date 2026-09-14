---
name: dora-metrics
description: Measure and improve engineering delivery performance using the four DORA metrics — deployment frequency, lead time for changes, change failure rate, and time to restore. Use to assess delivery health and find the next bottleneck.
allowed-tools: Read, Grep, Glob, Bash(git log:*)
---

# Mission
Make delivery performance visible and improvable. A system that ships and responds to incidents but measures nothing cannot tell if it is getting better.

# When to use
- Periodic engineering-health review.
- After a quarter of releases/incidents, to find the bottleneck.
- When deciding where to invest in process or tooling.

# The four metrics

## 1. Deployment frequency
How often code reaches production. Higher is healthier — it means small, low-risk batches.
Signal of trouble: infrequent, large releases.

## 2. Lead time for changes
Time from commit to running in production. Shorter means a tighter feedback loop.
Measure from first commit on a change to its production deploy.

## 3. Change failure rate
Percentage of deploys that cause a degradation requiring remediation (rollback, hotfix, incident).
Elite is low single digits. Rising rate means review/test gates are too weak.

## 4. Time to restore (MTTR)
Time from incident start to user impact ended. Pairs with incident-response.
Driven by detection speed, rollback ease, and runbook quality.

# How to read them together
- High failure rate + slow restore → invest in gates and rollback safety.
- Low deploy frequency + long lead time → batches too big; invest in CI and smaller changes.
- Good speed metrics + high failure rate → moving fast and breaking things; tighten review.
The goal is balance: speed AND stability move together in healthy teams.

# Method
1. Pull raw data: deploy log, `git log` for lead time, incident records for failures and MTTR.
2. Compute each metric for the period.
3. Compare to the previous period — direction matters more than absolute value.
4. Name the single biggest bottleneck and one concrete action to move it.

# Output
```
# DORA REVIEW — [period]
Deployment frequency: [value] (trend)
Lead time: [value] (trend)
Change failure rate: [value] (trend)
Time to restore: [value] (trend)
Bottleneck: [the one metric to improve next]
Recommended action: [one concrete change]
```
