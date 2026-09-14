# Claude Code Ultimate Engineering System v5

An opinionated engineering system for [Claude Code](https://claude.ai/code):
one orchestrator (`CLAUDE.md`), **6 specialized subagents**, **10 slash-command
workflows**, **21 skills**, governance docs, and hooks — installed globally so it
works in every repository you open.

```
You describe the task (or use a /command)
        ↓
CLAUDE.md classifies it and picks the execution pattern
        ↓
Subagents run — sequential where there is a decision gate, parallel where work is independent
        ↓
One synthesis: decision · evidence · trade-offs · risks · next actions
```

This is the system I run at work. It is tuned for a NestJS / Postgres / Redis-BullMQ
backend shop and for Kovi's engineering process (RFC-0001, blameless postmortems,
PT-BR templates). Fork it and adapt `engineering/` and the `/rfc`, `/prd-sync`
commands to your own process.

## Install

```bash
git clone https://github.com/caiaffa/claude-code-ultimate-engineering-system.git
cd claude-code-ultimate-engineering-system
./install-global.sh
```

The installer backs up whatever is in `~/.claude/` to `~/.claude/backups/<ts>-pre-install/`,
copies the system in, removes artifacts superseded since v3, **merges** (never overwrites)
`~/.claude/settings.json`, and validates the result. Restart Claude Code afterwards.

| Destination | Contents |
|---|---|
| `~/.claude/CLAUDE.md` | Orchestrator — routing, patterns, hard rules |
| `~/.claude/agents/` | 6 subagents |
| `~/.claude/commands/` | 11 slash commands |
| `~/.claude/skills/` | 21 skills |
| `~/.claude/engineering/` | 21 governance docs, checklists and templates |
| `~/.claude/hooks/` | post-edit formatter, Definition-of-Done gate |

Permissions are yours to set — `settings.example.json` has the recommended allow/deny list
(broad execution, five safety denials). `./uninstall-global.sh` removes everything it installed.

## Commands

| Command | Flow |
|---|---|
| `/implement <feature>` | context → design → challenge → build → parallel review → fix → release plan |
| `/review <pr\|branch\|range>` | one diff → 3 parallel reviewers (code, security, reliability) → merged verdict |
| `/debug <symptom>` | reproduce → 3 hypotheses with one signal each → parallel investigation → fix + regression test → prevent |
| `/refactor <target>` | characterize → challenge the plan → one mergeable step at a time → review |
| `/onboard [repo]` | map architecture, conventions, dev workflow, danger zones; saved to agent memory |
| `/rfc <decision>` | draft (RFC-0001 template) → challenge → revise → persist to the vault |
| `/adr <decision>` | lightweight record for small, local, reversible decisions |
| `/prd <prd>` | two-lens PRD review (engineering + product) with readiness score |
| `/incident <alert>` | contain (urgent, sequential) → parallel investigation → blameless postmortem |
| `/release <change>` | parallel premortem + readiness → rollout plan with gates and rollback triggers |

`/prd-sync` is a Kovi-specific helper that turns PRD PDFs into versioned markdown and reviews them.

## Agents

| Agent | Model | Owns |
|---|---|---|
| `principal-engineer` | fable · xhigh · read-only | architecture, ADR/RFC, PRD, scope |
| `architecture-challenger` | opus · xhigh · read-only | adversarial review — **deliberately a different model from the author** |
| `backend-platform-engineer` | sonnet (escalated to opus for multi-service/migration/async work) | implementation, tests, debugging, refactoring |
| `reliability-engineer` | sonnet | incidents, SLOs, observability, performance, readiness; uses the Grafana MCP when present |
| `security-engineer` | sonnet · read-only | auth, secrets, data exposure, tenant isolation |
| `release-commander` | sonnet | rollout, migration, rollback plans |

Each agent preloads its skills and keeps persistent memory: `user` scope for the
thinkers/reviewers (patterns that hold across repos), `local` for the builder
(per-repo conventions). Read-only agents return text; the orchestrator writes files.

Cost dial: `principal-engineer` is the only Fable agent. Set `model: opus` in
`.claude/agents/principal-engineer.md` if you want to halve the design phase's price.

## Hard rules the orchestrator enforces

- Builder and challenger are always different agents; nobody reviews their own design.
- Every critical change and every refactor plan passes the challenger; loops cap at 2.
- Reviews run **after** the code exists, on one shared diff.
- No "looks good", "scalable", "production-ready" without a named mechanism.
- Done = passes `engineering/DEFINITION_OF_DONE.md`. Tests run before every commit; never commit red.
- Every finding from every subagent survives into the synthesis.

## Layout

```
CLAUDE.md               orchestrator (identical to ~/.claude/CLAUDE.md after install)
.claude/agents/         6 subagents
.claude/commands/       11 slash commands
skills/<name>/SKILL.md  21 skills
engineering/            governance docs, checklists, templates
hooks/                  post-edit-format.sh, dod-check.sh
scripts/validate.sh     frontmatter + cross-reference checks (run before committing)
```

`scripts/validate.sh` is the test suite: it checks every agent/skill/command frontmatter,
model and effort values, that preloaded skills exist, that commands only reference real
agents, and that no stale v3 names or paths survive. `scripts/validate.sh ~/.claude`
validates an installed copy.

## License

MIT
