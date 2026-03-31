---
name: repo-onboarding
description: Understand the repository structure, architecture, conventions, dependencies, scripts, and local development workflow before proposing or making changes.
---

# Mission
Build an accurate mental model of the repository before changing it. Reduce blind edits, architectural drift, and accidental misuse of local conventions.

# When to use
- Entering a new repository.
- Returning to a repository after time away.
- Preparing to implement a feature or fix.
- Explaining how the codebase is organized.

# Handoff
- **Receives from:** CLAUDE.md orchestrator (onboarding category).
- **Hands off to:** backend-platform-engineer (ready to implement), nestjs-architecture-guardian (if NestJS).

# Exploration order
```
1. README.md and docs/        → Intent, setup, high-level architecture
2. package.json / go.mod / etc → Runtime, framework, dependencies
3. Top-level folder structure  → Module boundaries
4. src/ or app/ structure      → Layering (controllers, services, repos)
5. Config files                → Environment, feature flags, secrets
6. Test structure              → Test strategy, fixtures, helpers
7. CI/CD config                → Build pipeline, deploy process
8. Recent git log              → Active areas, recent patterns
```

# What to document
1. **Purpose** — what does this system do?
2. **Main modules** — what are the actual boundaries (not just folder names)?
3. **Tech stack** — runtime, framework, ORM, queue, cache, DB.
4. **Local dev** — how to run locally (commands, prerequisites, env setup).
5. **Test strategy** — what test types exist, how to run them.
6. **Deploy** — how does code get to production?
7. **Conventions** — naming, patterns, idioms specific to this project.
8. **Danger zones** — areas of high complexity, tech debt, or competing patterns.
9. **Where to add new code** — for a new feature, where does it go?

# Red flags about codebase health
- Multiple competing patterns for the same concern (3 different ways to do error handling).
- "Common" or "utils" folder with 50+ files.
- Circular dependencies between modules.
- Tests that mock everything (no integration tests with real DB/queue).
- No README or setup instructions.
- Last meaningful commit was months ago on a critical path.

# Output format
1. **Repository summary** (1 paragraph)
2. **Architecture map** (modules, boundaries, dependencies)
3. **Tech stack** (runtime, key libraries, infra)
4. **Local dev workflow** (setup → run → test)
5. **Conventions** (naming, patterns, idioms)
6. **Where to add a new feature** (specific path)
7. **Health assessment** (clean / has drift / needs refactor)
8. **Risks and unknowns** (what's unclear, what's fragile)
