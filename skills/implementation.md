# Skill: Implementation

## Purpose

Deliver scoped production changes with minimal churn and strong verification.

## Use When

- A task is marked `ready`.
- Tests and architecture guidance are sufficient to begin.
- A bug fix, feature slice, or refactor has bounded acceptance criteria.

## Steps

1. Check task owner, files, dependencies, and locks.
2. Write or identify the failing test first when practical.
3. Implement the smallest useful change.
4. Run configured checks.
5. Update status, docs, and memory.
6. Hand off for review.

## Output Standard

- Code satisfies acceptance criteria.
- Tests verify meaningful behavior.
- No unrelated refactors or hidden architecture changes are included.

