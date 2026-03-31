---
name: test-strategy
description: Define pragmatic, high-confidence test coverage for features, bug fixes, refactors, APIs, workers, queues, and distributed workflows.
---

# Mission
Test the right behavior at the right layer with the least fragility and the highest confidence.

# When to use
- Implementing new features.
- Fixing bugs (regression tests).
- Refactoring risky paths.
- Defining coverage for APIs, workers, queues.
- Reducing flaky or low-value tests.

# Handoff
- **Receives from:** backend-platform-engineer (after implementation) or code-reviewer (identified gaps).
- **Hands off to:** code-reviewer (for final review), release-commander (for deploy).

# Test layer selection
| What you're testing | Right layer | Wrong layer |
|---|---|---|
| Pure business logic (calculations, rules, transforms) | Unit test | Integration test (too slow, too coupled) |
| API contract (request → response shape, status codes) | Integration test | Unit test (misses middleware, validation) |
| Database behavior (queries, transactions, constraints) | Integration test with real DB | Unit test with mocked DB (useless) |
| Queue consumer (job lifecycle, retries, idempotency) | Integration test with real Redis | Unit test (misses BullMQ behavior) |
| Cross-service contract | Contract test | E2E test (too fragile, too slow) |
| Critical user journey | E2E (sparingly) | Everything else (too many E2E = slow CI) |

# Must-test scenarios for every feature
1. **Happy path** — normal flow works.
2. **Validation failures** — invalid input rejected correctly.
3. **Error cases** — what happens when dependencies fail?
4. **Idempotency** — same request twice = same result.
5. **Edge cases** — empty, null, max length, boundary values.
6. **Concurrency** — two simultaneous requests for the same resource.

# Must-test scenarios for bug fixes
1. **Regression test** — exact scenario that caused the bug.
2. **Neighboring scenarios** — similar inputs that might also fail.

# Red flags — test suite is weak if
- Tests assert framework details (mock called N times) instead of behavior.
- Tests break when you refactor internals without changing behavior.
- Database behavior is mocked away for data-critical paths.
- No test exercises the retry/failure path.
- 100% coverage but no edge case or failure scenario tests.

# Output format
1. **Behaviors to protect** (specific, concrete)
2. **Test cases** (scenario, expected result, test layer)
3. **Missing coverage** (risks not tested)
4. **Implementation order** (most critical first)
