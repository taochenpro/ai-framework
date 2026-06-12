# Folder Structure

```text
.
|-- AGENTS.md
|-- agents/
|-- skills/
|-- workflows/
|-- hooks/
|-- memory/
|   |-- coordination/
|   `-- decisions/
|-- docs/
|-- src/
|-- tests/
|   |-- unit/
|   |-- integration/
|   |-- e2e/
|   `-- fixtures/
|-- config/
|-- meta/
`-- .github/workflows/
```

## Directory Purpose

- `AGENTS.md` is the operating manual for every agent.
- `agents/` defines individual agent contracts.
- `skills/` defines reusable techniques that agents apply.
- `workflows/` defines multi-agent sequences and handoffs.
- `hooks/` contains local and CI automation entrypoints.
- `memory/` contains shared state, progress, decisions, coordination locks, and learned knowledge.
- `docs/` contains project-facing requirements, architecture, testing, and release documents.
- `src/` contains application code for the project adopting this framework.
- `tests/` contains automated verification and test planning artifacts.
- `config/` contains framework and automation configuration.
- `meta/` contains self-improvement templates and evaluation rules.
- `.github/workflows/` contains CI wiring that calls the shared hook.

