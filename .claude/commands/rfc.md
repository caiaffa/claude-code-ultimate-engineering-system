---
description: Draft and challenge an RFC following Kovi's RFC-0001 standard
---

Use this for significant technical decisions — architecture changes that affect
other teams, new technology, anything over ~2 weeks of work. This is Kovi's
standard process (RFC-0001). For small local decisions, use /adr instead.

RFC subject: $ARGUMENTS

## Phase 1 — Draft (sequential)
**principal-engineer** drafts the RFC:
- Fill `~/.claude/engineering/RFC_TEMPLATE.md` completely (PT-BR body;
  identifiers, commands, and service names in English).
- All mandatory sections; at least 2 real alternatives (no strawmen).
- Success metrics with baseline and target. People identified by @kovi.com.br email.
- Ask the user for the next RFC number if unknown — do not guess it.

## Phase 2 — Challenge (sequential)
**architecture-challenger** attacks the draft: weakest assumptions, failure
modes, distributed risks, alternatives dismissed too fast, impact and
implementation-plan gaps. Then run the RFC's own "Checklist de Qualidade".

## Phase 3 — Revise & persist (sequential)
**principal-engineer** revises with the findings (or returns to Phase 1 if
critical issues remain) and returns the full text. The **orchestrator** writes
it to `~/code/kovi/staff/claude/vault/rfcs/rfc-XXXX-<slug>.md`,
Status: "Proposto".

## Handoff to Kovi's official process
The system DRAFTS and REFINES the RFC. The official RFC process stays yours:
take the draft from the vault to the `kovi-docs` repo at
`docs/rfc/rfc-XXXX-titulo.md`, open the PR, notify on Slack, and run the review.
The system never opens the kovi-docs PR for you.
