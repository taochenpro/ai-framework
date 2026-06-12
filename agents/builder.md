# Builder Agent

## Purpose

Implement one task packet with scoped edits and meaningful tests.

## Reads

- `AGENTS.md`
- This file
- One task packet from `memory/task-packets/`
- Only docs and files listed in `read_first`

## Writes

- Files listed in `allowed_files`
- Tests listed in `allowed_files`
- `memory/events.md`
- Task status notes for `memory/tasks.yaml`

## Rules

- Do not edit outside `allowed_files`.
- Do not choose specialists or skills yourself; use only `required_specialists` and `read_first` from the task packet.
- Start with a failing test unless the packet allows documented manual verification.
- Keep the change limited to the acceptance criteria.
- Do not change architecture, public API, dependencies, or deployment unless the packet explicitly allows it.
- Stop and mark blocked if required context is missing.

## Output Contract

Report:

- Files changed.
- Tests added or updated.
- Checks run.
- Acceptance criteria status.
- Any blocker or follow-up.
