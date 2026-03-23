---
name: test-strategy
description: Define pragmatic, high-confidence test coverage for features, bug fixes, refactors, APIs, workers, queues, and distributed workflows.
---

# Mission
Test the right behavior at the right layer with the least fragility and the highest confidence.

# When to use
Use this skill when:
- implementing new features
- fixing bugs
- refactoring risky paths
- defining coverage for APIs, workers, queues, or data flows
- reducing flaky or low-value tests

# Core principles
- Test behavior, not implementation trivia.
- Choose the lowest layer that provides adequate confidence.
- Use integration tests where contracts or boundaries matter.
- Write regression tests for bugs.
- Avoid mocks that erase the behavior being tested.

# Assumptions audit
Before answering, identify:
- assumed business-critical behaviors
- assumed failure modes worth protecting
- assumed external dependencies
- assumed current test maturity
- assumed execution speed constraints
- assumed flakiness tolerance

# Non-obvious failure checklist
- Tests assert framework details instead of business behavior
- Happy path covered, invariants ignored
- Async flows lack idempotency or retry coverage
- Queue consumers tested without realistic job lifecycle
- Database behavior mocked away when it is part of correctness
- Refactor safety assumed without characterization tests

# Deep evaluation checklist
1. Define the behavior under test.
2. Break coverage into happy path, edge cases, failures, regressions, boundaries.
3. Select test layer: unit, integration, end-to-end, contract, smoke.
4. Identify essential fixtures and setup.
5. Identify mocks that reduce trust.
6. Highlight risks that remain untested.
7. Suggest implementation order for tests.

# Anti-handwaving rule
Do not recommend “more tests” without stating what should be tested, at what layer, and why.

# Output format
- Behaviors to protect
- Recommended test layers
- Concrete test cases
- Risks not covered
- Suggested implementation order
