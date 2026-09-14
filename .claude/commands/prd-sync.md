---
description: Converte PDFs de PRD soltos em prds/ para markdown versionado e roda o review (principal-engineer + prd-review)
---

# /prd-sync — PDF solto → pasta + Markdown versionado → review

Processa PRDs baixados manualmente do Google Drive como PDF (workaround para Docs
bloqueados com *"ineligible to be used in generative AI contexts"*). O usuário
dropa o PDF **solto** na pasta mãe `prds/`; este comando cria a estrutura, gera o
markdown, **delega o review ao subagente `principal-engineer`**, versiona, e por
fim deleta o PDF fonte.

**Vault:** `~/code/kovi/staff/claude/vault/prds/` (referido abaixo como `prds/`).

## Convenções INVIOLÁVEIS do vault

- Escrita de conteúdo no vault **somente pela tool Write** (que cria os
  diretórios-pai sozinha — nunca use `mkdir`).
- **Leitura/descoberta no vault: use as tools Read/Glob** — NÃO use Bash
  sandboxed nesta pasta. O overlay do sandbox tem snapshot stale e já clobberou
  o diretório (apagou subpastas/metadata). Isso vale inclusive para comandos de
  leitura como `ls`/`cat`.
- **Bash neste vault só com `dangerouslyDisableSandbox: true`** (FS real, sem
  overlay), e apenas para o que as tools não fazem: `shasum -a 256` do PDF e o
  `rm` final do PDF fonte (passo 7). O `rm` só após verificar que os outputs
  existem e não estão vazios.
- O `.md` é espelho **read-only** depois de escrito; o review vai SEMPRE no
  `.review.md` irmão. Nunca edite o review dentro do `.md`.
- PRDs e reviews em **português**.

## Passo 1 — Descobrir PDFs a processar

- Liste PDFs soltos na raiz com a tool **Glob** (`prds/*.pdf`) — não com Bash.
- Para cada PDF, calcule `shasum -a 256 <pdf>` via Bash **com
  `dangerouslyDisableSandbox: true`** (caminho explícito).
- Leia `prds/.sync-state.json` com a tool **Read**. Se o sha256 já consta como
  processado → **pule** (idempotência) e logue "sem alteração".
- Se não houver nenhum PDF solto novo, reporte isso e encerre.

## Passo 2 — Identificar o PRD e decidir new vs update

- Leia o PDF com o **Read tool** (use `pages` se >10 páginas; fatie em blocos de
  ≤20 páginas).
- Extraia o **título** do PRD do conteúdo. Normalize para `slug`: minúsculo,
  kebab-case, prefixo `prd-` (ex.: "PRD - Checklist Remoto Recolha Safety" →
  `prd-checklist-remoto-recolha-safety`). Use o nome do arquivo só como fallback
  se não houver título identificável (e marque para revisão manual no log).
- Verifique se `prds/<slug>/` existe:
  - **Não existe** → PRD novo, **v1**.
  - **Existe** → leia o `<slug>.md` atual e compare o conteúdo:
    - Equivalente (sem mudança real) → pule, logue "sem alteração".
    - Mudou → **update**, próxima versão `vN+1`.

## Passo 3a — PDF → `<slug>.md` (caso NOVO, v1)

Escreva `prds/<slug>/<slug>.md` (Write) com frontmatter:

```yaml
---
title: "<título extraído>"
slug: "<slug>"
version: 1
source: "drive-download (manual PDF)"
source_file: "<nome-do-pdf>.pdf"
source_sha256: "<sha>"
drive_id: ""            # opcional; preencher se souber
synced_at: "<ISO 8601 agora>"
---
```

Corpo: markdown **fiel** ao PDF (headings, tabelas, listas) — NÃO resuma; resumo
é trabalho do review. Crie `prds/<slug>/.meta.json` com a entrada da v1
(`version`, `source_sha256`, `synced_at`; `verdict`/`score` preenchidos no passo 4).

