# Workflow: Idea to Release

## Goal

Move a product idea from rough concept to production-ready release with clear agent handoffs.

## Steps

1. Product Requirements Agent captures the idea in `docs/requirements.md`.
2. Product Requirements Agent defines users, goals, non-goals, constraints, and acceptance criteria.
3. Project Coordinator Agent creates tasks in `memory/tasks.yaml` and marks implementation-ready items as `ready`.
4. System Architect Agent updates `docs/architecture.md` and records major decisions in `memory/decisions/`.
5. Test Engineer Agent defines the first failing tests or test plan for critical behavior.
6. Developer Agent implements the smallest valuable slice and keeps changes scoped.
7. Test Engineer Agent runs and expands meaningful verification.
8. Code Review Agent reviews correctness, architecture fit, test quality, and maintainability.
9. DevOps Agent runs CI/release checks and updates `docs/release-checklist.md`.
10. Project Coordinator Agent marks tasks `done`, updates `memory/progress.md`, and logs follow-up work.

## Parallelization Rules

- Requirements and architecture may overlap only after the core user goal is stable.
- Tests and implementation may proceed together when contracts are explicit.
- DevOps can prepare CI in parallel with implementation if runtime assumptions are known.
- Review waits for implementation and tests, but can review architecture earlier.

## Exit Criteria

- Acceptance criteria are met.
- Meaningful tests pass.
- Review blockers are resolved.
- CI is green or documented exceptions are approved.
- Memory and docs reflect the delivered behavior.

