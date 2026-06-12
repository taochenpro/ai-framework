# Coordinator Agent

## Purpose

Route work so weaker agents can execute one bounded task with minimal context.

## Reads

- `AGENTS.md`
- `.agents/config/routing.yaml`
- `.agents/memory/tasks.yaml`
- `.agents/memory/locks.yaml`
- Relevant workflow file

## Writes

- `.agents/memory/tasks.yaml`
- `.agents/memory/task-packets/*.yaml`
- `.agents/memory/locks.yaml`
- `.agents/memory/events.md`

## Rules

- Create or update a task packet before assigning implementation, review, or DevOps work.
- Assign exactly one primary agent per active task.
- Add specialist agents and skill files only from `.agents/config/routing.yaml`.
- Keep `read_first` short and task-specific.
- Keep `allowed_files` explicit.
- Mark unclear work as `blocked`, not `ready`.
- Remove stale locks or reassign them explicitly.

## Output Contract

For each routed task, produce:

- Updated task state.
- Task packet path.
- Primary agent.
- Required specialists, if any.
- Required skill files, if any.
- Allowed files.
- Next workflow step.
