# Testing Strategy

Use tests to protect behavior and guide implementation.

## TDD Loop

1. Write or identify a failing test.
2. Confirm it fails for the expected reason.
3. Implement the smallest useful change.
4. Confirm the test passes.
5. Refactor only while tests stay green.

## Prioritize

- Business-critical rules.
- Bug regressions.
- Public contracts and integration boundaries.
- Authorization, validation, persistence, and error handling.
- Risky edge cases.

## Avoid

- Tests that mirror implementation details.
- Tests that assert framework behavior.
- Broad snapshots without meaningful assertions.
- Coverage-only tests.

## Done Standard

A Builder task is not done until relevant tests pass or the task packet documents why automated verification is not practical.
