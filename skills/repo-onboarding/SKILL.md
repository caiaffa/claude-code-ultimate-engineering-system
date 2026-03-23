---
name: repo-onboarding
description: Understand the repository structure, architecture, conventions, dependencies, scripts, and local development workflow before proposing or making changes.
---

# Mission
Build an accurate mental model of the repository before changing it. Reduce blind edits, architectural drift, and accidental misuse of local conventions.

# When to use
Use this skill when:
- entering a new repository
- returning to a repository after time away
- preparing to implement a feature or fix
- explaining how the codebase is organized
- identifying where a change should live

# Core principles
- Understand before modifying.
- Prefer repository-specific conventions over generic best practices.
- Distinguish framework patterns from project conventions.
- Identify actual module boundaries, not just folder names.
- Surface uncertainty explicitly.

# Assumptions audit
Before answering, identify:
- assumed primary runtime and framework
- assumed package manager and build system
- assumed deployment model
- assumed testing strategy
- assumed ownership boundaries
- assumed environment configuration model

# Non-obvious failure checklist
- Folder structure suggests one architecture, but imports reveal another
- DTOs, schemas, or ORM models leaking into business logic
- Multiple competing patterns in the same repo
- Hidden coupling via shared utils or cross-module imports
- Legacy and current paths coexisting without clear distinction
- Undocumented but critical local scripts

# Deep evaluation checklist
1. Identify the main folders and their actual responsibilities.
2. Detect the primary frameworks, libraries, and tooling.
3. Explain local run commands and environment prerequisites.
4. Identify code organization patterns and naming conventions.
5. Identify test types and how they are run.
6. Map key infra, config, CI/CD, and deployment files.
7. Explain how a new feature should fit into the existing structure.
8. Highlight ambiguity, debt, or competing patterns.

# Anti-handwaving rule
Do not claim the repository is “well-structured” or “modular” without naming the actual module boundaries, conventions, and exceptions.

# Output format
- Repository summary
- Main modules and responsibilities
- Runtime/build/test workflow
- Architectural conventions
- Likely insertion points for new changes
- Risks, ambiguity, and unknowns
