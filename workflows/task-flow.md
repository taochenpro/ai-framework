# Workflow: Task Flow

Use this for features, bugs, refactors, and project setup.

## Steps

1. Coordinator records or updates the task in `memory/tasks.yaml`.
2. Planner clarifies requirements, acceptance criteria, risks, and architecture impact when needed.
3. Coordinator creates a task packet in `memory/task-packets/`.
4. Builder implements only the packet scope.
5. Coordinator moves the task to `review`.
6. Reviewer checks the completed work.
7. Coordinator marks `done` or routes fixes back to Builder.

## Skip Rules

- Skip Planner for trivial mechanical tasks with clear acceptance criteria.
- Skip Builder when the task is planning-only.
- Skip Reviewer only for non-code documentation changes that the Coordinator explicitly marks low risk.
- Add DevOps only when the task affects checks, build, deploy, environment, secrets, or infrastructure.

## Done Criteria

- Acceptance criteria are met.
- Required tests or documented manual verification are complete.
- Configured checks pass.
- Task state and event log are updated.

