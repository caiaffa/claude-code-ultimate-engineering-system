---
description: Map an unfamiliar repository — architecture, conventions, dev workflow, danger zones
---

Repository: $ARGUMENTS (default: current directory)

Use **backend-platform-engineer** with the repo-onboarding skill. For large
monorepos, first fan out an **Explore** agent per top-level area, then have
backend-platform-engineer synthesize.

The agent must record the conventions and gotchas it finds to its memory so
later `/implement`, `/debug`, and `/refactor` runs start informed.

## Output
Repository summary · Architecture map · Tech stack · Local dev workflow ·
Conventions · Where to add a new feature · Health assessment · Risks/unknowns.

Offer (do not do unprompted) to write the map into the repo's `CLAUDE.md`.
