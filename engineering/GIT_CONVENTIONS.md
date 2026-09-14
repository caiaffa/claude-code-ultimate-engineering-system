# Git Conventions

All git work — branches, commits, and pull requests — follows this document.
**English only.** Aligns with Kovi's commitlint standard (RFC-0001).

## Branches

```
<type>/<short-kebab-description>
```
Types: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `perf`.
Examples: `feat/checkout-async-payment`, `fix/worker-duplicate-jobs`.
RFC branches follow RFC-0001: `rfc/XXXX-titulo-descritivo`.

## Commits — Conventional Commits, in English

```
<type>(<scope>): <subject>

<body>

<footer>
```

- **type** — `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `perf`, `build`, `ci`
- **scope** — optional; the module or area touched (`checkout`, `worker`, `db`)
- **subject** — imperative mood, lowercase, no trailing period, ≤ 72 chars
- **body** — optional; explains *what* and *why* (not how), wrapped at 72 cols,
  separated from the subject by a blank line
- **footer** — `BREAKING CHANGE: ...` and references like `Refs: RFC-0012`

Examples:
```
feat(checkout): add idempotency key to the payment endpoint
fix(worker): handle duplicate BullMQ jobs safely
refactor(db): extract order queries into a repository
docs(rfc): add RFC-0012 on event sourcing for orders
```

One logical change per commit. Never mix a refactor with a feature.

## Pull Requests — English, detailed

**Title:** same format as a Conventional Commit.
Example: `feat(checkout): async payment processing via BullMQ`

**Description:** fill every section thoroughly. A PR description must let a
reviewer understand the change *without reading the whole diff*.

```markdown
## What
Concise summary of what changed.

## Why
The problem this solves and the context. Link the RFC/ADR/issue.

## How
Key implementation decisions, trade-offs, and anything non-obvious in the diff.
Call out what the reviewer should look at most closely.

## Testing
What was tested and how — unit, integration, manual. Include the commands run
and their result. State what was NOT covered.

## Risk & rollback
Blast radius, what could break in production, and how to roll back.
Flag irreversible steps (migrations, data changes).

## Related
RFC-XXXX, ADR-NNNN, issue links, dependent PRs.

## Checklist
- [ ] Tests pass
- [ ] Type-check and lint clean
- [ ] governance/DEFINITION_OF_DONE.md met
- [ ] PR description is detailed enough to review without the full diff
```

Identify people by corporate email (`nome@kovi.com.br`), never by @username
(per RFC-0001).
