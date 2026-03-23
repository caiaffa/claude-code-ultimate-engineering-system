# ASYNC_CONTRACTS

This file defines the minimum contract standards for BullMQ jobs, events, and async workflows.

## Required fields for async work
Every meaningful job or event should define:
- contract owner
- business purpose
- producer
- consumer(s)
- payload schema
- schema version
- idempotency key
- timeout expectation
- retry policy
- dead-letter or terminal failure policy
- ordering assumptions
- observability requirements

## Required producer obligations
Producers must:
- emit versioned payloads
- avoid sending ambiguous or overloaded event semantics
- define a stable business identifier when deduplication matters
- avoid relying on consumers to infer missing meaning
- document whether replay is expected and safe

## Required consumer obligations
Consumers must:
- assume at-least-once delivery unless explicitly guaranteed otherwise
- handle duplicates safely
- treat ordering assumptions as unsafe unless documented
- classify retryable vs non-retryable failures
- preserve trace continuity where possible
- expose failure and backlog signals

## Retry contract
Every async contract must define:
- which failures are retryable
- backoff strategy
- max attempts or max age
- side-effect safety during retries
- terminal failure handling
- escalation path for permanent failure

## Idempotency contract
For workflows with business impact:
- define the business idempotency boundary
- define what counts as the “same work”
- define how duplicate detection is enforced
- define how duplicates are logged or surfaced
- define how replays differ from accidental duplicates

## Ordering contract
Every consumer must document:
- whether order matters
- whether out-of-order events are tolerated
- whether stale events are rejected, ignored, or compensated
- what state version or timestamp assumptions exist

## Observability contract
Every critical async flow must expose:
- enqueue count
- processing count
- success and permanent failure count
- retry count
- backlog size
- oldest job age
- processing latency
- trace or correlation linkage across producer and consumer

## BullMQ-specific defaults
- Treat BullMQ as at-least-once.
- Use explicit job naming and queue naming.
- Separate noisy or high-volume workloads from critical ones.
- Avoid unlimited retries.
- Define poison message behavior.
- Document repeatable job semantics and overlap risk.
