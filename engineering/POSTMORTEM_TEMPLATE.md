# Template de Postmortem

> **Como usar (instruções para o agent):**
> - Preencha cada `{{placeholder}}` com dados reais. Se não souber um valor, marque `TBD` em vez de inventar.
> - Não invente números, VINs, timestamps ou nomes. Pergunte ou deixe `TBD`.
> - Blameless: descreva sistemas e decisões, nunca culpa de pessoa.
> - Tudo em PT-BR no corpo; identificadores, queries e nomes de tópicos/serviços em inglês.
> - Seções marcadas `(opcional)` podem ser removidas se não se aplicarem ao incidente.
> - Ao terminar, remova este bloco de instruções e a linha de título do template.

---

# POSTMORTEM

**{{título curto do incidente}}**

{{tipo de identificação: ex. "Incidente silencioso identificado em DD de mês de AAAA"}}

*{{relação com outro incidente, se houver — senão remover}}*

## 1. Informações Gerais

|  |  |
| :-- | :-- |
| **Data da identificação** | {{DD de mês de AAAA (dia da semana)}} |
| **Data de origem (root cause)** | {{quando o problema começou de fato}} |
| **Documento elaborado em** | {{DD de mês de AAAA}} |
| **Detecção** | {{como foi descoberto: alerta automático / reporte humano / investigação}} |
| **Severidade** | **{{SEV-1 / SEV-2 / SEV-3 — uma linha de justificativa}}** |
| **Duração** | {{tempo entre origem e detecção/mitigação}} |
| **Status** | **{{Mitigado / Mitigação em andamento / Resolvido / Investigando}}** |
| **Sistema/ecossistema afetado** | {{serviços, pipelines, tópicos}} |
| **Downstream afetado** | {{quem consome o que quebrou}} |
| **Relação com incidente anterior** | {{link/ref ou "Nenhuma"}} |

## 2. Resumo Executivo

{{2-4 parágrafos: o que aconteceu, qual o impacto, qual a causa raiz em alto nível e qual a mitigação. Linguagem acessível para quem não é dono do sistema.}}

> **TL;DR**
> {{1-3 frases. O essencial que alguém com 30 segundos precisa saber.}}

## 3. Como Foi Detectado

{{Narrativa cronológica da descoberta. Foi alerta ou reporte? Que passos de investigação levaram à confirmação?}}

- **Relato/sinal inicial:** {{...}}
- **Investigação progressiva:** {{passos sequenciais que descartaram/confirmaram hipóteses}}
- **Primeiro indício anômalo:** {{o achado que apontou a direção certa}}
- **Confirmação empírica:** {{como provou a causa, com evidência reproduzível}}

{{Se houver dados que confirmam o padrão, tabela aqui:}}

| {{coluna}} | {{coluna}} | {{coluna}} | Observação |
| :-- | :-- | :-- | :-- |
| {{...}} | {{...}} | {{...}} | {{...}} |

## 4. Análise de Causa Raiz

### 4.1 Arquitetura envolvida

{{Descreva o pipeline/fluxo afetado antes de explicar a falha. Componentes, suas configs relevantes e como se conectam.}}

| Componente | Tipo | Detalhe relevante | Config/estado |
| :-- | :-- | :-- | :-- |
| {{...}} | {{...}} | {{...}} | {{...}} |

### 4.2 O que revelou o problema (opcional)

{{Trecho de DDL/config/log/query que expôs a inconsistência. Use bloco de código.}}

```sql
{{cole aqui o artefato real}}
```

### 4.3 Mecanismo da falha

{{Explicação técnica precisa de POR QUE o sistema falhou. Inclua a lógica determinística/matemática se houver. Distinga sintoma de causa.}}

### 4.4 Por que a falha foi silenciosa / passou despercebida (opcional)

{{Se aplicável: por que não houve erro, exceção, log ou métrica que sinalizasse. Lacunas de observabilidade.}}

## 5. Relação com Incidente Anterior (opcional)

{{Se for consequência/colateral de outro incidente, descreva a sequência exata de eventos e o link causal. Senão, remover a seção.}}

| Momento | Ação tomada | Consequência (detectada ou não) |
| :-- | :-- | :-- |
| {{...}} | {{...}} | {{...}} |

## 6. Impacto

### 6.1 Impacto quantitativo

| Métrica | Valor |
| :-- | :-- |
| Duração | {{...}} |
| Volume afetado | {{...}} |
| % / nº de entidades afetadas | {{...}} |
| Tipo de impacto | {{ex: silencioso, sem alerta}} |

### 6.2 Impacto funcional

- **{{área 1}}:** {{o que ficou comprometido e consequência prática}}
- **{{área 2}}:** {{...}}
- **Operação:** {{decisões tomadas com dado incompleto, retrabalho, etc.}}

## 7. Solução

{{Apresente mitigação de curto prazo e correção definitiva. Para cada uma, dê os trade-offs.}}

### 7.1 Mitigação imediata

{{Descrição. Como executar — comandos reais prontos para colar.}}

```sql
{{passo a passo executável}}
```

**Validação da mitigação:**

```sql
{{como confirmar que funcionou — resultado esperado}}
```

| Prós | Contras |
| :-- | :-- |
| {{...}} | {{...}} |

### 7.2 Correção definitiva (opcional)

{{O fix que ataca o root cause. Requisitos: janela de manutenção? downtime? risco?}}

## 8. Cinco Porquês

| # | Pergunta | Resposta |
| :-- | :-- | :-- |
| 1 | {{Por que {sintoma}?}} | {{...}} |
| 2 | {{Por que {resposta 1}?}} | {{...}} |
| 3 | {{Por que {resposta 2}?}} | {{...}} |
| 4 | {{Por que {resposta 3}?}} | {{...}} |
| 5 | {{Por que {resposta 4}? — chega à causa sistêmica}} | {{...}} |

## 9. Lições Aprendidas

- {{Lição 1 — generalizável, não específica do bug}}
- {{Lição 2}}
- {{Lição 3}}

## 10. Action Items

> Cada item deve ter dono e prazo. Marque `TBD` o que ainda não foi confirmado, mas não deixe sem dono na versão final.

| # | Ação | Tipo | Prioridade | Dono | Prazo |
| :-- | :-- | :-- | :-- | :-- | :-- |
| AI-01 | {{...}} | Mitigação | Crítica | {{squad}} | {{data}} |
| AI-02 | {{...}} | Correção | Alta | {{squad}} | {{data}} |
| AI-03 | {{...}} | Detecção | Alta | {{squad}} | {{data}} |
| AI-04 | {{...}} | Auditoria | Média | {{squad}} | {{data}} |
| AI-05 | {{...}} | Prevenção | Média | {{squad}} | {{data}} |

Tipos sugeridos: `Mitigação`, `Correção`, `Detecção`, `Observabilidade`, `Auditoria`, `Prevenção`, `Runbook`, `Qualidade`, `Investigação`.

## 11. Métricas e Alertas Sugeridos (opcional)

{{Alertas específicos que teriam detectado o problema mais cedo. Inclua pseudo-queries quando útil.}}

```promql
{{exemplo de regra de alerta}}
```

## 12. Apêndices (opcional)

### 12.1 Glossário técnico

| Termo | Definição |
| :-- | :-- |
| {{...}} | {{...}} |

### 12.2 Evidências técnicas

{{Saídas de comando, DESCRIBE, logs, screenshots — o material bruto que sustenta a análise.}}

### 12.3 Referências

- {{links para postmortems relacionados, docs, tickets, dashboards}}
