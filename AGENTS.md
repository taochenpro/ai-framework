# Codex Projects Framework

This is a low-context operating framework for AI-assisted software projects. The system should do the orchestration; the model should focus on one bounded task at a time.

The framework lives under `.agents/` so it stays separate from project code. Project code stays at the repository root, primarily under `src/` and `tests/`.

## Load Order

Every agent reads only what the task packet says to read.

Minimum context for most work:

1. Root `AGENTS.md`
2. One active agent file from `.agents/agents/`
3. One task packet from `.agents/memory/task-packets/`
4. Directly relevant docs or code listed in the task packet

Do not load every agent, workflow, memory file, or document by default.

## Core Folders

- `.agents/agents/` - Small role contracts: coordinator, planner, builder, reviewer, devops.
- `.agents/workflows/` - Short task and review flows.
- `.agents/memory/tasks.yaml` - Source of truth for task status and ownership.
- `.agents/memory/task-packets/` - Bounded work orders that tell an agent exactly what to read, edit, and produce.
- `.agents/memory/events.md` - Append-only progress and handoff log.
- `.agents/memory/locks.yaml` - File/domain locks for parallel work.
- `.agents/memory/decisions/` - Architecture and process decisions that materially affect future work.
- `.agents/docs/` - Requirements, architecture, and testing strategy.
- `.agents/hooks/` - Local and CI automation gates.
- `.agents/config/` - Routing and automation configuration.
- `.agents/meta/` - Improvement proposal template for controlled framework changes.
- `src/` - Project application code.
- `tests/` - Project tests.

## Agents

- `.agents/agents/coordinator.md` - Routes work, creates task packets, assigns agents, manages locks, and updates task state.
- `.agents/agents/planner.md` - Turns ideas into requirements, architecture notes, acceptance criteria, and implementation-ready tasks.
- `.agents/agents/builder.md` - Implements one task packet using TDD and scoped edits.
- `.agents/agents/reviewer.md` - Reviews completed work for correctness, test value, maintainability, and release risk.
- `.agents/agents/devops.md` - Maintains CI, deployment, environment, and automation behavior.

Project-specific agents or skill files can be added, such as `.agents/agents/db-designer.md`, `.agents/agents/react-builder.md`, `.agents/agents/figma-designer.md`, or `.agents/skills/react.md`. They are not discovered by guesswork. Register them in `.agents/config/routing.yaml`, then the Coordinator must list specialist agents in `required_specialists` and skill files in `read_first`.

## Task States

Use only these states in `.agents/memory/tasks.yaml`:

- `proposed` - Captured but not ready.
- `ready` - Has acceptance criteria and a task packet.
- `in_progress` - One primary agent owns it.
- `blocked` - Needs input, dependency, credential, decision, or environment.
- `review` - Work is complete and awaiting review.
- `done` - Acceptance criteria are met, checks pass, and required state is updated.

## Coordination Rules

- One active task has one primary agent.
- The Coordinator owns routing. Builder, Reviewer, and DevOps follow the task packet.
- Do not edit files outside `allowed_files` unless the Coordinator updates the task packet first.
- Use `.agents/memory/locks.yaml` before parallel work touches overlapping files, modules, or domains.
- Record material decisions in `.agents/memory/decisions/`.
- Append meaningful progress, blockers, and handoffs to `.agents/memory/events.md`.

## Quality Rules

- Prefer the smallest complete change.
- Preserve public contracts unless a decision record approves the change.
- Avoid unrelated refactors.
- Keep tests focused on behavior and risk.
- Add or update tests for production code changes unless the task packet documents why automation is not feasible.
- Run configured checks through `.agents/hooks/ci-check`.

## TDD Rule

For Builder tasks:

1. Write or identify the failing test first.
2. Implement the smallest useful change.
3. Refactor only after tests pass.
4. If no automated test is practical, document the reason in the task packet and `.agents/memory/events.md`.

## Improvement Rule

Do not evolve agents, routing, hooks, or workflow rules silently. Use `.agents/meta/skill-change-proposal-template.md`, validate the change against a real failure or repeated friction, then apply the smallest useful update.
