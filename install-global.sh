#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Claude Code Ultimate Engineering System v3 — Instalador Global
# ============================================================
# Instala agents, commands, skills e CLAUDE.md globalmente
# para funcionar em QUALQUER projeto.
#
# Paths usados:
#   ~/.claude/agents/       → subagents (user-level)
#   ~/.claude/commands/     → slash commands (user-level)
#   ~/.claude/skills/       → skills (user-level)
#   ~/.claude/CLAUDE.md     → orquestrador global
#   ~/.claude/engineering/  → governance docs + templates
# ============================================================

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BOLD}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}║  Claude Code Ultimate Engineering System v3          ║${NC}"
echo -e "${BOLD}║  Instalação Global                                   ║${NC}"
echo -e "${BOLD}╚══════════════════════════════════════════════════════╝${NC}"
echo ""

# ---- Check Claude Code ----
if ! command -v claude &> /dev/null; then
    echo -e "${YELLOW}⚠  Claude Code não encontrado no PATH.${NC}"
    echo -e "   Instale em: https://claude.ai/code"
    echo -e "   Continuando a instalação dos arquivos..."
    echo ""
fi

# ---- Create directories ----
echo -e "${BLUE}→ Criando diretórios globais...${NC}"
mkdir -p ~/.claude/agents
mkdir -p ~/.claude/commands
mkdir -p ~/.claude/skills
mkdir -p ~/.claude/engineering
echo -e "${GREEN}  ✓ ~/.claude/agents/${NC}"
echo -e "${GREEN}  ✓ ~/.claude/commands/${NC}"
echo -e "${GREEN}  ✓ ~/.claude/skills/${NC}"
echo -e "${GREEN}  ✓ ~/.claude/engineering/${NC}"
echo ""

# ---- Install CLAUDE.md (global orchestrator) ----
echo -e "${BLUE}→ Instalando CLAUDE.md (orquestrador global)...${NC}"
if [ -f ~/.claude/CLAUDE.md ]; then
    cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup.$(date +%Y%m%d%H%M%S)
    echo -e "${YELLOW}  ⚠ Backup do CLAUDE.md existente criado${NC}"
fi
cp "$SCRIPT_DIR/CLAUDE.md" ~/.claude/CLAUDE.md
echo -e "${GREEN}  ✓ ~/.claude/CLAUDE.md${NC}"
echo ""

# ---- Install agents ----
echo -e "${BLUE}→ Instalando 7 subagents...${NC}"
for agent in "$SCRIPT_DIR"/.claude/agents/*.md; do
    name=$(basename "$agent")
    cp "$agent" ~/.claude/agents/"$name"
    echo -e "${GREEN}  ✓ $name${NC}"
done
echo ""

# ---- Install commands ----
echo -e "${BLUE}→ Instalando 6 slash commands...${NC}"
for cmd in "$SCRIPT_DIR"/.claude/commands/*.md; do
    name=$(basename "$cmd")
    cp "$cmd" ~/.claude/commands/"$name"
    echo -e "${GREEN}  ✓ /$name${NC}"
done
echo ""

# ---- Install skills ----
echo -e "${BLUE}→ Instalando 38 skills...${NC}"
count=0
for skill_dir in "$SCRIPT_DIR"/skills/*/; do
    skill_name=$(basename "$skill_dir")
    mkdir -p ~/.claude/skills/"$skill_name"
    cp "$skill_dir"SKILL.md ~/.claude/skills/"$skill_name"/SKILL.md
    count=$((count + 1))
done
# Copy skills root docs
for doc in "$SCRIPT_DIR"/skills/*.md; do
    cp "$doc" ~/.claude/skills/
done
echo -e "${GREEN}  ✓ $count skills instaladas${NC}"
echo ""

# ---- Install governance docs + templates ----
echo -e "${BLUE}→ Instalando governance docs e templates...${NC}"
for doc in "$SCRIPT_DIR"/*.md; do
    name=$(basename "$doc")
    # Skip README, CLAUDE.md (already installed), QUICKSTART
    case "$name" in
        README.md|CLAUDE.md) continue ;;
    esac
    cp "$doc" ~/.claude/engineering/"$name"
    echo -e "${GREEN}  ✓ $name${NC}"
done
echo ""

# ---- Update CLAUDE.md to reference global paths ----
echo -e "${BLUE}→ Atualizando paths no CLAUDE.md para global...${NC}"

# Add reference to engineering docs location
if ! grep -q "engineering/" ~/.claude/CLAUDE.md; then
    cat >> ~/.claude/CLAUDE.md << 'APPENDEOF'

---

## Global installation paths

This system is installed globally. Reference paths:
- **Agents:** `~/.claude/agents/`
- **Commands:** `~/.claude/commands/`
- **Skills:** `~/.claude/skills/`
- **Governance docs & templates:** `~/.claude/engineering/`

When a skill or agent references a governance doc (e.g., SYSTEM_INVARIANTS.md, DECISION_RULES.md),
look for it in `~/.claude/engineering/`.
APPENDEOF
fi
echo -e "${GREEN}  ✓ Paths globais adicionados ao CLAUDE.md${NC}"
echo ""

# ---- Summary ----
echo -e "${BOLD}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}║  Instalação completa!                                ║${NC}"
echo -e "${BOLD}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${GREEN}✓${NC} ${BOLD}7${NC} subagents em ~/.claude/agents/"
echo -e "  ${GREEN}✓${NC} ${BOLD}6${NC} commands em ~/.claude/commands/"
echo -e "  ${GREEN}✓${NC} ${BOLD}38${NC} skills em ~/.claude/skills/"
echo -e "  ${GREEN}✓${NC} ${BOLD}19${NC} docs em ~/.claude/engineering/"
echo -e "  ${GREEN}✓${NC} ${BOLD}1${NC} CLAUDE.md em ~/.claude/"
echo ""
echo -e "${BOLD}Como usar:${NC}"
echo -e "  Abra Claude Code em qualquer projeto e use:"
echo -e "    ${BLUE}/implement${NC}  — feature end-to-end"
echo -e "    ${BLUE}/review${NC}    — code review paralelo"
echo -e "    ${BLUE}/prd${NC}       — revisão de PRD"
echo -e "    ${BLUE}/adr${NC}       — criar/revisar ADR"
echo -e "    ${BLUE}/incident${NC}  — resposta a incidente"
echo -e "    ${BLUE}/release${NC}   — plano de release"
echo ""
echo -e "  Ou descreva o que precisa em linguagem natural."
echo -e "  O orquestrador roteia automaticamente."
echo ""
echo -e "${YELLOW}Dica:${NC} Para usar modelos diferentes nos subagents:"
echo -e "  export CLAUDE_CODE_SUBAGENT_MODEL=claude-sonnet-4-5-20250929"
echo ""
