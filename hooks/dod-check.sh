#!/usr/bin/env bash
# Gate de Definition of Done — invocável manualmente.
set -uo pipefail
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -f .nvmrc ] && nvm use >/dev/null 2>&1 || true

fail=0
check(){ if eval "$1" >/dev/null 2>&1; then echo "  [OK]  $2"; else echo "  [FALHA] $2"; fail=1; fi; }

echo "== Definition of Done =="
check "yarn test"      "testes passando"
check "yarn typecheck" "type-check limpo"
check "yarn lint"      "lint limpo"
check "yarn build"     "build compila"
check "git diff --quiet" "working tree sem mudanças não commitadas"

if [ "$fail" -eq 0 ]; then echo ">> DoD atendido."; exit 0
else echo ">> DoD NÃO atendido."; exit 1; fi
