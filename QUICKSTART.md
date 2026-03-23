# QUICKSTART

Guia rápido para usar o Claude Code Ultimate Engineering System sem precisar lembrar dezenas de skills e agentes.

## Regra simples
Para qualquer mudança importante, siga este trio:

1. **Desenhar**
2. **Desafiar**
3. **Validar produção**

Agentes padrão:
- **Desenhar** → `principal-engineer` ou `backend-platform-engineer`
- **Desafiar** → `architecture-challenger`
- **Validar produção** → `staff-sre` ou `release-commander`

---

## 1. Superprompt para PRD

Use este prompt sempre que quiser validar um PRD com foco em problema real, métrica, baseline, ganho esperado e custo.

```text
Atue como principal-engineer.

Quero que você faça uma revisão executiva e técnica deste PRD.
Use as skills mais relevantes entre:
- prd-challenger
- business-impact-challenger
- prd-metrics-reviewer
- prd-gap-detector
- decision-quality-auditor

Quero que você avalie obrigatoriamente:

1. Se o problema de negócio está bem definido
2. Se existe evidência real de que esse problema existe hoje
3. Qual é a baseline atual das métricas
4. Qual métrica principal deveria melhorar
5. Quais métricas secundárias e guardrails faltam
6. Qual ganho esperado o PRD está prometendo
7. Se existe mecanismo causal crível entre solução e ganho esperado
8. Se o escopo está proporcional ao valor esperado
9. Quais requisitos de engenharia, operação, segurança, dados e suporte estão implícitos mas não explicitados
10. Se vale aprovar, ajustar ou rejeitar

Formato de resposta:
- resumo executivo
- pontos fortes
- lacunas críticas
- baseline e métricas
- hipótese de ganho
- riscos e custos escondidos
- recomendação final: aprovar, ajustar ou rejeitar
```

### Versão curta do superprompt de PRD
```text
Atue como principal-engineer.
Revise este PRD usando prd-challenger, business-impact-challenger e prd-metrics-reviewer.
Quero saber:
- se o problema é real
- qual baseline existe
- qual ganho esperado existe
- quais guardrails faltam
- se o custo compensa
- se devo aprovar, ajustar ou rejeitar
```

---

## 2. Validar ideia

```text
Atue como principal-engineer.
Quero validar essa ideia do ponto de vista de negócio, arquitetura e risco.
Use as skills que forem mais relevantes entre prd-challenger, business-impact-challenger, architecture-decisions e engineering-economics.
No final, diga: aprovar, ajustar ou rejeitar.
```

---

## 3. Revisar ADR

```text
Atue como principal-engineer.
Use adr-reviewer, architecture-decisions e engineering-economics.
Revise esta ADR com foco em:
- clareza do problema
- trade-offs
- reversibilidade
- custo operacional
- risco de longo prazo
- rollout e rollback
```

### Challenger da ADR
```text
Agora atue como architecture-challenger.
Use adr-challenger e distributed-systems-skeptic.
Tente quebrar essa ADR.
Quero os pontos fracos, suposições escondidas e o que mais tende a dar errado em produção.
```

---

## 4. Implementar feature

```text
Atue como backend-platform-engineer.
Use nestjs-architecture-guardian, test-strategy e api-design.
Com base neste contexto, proponha a melhor implementação com:
- arquitetura
- boundaries
- contratos
- testes necessários
- riscos
```

### Challenger da feature
```text
Agora atue como architecture-challenger.
Use failure-mode-and-effects-engineering e invariants-and-contracts-guardian.
Quero saber como essa feature pode falhar, quais invariantes podem quebrar e o que precisa mudar antes de subir.
```

---

## 5. Worker / BullMQ / Redis

```text
Atue como backend-platform-engineer.
Use redis-bullmq-systems, node-runtime-reliability e postgres-performance-and-safety.
Revise este fluxo com foco em:
- idempotência
- retries
- concorrência
- consistência no Postgres
- stuck jobs
- backlog
- graceful shutdown
```

### Observabilidade do worker
```text
Agora atue como observability-engineer.
Use otel-observability-architect.
Defina logs, métricas, spans, alertas e sinais de backlog para esse fluxo.
```

---

## 6. Incidente

```text
Atue como staff-sre.
Use incident-response, systematic-debugging e operational-excellence-enforcer.
Quero:
- contenção imediata
- hipóteses mais prováveis
- sinais para validar cada hipótese
- próximos passos seguros
```

### Causa raiz
```text
Agora atue como backend-platform-engineer.
Use deep-root-cause-investigator.
Monte a cadeia de causa raiz:
- sintoma
- gatilho
- causa local
- condição sistêmica
- por que não detectamos
- por que não contivemos
```

### Aprendizado estrutural
```text
Use postmortem-reviewer e incident-learning-loop.
Transforme esse incidente em aprendizado estrutural, padrões e mudanças permanentes.
```

---

## 7. Release

```text
Atue como release-commander.
Use release-planning e operational-excellence-enforcer.
Monte:
- pré-condições
- passos de rollout
- sinais de sucesso
- sinais de rollback
- checklist de owner
- pontos irreversíveis
```

---

## 8. Fluxo mínimo recomendado

### Para PRD
1. `principal-engineer`
2. `prd-challenger`
3. `business-impact-challenger`

### Para ADR
1. `principal-engineer`
2. `adr-reviewer`
3. `architecture-challenger`

### Para feature
1. `backend-platform-engineer`
2. `architecture-challenger`
3. `staff-sre`

### Para worker/fila
1. `backend-platform-engineer`
2. `observability-engineer`
3. `staff-sre`

### Para incidente
1. `staff-sre`
2. `backend-platform-engineer`
3. `incident-learning-loop`

### Para release
1. `release-commander`
2. `staff-sre`

---

## 9. Regra final
Se estiver em dúvida, use sempre esta sequência:

- **validar valor**
- **desenhar solução**
- **tentar quebrar**
- **validar produção**

Isso já resolve a maior parte dos cenários sem precisar decorar tudo.
