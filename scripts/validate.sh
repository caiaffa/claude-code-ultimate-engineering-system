#!/usr/bin/env bash
# Validates the system layout: frontmatter, required fields, agent<->skill links,
# command<->agent links, and stale references. Usage: scripts/validate.sh [root]
# root defaults to the repo; pass ~/.claude to validate an installed copy.
set -uo pipefail
ROOT="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
if [ -d "$ROOT/.claude/agents" ]; then AG="$ROOT/.claude/agents"; CM="$ROOT/.claude/commands"; else AG="$ROOT/agents"; CM="$ROOT/commands"; fi
SK="$ROOT/skills"
python3 - "$AG" "$CM" "$SK" "$ROOT" <<'PY'
import sys, os, re, glob
ag, cm, sk, root = sys.argv[1:5]
errors = []
def fm(path):
    s = open(path, encoding="utf-8").read()
    m = re.match(r"^---\n(.*?)\n---\n", s, re.S)
    if not m:
        errors.append(f"{path}: missing frontmatter"); return {}, s
    d = {}; key = None
    for line in m.group(1).splitlines():
        if re.match(r"^\s+-\s", line) and key:
            d.setdefault(key, []); d[key] = (d[key] if isinstance(d[key], list) else []) + [line.split("-",1)[1].strip()]
        elif re.match(r"^[A-Za-z_-]+:", line):
            key, val = line.split(":", 1); d[key.strip()] = val.strip()
        elif line.startswith(" ") and key:
            d[key] = (d[key] + " " + line.strip()).strip()
    return d, s
skills = {os.path.basename(os.path.dirname(p)) for p in glob.glob(f"{sk}/*/SKILL.md")}
agents = {}
for p in sorted(glob.glob(f"{ag}/*.md")):
    d, s = fm(p); name = os.path.basename(p)[:-3]; agents[name] = d
    for k in ("name", "description", "model", "tools"):
        if k not in d: errors.append(f"{p}: missing '{k}'")
    if d.get("name") and d["name"] != name: errors.append(f"{p}: name '{d['name']}' != filename")
    if d.get("model") and d["model"] not in {"sonnet","opus","haiku","fable","inherit"} and not d["model"].startswith("claude-"):
        errors.append(f"{p}: unknown model alias '{d['model']}'")
    if d.get("effort") and d["effort"] not in {"low","medium","high","xhigh","max"}:
        errors.append(f"{p}: invalid effort '{d['effort']}'")
    for s_ in (d.get("skills") or []):
        if s_ not in skills: errors.append(f"{p}: preloads unknown skill '{s_}'")
for p in sorted(glob.glob(f"{sk}/*/SKILL.md")):
    d, s = fm(p)
    for k in ("name", "description"):
        if k not in d: errors.append(f"{p}: missing '{k}'")
    if d.get("name") and d["name"] != os.path.basename(os.path.dirname(p)): errors.append(f"{p}: name != directory")
    at = d.get("allowed-tools", "")
    if at and re.search(r"\b(Read|Grep|Glob|Bash|Write|Edit)\s+(Read|Grep|Glob|Bash|Write|Edit)", at):
        errors.append(f"{p}: allowed-tools must be comma-separated")
for p in sorted(glob.glob(f"{cm}/*.md")):
    d, s = fm(p)
    if "description" not in d: errors.append(f"{p}: missing 'description'")
    for a in re.findall(r"\*\*([a-z-]+)\*\*", s):
        if a.endswith("-engineer") or a.endswith("-challenger") or a.endswith("-commander"):
            if a not in agents: errors.append(f"{p}: references unknown agent '{a}'")
stale = re.compile(r"governance/|templates/[A-Z_]+\.md|staff-sre|observability-engineer|otel-observability-architect|code-reviewer\b|isolation: worktree")
for p in glob.glob(f"{ag}/*.md") + glob.glob(f"{cm}/*.md") + glob.glob(f"{sk}/*/SKILL.md") + [f"{root}/CLAUDE.md"]:
    if os.path.islink(os.path.dirname(p)) or not os.path.exists(p): continue
    for i, line in enumerate(open(p, encoding="utf-8"), 1):
        if stale.search(line): errors.append(f"{p}:{i}: stale reference: {line.strip()[:80]}")
print(f"agents={len(agents)} skills={len(skills)} commands={len(glob.glob(f'{cm}/*.md'))}")
if errors:
    print("\n".join("  FAIL " + e for e in errors)); sys.exit(1)
print("OK")
PY
