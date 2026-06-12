# Skill: DevOps Automation

## Purpose

Keep local automation, CI, release, and deployment paths consistent.

## Use When

- Project commands, hooks, CI, deployment, or release checks change.
- A new language or framework is introduced.
- A release is being prepared.

## Steps

1. Configure commands in `config/automation.env`.
2. Keep `hooks/pre-commit` and `hooks/ci-check` aligned.
3. Validate that CI is reproducible without local-only state.
4. Document required environment variables and secrets without storing secret values.
5. Confirm release and rollback steps.

## Output Standard

- A clean checkout can run the documented checks.
- CI failures are actionable.
- Release readiness does not depend on tribal knowledge.

