#!/usr/bin/env bash
# Hook PostToolUse (user-level) — formata o arquivo editado com o prettier do projeto.
# Recebe o JSON do evento via stdin. Só age em arquivos DENTRO do projeto atual
# (CLAUDE_PROJECT_DIR) e só quando o projeto tem prettier — nunca toca ~/.claude.
set -uo pipefail

input=$(cat)
file_path=$(printf '%s' "$input" | python3 -c 'import json,sys
try:
  d=json.load(sys.stdin); print(d.get("tool_input",{}).get("file_path",""))
except Exception: print("")' 2>/dev/null || true)

[ -n "${file_path:-}" ] && [ -f "$file_path" ] || exit 0
proj="${CLAUDE_PROJECT_DIR:-$PWD}"
case "$file_path" in
  "$proj"/*) ;;                 # dentro do projeto: segue
  *) exit 0 ;;                  # fora (ex.: ~/.claude): não formata
esac
[ -f "$proj/package.json" ] || exit 0

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -f "$proj/.nvmrc" ] && (cd "$proj" && nvm use >/dev/null 2>&1) || true

case "$file_path" in
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css|*.md)
    (cd "$proj" && { yarn -s prettier --write "$file_path" >/dev/null 2>&1 \
      || npx --no-install prettier --write "$file_path" >/dev/null 2>&1; }) || true
    ;;
esac
exit 0
