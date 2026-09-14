# Quickstart

Install (`./install-global.sh`), restart Claude Code, open any repo.

## Describe the task or use a command

| You want to… | Use |
|---|---|
| build a feature end to end | `/implement <feature>` |
| review a PR / branch / diff | `/review <pr or range>` |
| fix a bug, regression, or flaky test | `/debug <symptom>` |
| clean up or extract a module safely | `/refactor <target>` |
| understand a repo before touching it | `/onboard` |
| decide something significant | `/rfc <decision>` (small & reversible → `/adr`) |
| review a PRD | `/prd <prd or Drive name>` |
| handle production breakage | `/incident <alert>` |
| ship safely | `/release <change>` |

Or just say what you need — `CLAUDE.md` classifies and routes it. Trivial
questions and one-line edits are answered directly; orchestration is only used
for production, multi-file, or architectural work.

## What a run looks like

`/implement` → context map → principal-engineer designs → architecture-challenger
attacks (gate) → backend-platform-engineer builds with tests → three reviewers in
parallel on the diff → fixes → release-commander plans the rollout → DoD gate.

Every multi-agent result ends with the same synthesis: Decision · Evidence ·
Trade-offs · Risks · Next actions.

## Cost

Fable only on `principal-engineer`; Opus on the challenger; Sonnet everywhere
else (escalated to Opus by the orchestrator when the change is genuinely
complex). Max 3–4 parallel agents; each gets only the context it needs. Use
`/clear` between large tasks.
