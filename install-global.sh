#!/usr/bin/env bash
# ============================================================
# Claude Code Ultimate Engineering System v5 — global installer
# ============================================================
# Installs the orchestrator, 6 subagents, slash commands, skills, governance
# docs and hooks under ~/.claude so they work in EVERY project.
#
#   ~/.claude/CLAUDE.md      orchestrator
#   ~/.claude/agents/        6 subagents
#   ~/.claude/commands/      slash commands
#   ~/.claude/skills/        skills (one dir per skill)
#   ~/.claude/engineering/   governance docs + templates
#   ~/.claude/hooks/         post-edit formatter + Definition-of-Done gate
#   ~/.claude/settings.json  merged, never overwritten (see settings.example.json)
#
# Everything that already exists is backed up to ~/.claude/backups/<ts>-pre-install/.
# ============================================================
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DST="${CLAUDE_HOME:-$HOME/.claude}"
TS="$(date +%Y%m%d-%H%M%S)"
BK="$DST/backups/$TS-pre-install"
G='\033[0;32m'; Y='\033[1;33m'; B='\033[0;34m'; N='\033[0m'

echo -e "${B}Claude Code Ultimate Engineering System v5 — installing into $DST${N}"
mkdir -p "$DST"/{agents,commands,skills,engineering,hooks,backups}

# ---- backup
mkdir -p "$BK"
for x in agents commands skills engineering hooks CLAUDE.md settings.json; do
  [ -e "$DST/$x" ] && cp -R "$DST/$x" "$BK/"
done
echo -e "${G}  ✓ backup: $BK${N}"

# ---- remove artifacts superseded since v3 (agents merged, skills consolidated)
for a in staff-sre observability-engineer; do
  [ -f "$DST/agents/$a.md" ] && rm -f "$DST/agents/$a.md" && echo -e "${Y}  – removed v3 agent $a (merged into reliability-engineer)${N}"
done
for s in adr-reviewer aws-production-systems business-impact-challenger code-reviewer \
         data-sql-engineering decision-quality-auditor deep-root-cause-investigator design-doc-writer \
         distributed-systems-skeptic failure-mode-and-effects-engineering high-signal-communication \
         incident-learning-loop infra-devops invariants-and-contracts-guardian kubernetes-operability \
         operational-excellence-enforcer otel-observability-architect postgres-performance-and-safety \
         postmortem-reviewer prd-challenger prd-gap-detector prd-metrics-reviewer premortem-facilitator \
         redis-bullmq-systems; do
  [ -d "$DST/skills/$s" ] && [ ! -L "$DST/skills/$s" ] && rm -rf "$DST/skills/$s" && echo -e "${Y}  – removed v3 skill $s (consolidated)${N}"
done
for f in DEFINITION_OF_DONE.md OBSERVABILITY_STANDARDS.md PROJECT_CONVENTIONS.md RELEASE_RULES.md; do
  [ -f "$DST/skills/$f" ] && rm -f "$DST/skills/$f"
done

# ---- install
cp "$SRC"/.claude/agents/*.md   "$DST/agents/"
cp "$SRC"/.claude/commands/*.md "$DST/commands/"
n=0; for d in "$SRC"/skills/*/; do s=$(basename "$d"); mkdir -p "$DST/skills/$s"; cp "$d/SKILL.md" "$DST/skills/$s/SKILL.md"; n=$((n+1)); done
cp "$SRC"/engineering/*.md      "$DST/engineering/"
cp "$SRC"/hooks/*.sh            "$DST/hooks/"; chmod +x "$DST"/hooks/*.sh
cp "$SRC/CLAUDE.md"             "$DST/CLAUDE.md"
echo -e "${G}  ✓ $(ls "$DST"/agents/*.md | wc -l | tr -d ' ') agents, $(ls "$DST"/commands/*.md | wc -l | tr -d ' ') commands, $n skills, $(ls "$DST"/engineering/*.md | wc -l | tr -d ' ') docs, hooks, CLAUDE.md${N}"

# ---- settings.json: merge only what the system needs; never clobber the user's permissions
python3 - "$DST/settings.json" <<'PY'
import json, os, sys
p = sys.argv[1]
d = json.load(open(p)) if os.path.exists(p) else {}
d.setdefault("$schema", "https://json.schemastore.org/claude-code-settings.json")
env = d.setdefault("env", {})
env["CLAUDE_CODE_SUBAGENT_MODEL"] = "claude-sonnet-5"   # ad-hoc agents; named agents pin their own model
hooks = d.setdefault("hooks", {})
post = hooks.setdefault("PostToolUse", [])
cmd = '"$HOME/.claude/hooks/post-edit-format.sh"'
for h in post:
    for hk in h.get("hooks", []):
        if hk.get("command", "").endswith("post-edit-format.sh\""):
            hk["command"] = cmd; break
    else: continue
    break
else:
    post.append({"matcher": "Edit|Write", "hooks": [{"type": "command", "command": cmd}]})
json.dump(d, open(p, "w"), indent=2); open(p, "a").write("\n")
print("  ✓ settings.json merged (env.CLAUDE_CODE_SUBAGENT_MODEL, PostToolUse hook)")
PY

# ---- validate the installed copy
"$SRC/scripts/validate.sh" "$DST"
echo ""
echo -e "${G}Done.${N} Restart Claude Code, then try: /implement, /review, /debug, /refactor, /onboard, /adr, /rfc, /incident, /release, /prd"
echo -e "Permissions are NOT changed by this script — see settings.example.json for the recommended allow/deny set."
