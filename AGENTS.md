# Codex Projects Framework

This is a low-context operating framework for AI-assisted software projects. The system should do the orchestration; the model should focus on one bounded task at a time.

## Load Order

Every agent reads only what the task packet says to read.

Minimum context for most work:

1. `AGENTS.md`
2. One active agent file from `agents/`
3. One task packet from `memory/task-packets/`
4. Directly relevant docs or code listed in the task packet

Do not load every agent, workflow, memory file, or document by default.

## Core Folders

- `agents/` - Small role contracts: coordinator, planner, builder, reviewer, devops.
- `workflows/` - Short task and review flows.
- `memory/tasks.yaml` - Source of truth for task status and ownership.
- `memory/task-packets/` - Bounded work orders that tell an agent exactly what to read, edit, and produce.
- `memory/events.md` - Append-only progress and handoff log.
- `memory/locks.yaml` - File/domain locks for parallel work.
- `memory/decisions/` - Architecture and process decisions that materially affect future work.
- `docs/` - Requirements, architecture, and testing strategy.
- `hooks/` - Local and CI automation gates.
- `config/` - Routing and automation configuration.
- `meta/` - Improvement proposal template for controlled framework changes.

## Agents

- `agents/coordinator.md` - Routes work, creates task packets, assigns agents, manages locks, and updates task state.
- `agents/planner.md` - Turns ideas into requirements, architecture notes, acceptance criteria, and implementation-ready tasks.
- `agents/builder.md` - Implements one task packet using TDD and scoped edits.
- `agents/reviewer.md` - Reviews completed work for correctness, test value, maintainability, and release risk.
- `agents/devops.md` - Maintains CI, deployment, environment, and automation behavior.

Project-specific agents or skill files can be added, such as `agents/db-designer.md`, `agents/react-builder.md`, `agents/figma-designer.md`, or `skills/react.md`. They are not discovered by guesswork. Register them in `config/routing.yaml`, then the Coordinator must list specialist agents in `required_specialists` and skill files in `read_first`.

## Task States

Use only these states in `memory/tasks.yaml`:

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
- Use `memory/locks.yaml` before parallel work touches overlapping files, modules, or domains.
- Record material decisions in `memory/decisions/`.
- Append meaningful progress, blockers, and handoffs to `memory/events.md`.

## Quality Rules

- Prefer the smallest complete change.
- Preserve public contracts unless a decision record approves the change.
- Avoid unrelated refactors.
- Keep tests focused on behavior and risk.
- Add or update tests for production code changes unless the task packet documents why automation is not feasible.
- Run configured checks through `hooks/ci-check`.

## TDD Rule

For Builder tasks:

1. Write or identify the failing test first.
2. Implement the smallest useful change.
3. Refactor only after tests pass.
4. If no automated test is practical, document the reason in the task packet and `memory/events.md`.

## Improvement Rule

Do not evolve agents, routing, hooks, or workflow rules silently. Use `meta/skill-change-proposal-template.md`, validate the change against a real failure or repeated friction, then apply the smallest useful update.
