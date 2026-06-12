# Workflow: Feature Enhancement Flow

## Goal

Extend existing behavior while preserving current contracts and user workflows.

## Steps

1. Product Requirements Agent defines the enhancement, affected users, and compatibility expectations.
2. Project Coordinator Agent identifies impacted modules, owners, and dependencies.
3. System Architect Agent checks whether current architecture supports the enhancement.
4. Test Engineer Agent identifies existing tests that must keep passing and new behavior tests to add.
5. Developer Agent implements behind the smallest practical interface or feature boundary.
6. Code Review Agent verifies compatibility, migration needs, and test value.
7. DevOps Agent confirms configuration, rollout, and deployment impact.
8. Project Coordinator Agent updates progress and follow-up tasks.

## Parallelization Rules

- UI, backend, tests, and DevOps work may run in parallel only after contracts are agreed.
- Shared API or data model changes must be sequenced through architecture review first.
- Compatibility tests should be written before implementation changes that might break existing users.

## Exit Criteria

- Existing behavior still works.
- New acceptance criteria are met.
- Migration or rollout steps are documented if needed.

