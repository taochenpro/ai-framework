# Codex Projects Framework

This repository is a reusable meta-framework for AI-assisted software projects. It defines how agents collaborate, where shared state lives, how workflows move from idea to release, and how the system improves over time.

## Folder Structure

- `agents/` - Agent contracts. Each file defines one agent's role, inputs, outputs, responsibilities, constraints, and collaboration rules.
- `skills/` - Reusable capability playbooks that agents can apply across projects, such as TDD, architecture design, review, DevOps, UI design, and self-improvement.
- `workflows/` - Multi-agent execution flows. These describe step-by-step handoffs for product work, bug fixes, enhancements, releases, and parallel execution.
- `hooks/` - Automation entrypoints for Git hooks, CI checks, and agent-triggered workflows. Project-specific commands are configured in `config/automation.env`.
- `memory/` - Shared state for all agents: task status, progress logs, decisions, coordination locks, project knowledge, and evolution history.
- `docs/` - Human-readable requirements, architecture, testing strategy, folder structure, and release artifacts.
- `src/` - Application code for the concrete project using this framework.
- `tests/` - Unit, integration, end-to-end, fixtures, and test case templates for meaningful verification.
- `config/` - Framework and automation configuration.
- `meta/` - Self-improvement logic, retrospectives, skill change proposals, and quality metrics.
- `.github/workflows/` - CI entrypoint that delegates to the framework CI hook.

## Agent System

Use the files in `agents/` as the source of truth for agent behavior.

- Product Requirements Agent - Converts ideas into clear requirements, user stories, constraints, and acceptance criteria.
- System Architect Agent - Produces architecture, technical decisions, interface boundaries, and risk analysis.
- Developer Agent - Implements scoped tasks using TDD and project conventions.
- Test Engineer Agent - Designs high-value test strategy and verifies critical behavior.
- Code Review Agent - Reviews code for correctness, maintainability, security, performance, and test quality.
- DevOps Agent - Maintains CI/CD, deployment readiness, infrastructure, and operational checks.
- Project Coordinator Agent - Owns task flow, status, dependencies, parallelization, locks, and delivery cadence.

Agents are specialized roles, not isolated workers. A single LLM can act as multiple agents, but it must make role boundaries explicit when responsibilities change.

## Communication Model

Agents communicate through shared artifacts instead of private assumptions:

- Tasks and ownership live in `memory/tasks.yaml`.
- Active file or domain locks live in `memory/coordination/locks.yaml`.
- Delivery updates live in `memory/progress.md`.
- Architecture and policy decisions live in `memory/decisions/`.
- Durable project knowledge lives in `memory/knowledge.md`.
- Requirements and technical artifacts live in `docs/`.

An agent must update the relevant memory file when it changes task status, discovers a material constraint, makes a decision, or hands work to another agent.

## Task States

Use these states consistently in `memory/tasks.yaml`:

- `proposed` - Captured but not ready for implementation.
- `ready` - Has clear acceptance criteria and no blocking dependency.
- `in_progress` - Owned by one agent or one coordinated agent pair.
- `blocked` - Cannot proceed without a decision, dependency, credential, environment, or user input.
- `review` - Implementation is complete and waiting for review or verification.
- `done` - Acceptance criteria are met, tests pass, and required memory/docs are updated.

## Standard Execution Order

Use the workflow files in `workflows/` for details. The default product flow is:

1. Product Requirements Agent captures scope in `docs/requirements.md`.
2. Project Coordinator Agent creates or updates tasks in `memory/tasks.yaml`.
3. System Architect Agent updates `docs/architecture.md` and records decisions.
4. Test Engineer Agent defines the first failing tests or test plan.
5. Developer Agent implements the smallest useful slice.
6. Test Engineer Agent verifies meaningful behavior and risk coverage.
7. Code Review Agent reviews correctness, maintainability, and test value.
8. DevOps Agent validates CI/CD and release readiness.
9. Project Coordinator Agent closes tasks and updates progress.

## Autonomous vs Collaborative Work

Agents should act autonomously when:

- The task is already scoped, has acceptance criteria, and touches a bounded area.
- Existing conventions are clear.
- The change is reversible and covered by tests.
- No security, data, cost, compliance, or product tradeoff is being introduced.

Agents should collaborate or escalate when:

- Requirements are ambiguous or acceptance criteria are missing.
- A technical choice affects architecture, data models, public APIs, security, infrastructure, or cost.
- Multiple agents need to edit overlapping files.
- A test gap hides meaningful risk.
- A decision changes previously recorded requirements, architecture, or delivery commitments.

## Code Quality Rules

- Prefer simple, explicit design over speculative abstraction.
- Keep changes scoped to the task and existing architecture.
- Preserve public contracts unless an approved decision says otherwise.
- Use clear names that reflect domain behavior.
- Avoid unrelated refactors during feature or bug work.
- Add comments only when they clarify non-obvious reasoning.
- Update docs and memory when behavior, decisions, or workflow expectations change.

## Testing Philosophy

Use TDD for production behavior:

1. Write or identify a failing test for the intended behavior.
2. Implement the smallest useful change.
3. Refactor only after the behavior is verified.

Prioritize high-value tests:

- Critical business rules.
- Edge cases that have caused or could cause defects.
- Integration boundaries such as APIs, persistence, queues, auth, payments, and file I/O.
- Regression tests for every confirmed bug.
- Contract tests for shared interfaces.

Avoid low-value tests:

- Tests that only assert implementation details.
- Tests that duplicate framework behavior.
- Snapshot tests with broad, noisy output and weak assertions.
- Coverage-only tests that do not protect meaningful behavior.

Source changes under `src/` should usually include tests under `tests/`. The pre-commit hook enforces this by default and can be adjusted in `config/automation.env`.

## Progress Tracking Rules

- Every active task must have one owner.
- Every task must have acceptance criteria before implementation.
- Every status change must be reflected in `memory/tasks.yaml`.
- Every material decision must be recorded as a decision file under `memory/decisions/`.
- Long-running work should update `memory/progress.md` at meaningful checkpoints.
- Blocked work must list the blocker and the next action needed to unblock it.

## Parallel Work Coordination

Agents may work in parallel only when their task boundaries are clear.

- Use `memory/coordination/locks.yaml` to reserve files, domains, or interfaces.
- Avoid parallel edits to the same file unless one agent is explicitly coordinating the merge.
- Split work by vertical slices, modules, or artifact type.
- Record dependencies in `memory/tasks.yaml`.
- Before merging parallel work, the Code Review Agent checks for inconsistent assumptions, duplicate abstractions, and broken contracts.

## Automation Rules

- Configure project commands in `config/automation.env` by copying from `config/automation.env.example`.
- Use `hooks/pre-commit` for local quality gates.
- Use `hooks/post-commit` to append commit summaries to `memory/progress.md`.
- Use `hooks/ci-check` as the shared CI entrypoint.
- Use `hooks/agent-trigger` to log workflow starts and point agents to the right workflow file.
- Keep hooks thin. Put project-specific behavior in config or project-native scripts.

## Self-Evolution Rules

The framework improves through controlled feedback loops:

- Review comments can become Developer Agent guidance.
- Defect patterns can become Test Engineer Agent heuristics.
- CI failures can become DevOps Agent checks.
- Architecture reversals can become System Architect Agent constraints.
- Repeated coordination problems can become Project Coordinator Agent rules.

Do not silently rewrite core agent behavior. Propose changes with `meta/skill-change-proposal-template.md`, validate them against real outcomes, then record accepted changes in `memory/evolution-log.md`.