## Passo 3b — Update versionado (caso PRD JÁ EXISTE)

1. **Arquive** a versão atual (Read + Write):
   - `<slug>.md` → `versions/<slug>.v<N>.md`
   - `<slug>.review.md` → `versions/<slug>.v<N>.review.md`
2. Escreva o novo `<slug>.md` (`version: N+1`, novo `source_sha256` e `synced_at`).
3. Faça append no `.meta.json` com a nova versão.

## Passo 4 — Review (DELEGADO ao subagente `principal-engineer`)

Lance o subagente via **Agent tool** com `subagent_type: principal-engineer`. O
comando NÃO revisa inline. O `principal-engineer` é read-only (sem tool Write):
ele **devolve o report completo na resposta final** e o orquestrador grava o
arquivo com a tool Write. Passe ao agente o caminho do `<slug>.md` e instrua:

- Usar a skill **prd-review** (duas lentes: engenharia + produto/PM).
- Produzir o report em **português** (destino: `prds/<slug>/<slug>.review.md`), no formato
  do exemplo `prds/prd-checklist-remoto-recolha-safety/...review.md`: veredito
  (APPROVE/ADJUST/REJECT), nível (DRAFT/REVIEWABLE/ENGINEERING-READY) + score,
  completeness scorecard, product gaps, engineering gaps, perguntas ao PM. NÃO
  reescrever o PRD.
- Cross-checar feasibility com `~/.claude/engineering/SYSTEM_INVARIANTS.md` e
  `DECISION_RULES.md` (governance global) e registrar o que conflita.
- **Se for update (vN+1):** ler `versions/<slug>.v<N>.review.md` e a memória local
  do principal-engineer (`~/.claude/agent-memory/principal-engineer/`, memória
  `user`, compartilhada entre repos) e:
  - Incluir seção **"Mudanças desde a v<N>"** (o que entrou de novo no PRD).
  - Listar os blockers da review anterior marcando cada um como
    **resolvido / parcial / ainda aberto**.
  - Re-pontuar o readiness considerando o que foi endereçado.

Depois que o agente terminar, leia o veredito/score e grave no `.meta.json`.

## Passo 5 — Atualizar metadados do vault (Write only)

- Append em `prds/.sync-log.md`: data, e por PDF → slug, versão, new/update/skip,
  veredito+score, gotchas (PDF ilegível, doc vazio, sem título).
- `prds/_index.md`: uma linha por PRD (link para `<slug>/<slug>.md` + versão atual
  + veredito/score).
- `prds/.sync-state.json`: adicione entrada por sha256 processado → `{slug,
  version, synced_at}` (preserve as chaves de shortcut do Drive já existentes).

## Passo 7 — Deletar o PDF fonte (cleanup — só após verificação)

Para cada PDF processado com sucesso:

1. **Verifique** (Read) que `prds/<slug>/<slug>.md` existe e é não-vazio E que
   `prds/<slug>/<slug>.review.md` existe e é não-vazio.
2. Só então delete o PDF: `rm '<caminho-exato-do-pdf>'` com
   `dangerouslyDisableSandbox: true`. **Um arquivo por vez, caminho explícito** —
   nunca glob, nunca `-r`, nunca `-f` em diretório.
3. Se a verificação falhar (md/review ausente ou vazio, PDF ilegível) → **NÃO
   delete**. Deixe o PDF e logue como pendente no `.sync-log.md`.

## Passo 8 — Resumo final ao usuário

Tabela: `pdf → slug → versão → new/update/skip → veredito/score → pdf deletado? → notas`.

## Tratamento de erros (nunca abortar a run inteira)

- PDF sem texto extraível (escaneado) → logar `unresolved`, NÃO deletar, seguir.
- Sem título identificável → slug pelo nome do arquivo, marcar para revisão manual.
- Doc vazio/curto demais → review como DRAFT, seguir.
