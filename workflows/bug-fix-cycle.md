# Workflow: Bug Fix Cycle

## Goal

Fix confirmed defects with regression coverage and minimal unrelated change.

## Steps

1. Product Requirements Agent clarifies expected behavior and impact.
2. Project Coordinator Agent creates a bug task with severity, owner, and affected files.
3. Test Engineer Agent writes or identifies a failing regression test that reproduces the bug.
4. Developer Agent isolates the root cause and implements the smallest fix.
5. Test Engineer Agent verifies the regression test and any adjacent high-risk cases.
6. Code Review Agent checks for incomplete fixes, hidden side effects, and missing tests.
7. DevOps Agent validates CI and release urgency if the bug is production-impacting.
8. Project Coordinator Agent closes the task and records the lesson if it should improve a skill.

## Required Artifacts

- Bug task in `memory/tasks.yaml`.
- Regression test or documented reason automation is not feasible.
- Root cause note in `memory/progress.md` or the task notes.
- Decision record if the fix changes public behavior or architecture.

## Exit Criteria

- The bug fails before the fix and passes after the fix.
- No unrelated refactor is mixed into the fix.
- The user-visible or system-visible behavior is verified.

