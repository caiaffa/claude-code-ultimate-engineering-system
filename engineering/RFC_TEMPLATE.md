# Template de RFC

> **Como usar (instruções para o agent):**
> - Padrão oficial definido na RFC-0001 da Kovi. Preencha cada `{{placeholder}}`
>   com dados reais; o que não souber, marque `TBD` — não invente.
> - Identifique pessoas SEMPRE por e-mail corporativo (`nome@kovi.com.br`),
>   nunca por @username.
> - Mínimo de 2 alternativas reais em "Alternativas Consideradas" — sem strawman.
> - Métricas de sucesso devem ter baseline e target mensuráveis.
> - Corpo em PT-BR; identificadores, comandos e nomes de serviço em inglês.
> - Seções opcionais podem ser removidas se não se aplicarem.
> - Ao terminar, remova este bloco de instruções.

---

# RFC-{{XXXX}}: {{Título Descritivo da RFC}}

- **Data de Criação:** {{YYYY-MM-DD}}
- **Autores:** {{email.principal@kovi.com.br}}
- **Revisores:** {{Seniors ou Staff Engineers — emails}}
- **Status:** {{Proposto | Em Revisão | Aprovado | Rejeitado | Implementado | Arquivado}}

---

## 📋 Resumo Executivo

{{Visão geral concisa em 2-3 parágrafos: o que a RFC propõe e por quê.}}

## 🎯 Motivação e Contexto

### Problema Atual
{{Qual o problema, com dados que provem que ele existe hoje.}}

### Por Que Agora?
{{O que torna este o momento de resolver.}}

### Objetivos
- **Primário:** {{...}}
- **Secundários:** {{...}}

| Métrica | Baseline Atual | Target | Como Medir |
| :-- | :-- | :-- | :-- |
| {{...}} | {{...}} | {{...}} | {{...}} |

## 💡 Design Detalhado

{{Especificação técnica da solução. Diagramas, contratos, fluxos. Detalhada o
suficiente para guiar a implementação.}}

## 🔄 Alternativas Consideradas

### Alternativa 1: {{nome}}
- **Descrição:** {{...}}
- **Prós:** {{...}}
- **Contras:** {{...}}
- **Por que não escolhida:** {{...}}

### Alternativa 2: {{nome}}
- **Descrição:** {{...}}
- **Prós:** {{...}}
- **Contras:** {{...}}
- **Por que não escolhida:** {{...}}

## 📊 Análise de Impacto

### Impactos Positivos
{{Por área: desenvolvimento, liderança técnica, produto, novos colaboradores.}}

### Impactos e Riscos
{{Custos, perda de velocidade, dependências.}}

## 🚀 Plano de Implementação

### Fases
{{Fases com objetivos, tarefas, critérios de sucesso e recursos.}}

### Cronograma e Marcos
| Marco | Data Prevista | Entregável | Responsável |
| :-- | :-- | :-- | :-- |
| {{M1}} | {{...}} | {{...}} | {{email}} |

### Plano de Rollback
{{Cenários de rollback e procedimento.}}

## ⚠️ Riscos e Mitigações

| Risco | Probabilidade | Impacto | Estratégia de Mitigação |
| :-- | :-- | :-- | :-- |
| {{...}} | {{Alta/Média/Baixa}} | {{Alto/Médio/Baixo}} | {{...}} |

## 📝 Histórico de Revisões

| Data | Status | Versão | Autor | Mudanças |
| :-- | :-- | :-- | :-- | :-- |
| {{YYYY-MM-DD}} | Proposto | 1.0 | {{email}} | Proposta inicial |

## ✅ Checklist de Qualidade

### Conteúdo
- [ ] Resumo é claro e conciso
- [ ] Problema está bem definido com dados
- [ ] Solução é detalhada o suficiente para implementação
- [ ] Pelo menos 2 alternativas foram consideradas
- [ ] Impactos e riscos foram analisados
- [ ] Plano de implementação é factível
- [ ] Métricas de sucesso são mensuráveis

### Processo
- [ ] Stakeholders relevantes foram identificados
- [ ] Feedback inicial foi coletado
- [ ] Questões em aberto foram documentadas
- [ ] Recursos necessários foram estimados

## 👥 Aprovações

### Revisores Técnicos
- [ ] **{{email}}:** Aprovado | Aprovado com ressalvas | Rejeitado — {{comentários}}

### Aprovação Final
- [ ] **RFC Aprovada:** Sim | Não
- **Data de Aprovação:** {{...}}
- **Responsável pela Implementação:** {{...}}

---

## 🔍 Monitoramento e Observabilidade (opcional)
{{Métricas de acompanhamento pós-implementação.}}

## ❓ Questões em Aberto (opcional)
- [ ] {{...}}

## 📚 Referências e Recursos (opcional)
- {{links e documentos relacionados}}

## 🔗 Anexos (opcional)
- {{diagramas, protótipos}}
