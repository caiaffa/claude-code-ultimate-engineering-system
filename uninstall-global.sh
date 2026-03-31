#!/usr/bin/env bash
set -euo pipefail

echo "Removendo Claude Code Ultimate Engineering System v3..."
echo ""

# Remove agents
for f in principal-engineer backend-platform-engineer architecture-challenger staff-sre observability-engineer security-engineer release-commander; do
    rm -f ~/.claude/agents/${f}.md && echo "  ✓ Removido agent: $f"
done

# Remove commands
for f in implement review prd adr incident release; do
    rm -f ~/.claude/commands/${f}.md && echo "  ✓ Removido command: /$f"
done

# Remove skills
if [ -d ~/.claude/skills ]; then
    rm -rf ~/.claude/skills
    echo "  ✓ Removido ~/.claude/skills/"
fi

# Remove engineering docs
if [ -d ~/.claude/engineering ]; then
    rm -rf ~/.claude/engineering
    echo "  ✓ Removido ~/.claude/engineering/"
fi

# Restore CLAUDE.md backup if exists
latest_backup=$(ls -t ~/.claude/CLAUDE.md.backup.* 2>/dev/null | head -1)
if [ -n "$latest_backup" ]; then
    mv "$latest_backup" ~/.claude/CLAUDE.md
    echo "  ✓ CLAUDE.md restaurado do backup"
else
    rm -f ~/.claude/CLAUDE.md
    echo "  ✓ Removido ~/.claude/CLAUDE.md"
fi

echo ""
echo "Desinstalação completa."
