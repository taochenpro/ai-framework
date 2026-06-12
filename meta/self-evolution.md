# Self-Evolution Mechanism

## Purpose

Improve the framework based on evidence from real project work while avoiding uncontrolled drift.

## Feedback Sources

- Code review findings.
- Defects and incidents.
- Failing or flaky CI runs.
- Repeated missed requirements.
- Architecture reversals.
- Coordination conflicts and stale locks.
- User feedback.

## Improvement Loop

1. Observe a repeated issue or high-impact failure.
2. Identify whether the fix belongs to an agent, skill, workflow, hook, config, or documentation.
3. Write a proposal using `meta/skill-change-proposal-template.md`.
4. Validate the proposal against the failure that triggered it.
5. Apply the smallest useful change.
6. Record the accepted change in `memory/evolution-log.md`.

## Safeguards

- Do not rewrite core behavior based on one weak signal.
- Do not optimize for speed by weakening quality gates.
- Do not add process that has no owner or measurable benefit.
- Prefer small, reversible changes.
- Keep accepted changes visible in version control.

## Review Feedback Loop

When the Code Review Agent finds repeated issues, convert the pattern into one of:

- Developer Agent constraint.
- Test Engineer Agent heuristic.
- Architecture decision checklist item.
- DevOps hook or CI check.
- Project Coordinator Agent coordination rule.

