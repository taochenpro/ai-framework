# Workflow: Review Flow

Use this when work is complete and needs a quality gate.

## Steps

1. Coordinator confirms the task packet, changed files, and checks run.
2. Reviewer reads only the task packet, changed files, relevant tests, and listed docs.
3. Reviewer reports blocking findings first.
4. Coordinator routes required fixes to Builder or marks the task `done`.
5. DevOps runs release checks only when the packet marks release or deployment impact.

## Review Focus

- Does the change satisfy acceptance criteria?
- Are important failure modes tested?
- Are public contracts preserved?
- Is the implementation simpler than the problem requires?
- Are CI, deployment, and rollback risks addressed?

