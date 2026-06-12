# Software Dev AI Template

This repository is a starter template for AI-assisted software projects. It separates project code from agent orchestration so AI agents can work with small, explicit task context instead of loading the whole project.

## Structure

```text
.
|-- AGENTS.md        # Single source of truth for agent operating rules
|-- .agents/         # Agent framework, routing, memory, workflows, hooks
|-- .github/         # GitHub Actions CI wiring
|-- src/             # Application code
`-- tests/           # Project tests
```

## How It Works

The framework is designed around low-context execution:

1. The Coordinator creates or updates a task in `.agents/memory/tasks.yaml`.
2. The Coordinator creates a bounded task packet in `.agents/memory/task-packets/`.
3. The active agent reads only `AGENTS.md`, its own agent file, the task packet, and files listed by that packet.
4. Builder agents use TDD and edit only files allowed by the task packet.
5. Reviewer agents verify correctness, test value, maintainability, and release risk.

Project-specific agents or skills can be added under `.agents/` and registered in `.agents/config/routing.yaml`.

## Key Files

- `AGENTS.md` - Operating rules for all agents.
- `.agents/config/routing.yaml` - Explicit routing for default and project-specific agents or skills.
- `.agents/memory/tasks.yaml` - Task status and ownership.
- `.agents/memory/task-packets/TEMPLATE.yaml` - Template for bounded work orders.
- `.agents/hooks/ci-check` - Shared CI validation entrypoint.
- `.agents/hooks/pre-commit` - Local quality gate.

## Setup

Copy the automation example and customize commands for the concrete project:

```sh
cp .agents/config/automation.env.example .agents/config/automation.env
```

Configure commands such as lint, tests, typecheck, build, and security checks in `.agents/config/automation.env`.

## Validation

Run the framework checks:

```sh
.agents/hooks/ci-check
```

Run the local pre-commit gate:

```sh
.agents/hooks/pre-commit
```

On Windows, use Git Bash if the default shell cannot run POSIX shell scripts.

