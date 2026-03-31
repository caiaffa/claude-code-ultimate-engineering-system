# Claude Code Ultimate Engineering System v3

A complete engineering system for [Claude Code](https://claude.ai/code) with an **orchestrator + parallel subagents**.
A single `CLAUDE.md` automatically routes every request. You just describe what you need.

```
You describe the task (or use a /command)
        ↓
CLAUDE.md classifies and selects the pattern
        ↓
Subagents execute (parallel or sequential)
        ↓
Results synthesized with decision + risks + next steps
```

## Installation

### Prerequisites

- [Claude Code](https://claude.ai/code) installed and available in your `PATH`
- Bash-compatible shell (macOS/Linux)

### Global install (recommended)

Installs agents, commands, skills, and governance docs under `~/.claude/` so they are available in **every project** you open with Claude Code.

```bash
git clone https://github.com/caiaffa/claude-code-ultimate-engineering-system.git
cd claude-code-ultimate-engineering-system
chmod +x install-global.sh
./install-global.sh
```

What the installer does:

| Destination | Contents |
|---|---|
| `~/.claude/CLAUDE.md` | Global orchestrator (auto-loaded by Claude Code) |
| `~/.claude/agents/` | 7 specialized subagents |
| `~/.claude/commands/` | 6 slash commands |
| `~/.claude/skills/` | 38 engineering skills |

> If a `~/.claude/CLAUDE.md` already exists, a timestamped backup is created automatically.

### Per-project install

If you prefer to scope the system to a single repository, copy the files directly:

```bash
git clone https://github.com/caiaffa/claude-code-ultimate-engineering-system.git
cp -r claude-code-ultimate-engineering-system/{CLAUDE.md,AGENTS.md,QUICKSTART.md,.claude,skills} /path/to/your/project/
```

### Uninstall

To remove a global installation:

```bash
cd claude-code-ultimate-engineering-system
chmod +x uninstall-global.sh
./uninstall-global.sh
```

This removes all installed agents, commands, skills, and engineering docs. If a previous `CLAUDE.md` backup exists, it is restored automatically.

---

## Quick start

Open Claude Code in any project and use slash commands:

| Command | What it does | Pattern |
|---|---|---|
| `/implement [context]` | End-to-end feature: design → challenge → code → test → release | Phased (seq + parallel) |
| `/review [code]` | Code review: correctness + security + observability | Fan-out parallel |
| `/prd [context]` | PRD review: problem, value, metrics, gaps | Fan-out parallel |
| `/adr [context]` | ADR: design → parallel challenge → revise | Pipeline + parallel |
| `/incident [context]` | Incident: contain → parallel investigation → postmortem | Urgent → parallel |
| `/release [context]` | Release: parallel premortem → rollout plan | Parallel → sequential |

Or just describe what you need in natural language:

> "I want to implement a payments API with BullMQ for async processing"

The orchestrator classifies the request and routes it automatically.

---

## Subagents

| Agent | Model | Role |
|---|---|---|
| `principal-engineer` | Opus | Architecture, design, ADR, PRD |
| `backend-platform-engineer` | Sonnet | Implementation, code, tests |
| `architecture-challenger` | Opus | Adversarial review of designs |
| `staff-sre` | Sonnet | Production reliability, incidents, SLOs |
| `observability-engineer` | Sonnet | Telemetry, metrics, alerts |
| `security-engineer` | Sonnet | Auth, secrets, data exposure |
| `release-commander` | Sonnet | Rollout, rollback, migrations |

---

## Parallelism patterns

**Fan-out** — Multiple agents review in parallel, results synthesized at the end.

```
┌─ agent A ──┐
├─ agent B ──┤ → synthesize
└─ agent C ──┘
```

**Pipeline** — Sequential design → parallel challenge → loop if rejected.

```
design → [challenge A | challenge B] → approved? → next phase
```

**Phased** — Sequential phases with parallelism within each phase.

```
Phase 1 (seq): design
Phase 2 (seq): challenge
Phase 3 (par): implement | review | instrument
Phase 4 (seq): release plan
```

---

## What's included

### `.claude/agents/` — 7 subagents

Each agent has: name, description, model, allowed tools, system prompt, and output rules.

### `.claude/commands/` — 6 slash commands

Each command defines explicit phases with a parallelism pattern.

### `skills/` — 38 engineering skills

Each skill has: mission, handoff chain, red flags, checklist, anti-handwaving rule, and output format with severity.

### Governance docs — 8 files

Standards enforced by all agents: `SYSTEM_INVARIANTS`, `DECISION_RULES`, `ASYNC_CONTRACTS`, `SERVICE_SCORECARD`, `DEFINITION_OF_DONE`, `PROJECT_CONVENTIONS`, `OBSERVABILITY_STANDARDS`, `RELEASE_RULES`.

### Templates — 7 files

ADR, PRD, premortem, postmortem, business impact, engineering risks, decision quality.

---

## Cost optimization

Multi-agent workflows use 4–7x more tokens. To optimize:

- **Opus** only for `principal-engineer` and `architecture-challenger` (deep reasoning)
- **Sonnet** for everything else (focused execution)
- Max 3–4 parallel subagents at a time
- Set a subagent model override when needed:

```bash
export CLAUDE_CODE_SUBAGENT_MODEL=claude-sonnet-4-5-20250929
```

---

## License

MIT
