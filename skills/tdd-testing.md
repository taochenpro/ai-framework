# Skill: TDD Testing

## Purpose

Create high-value tests that protect critical behavior and guide implementation.

## Use When

- New production behavior is added.
- A defect is fixed.
- A risky integration or contract is changed.
- Tests exist but do not verify meaningful outcomes.

## Steps

1. Identify the behavior, risk, and observable outcome.
2. Write the smallest failing test that proves the behavior is missing or broken.
3. Prefer unit tests for pure logic and integration tests for boundaries.
4. Add regression tests for confirmed bugs.
5. Remove redundant or brittle tests when they obscure signal.

## Output Standard

- Tests fail for the right reason before the fix.
- Tests pass after implementation.
- Tests are deterministic and understandable.

