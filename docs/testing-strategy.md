# Testing Strategy

## Philosophy

Use TDD for production behavior. Tests should prove important behavior, not decorate the codebase.

## Test Selection

Prioritize:

- Business-critical rules.
- Confirmed bug regressions.
- Public contracts and integration boundaries.
- Authorization, validation, persistence, and error handling.
- Risky edge cases and failure modes.

Avoid:

- Tests that mirror implementation details.
- Tests that assert framework behavior.
- Broad snapshots without meaningful assertions.
- Tests added only to increase coverage metrics.

## Test Layers

- Unit tests verify pure logic and local decisions.
- Integration tests verify boundaries between modules, persistence, services, or APIs.
- End-to-end tests verify critical user journeys only.
- Contract tests verify shared interfaces.
- Regression tests prove fixed bugs stay fixed.

## TDD Loop

1. Write a failing test for the behavior.
2. Confirm it fails for the expected reason.
3. Implement the smallest useful change.
4. Confirm the test passes.
5. Refactor while keeping tests green.

## Done Standard

A task is not done until relevant high-value tests pass or the reason automation is not feasible is documented and accepted.

