# Release Checklist

## Before Release

- Requirements and acceptance criteria are met.
- Tasks are marked `done` or explicitly deferred.
- Required tests pass locally and in CI.
- Review blockers are resolved.
- Architecture decisions are recorded.
- Environment variables and secrets are documented without secret values.
- Migration and rollback steps are documented when needed.

## Release Validation

- Build artifact or deployable package is reproducible.
- Health checks or smoke tests are defined.
- Monitoring and logging expectations are clear.
- Known risks and follow-up tasks are recorded.

## After Release

- Confirm production behavior.
- Record release notes in `.agents/memory/progress.md`.
- Add improvement proposals for defects, delays, or repeated review findings.
