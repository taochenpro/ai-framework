# Skill: Code Review

## Purpose

Find defects and delivery risks before merge.

## Use When

- A task moves to `review`.
- A change affects shared code, contracts, data, security, infrastructure, or critical logic.
- CI passes but human-quality review is still required.

## Steps

1. Compare changes against requirements and acceptance criteria.
2. Review correctness, edge cases, error handling, and compatibility.
3. Review test value before style.
4. Check architecture fit and operational risk.
5. Report findings by severity with concrete references.

## Output Standard

- Findings are actionable.
- Blocking issues are separated from optional improvements.
- Recurring issues are candidates for self-evolution.

