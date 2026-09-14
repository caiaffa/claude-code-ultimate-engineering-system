#!/usr/bin/env bash
# Removes the v5 system from ~/.claude. Backups in ~/.claude/backups/ are kept.
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DST="${CLAUDE_HOME:-$HOME/.claude}"
echo "Removing Claude Code Ultimate Engineering System v5 from $DST ..."
for f in "$SRC"/.claude/agents/*.md;   do rm -f "$DST/agents/$(basename "$f")"; done;   echo "  ✓ agents"
for f in "$SRC"/.claude/commands/*.md; do rm -f "$DST/commands/$(basename "$f")"; done; echo "  ✓ commands"
for d in "$SRC"/skills/*/; do s=$(basename "$d"); [ -L "$DST/skills/$s" ] || rm -rf "$DST/skills/$s"; done; echo "  ✓ skills (symlinked community skills kept)"
for f in "$SRC"/engineering/*.md; do rm -f "$DST/engineering/$(basename "$f")"; done; rmdir "$DST/engineering" 2>/dev/null || true; echo "  ✓ engineering docs"
for f in "$SRC"/hooks/*.sh; do rm -f "$DST/hooks/$(basename "$f")"; done; echo "  ✓ hooks"
rm -f "$DST/CLAUDE.md"; echo "  ✓ CLAUDE.md (restore one from $DST/backups/ if you had a custom one)"
echo "settings.json was left untouched — remove env.CLAUDE_CODE_SUBAGENT_MODEL and the PostToolUse hook by hand if you want."
echo "Done."
