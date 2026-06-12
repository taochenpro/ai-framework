# Workflow: Parallel Agent Execution

## Goal

Allow multiple agents to work at the same time without overwriting each other or making conflicting assumptions.

## Steps

1. Project Coordinator Agent splits work into independent tasks with clear file, module, or artifact ownership.
2. Each active agent records ownership in `memory/tasks.yaml`.
3. Each active agent records file or domain locks in `memory/coordination/locks.yaml`.
4. Agents update progress at meaningful checkpoints.
5. Project Coordinator Agent resolves dependencies and stale locks.
6. Code Review Agent performs an integration review before tasks are marked `done`.

## Locking Guidance

- Lock files when two agents could edit the same artifact.
- Lock domains when work affects a shared concept, such as auth, billing, routing, or deployment.
- Include owner, reason, created time, expected release time, and related task ID.
- Remove locks when the work is merged, abandoned, or handed off.

## Conflict Resolution

- If two agents need the same file, sequence the work or assign one merge owner.
- If assumptions conflict, record the decision in `memory/decisions/`.
- If work blocks for missing input, mark the task `blocked` and state the next action.

