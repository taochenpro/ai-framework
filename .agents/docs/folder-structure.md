# Folder Structure

```text
.
|-- AGENTS.md
|-- .agents/
|   |-- agents/
|   |-- skills/
|   |-- workflows/
|   |-- hooks/
|   |-- memory/
|   |   |-- coordination/
|   |   `-- decisions/
|   |-- docs/
|   |-- src/
|   |-- tests/
|   |-- config/
|   |-- meta/
|   `-- .github/workflows/
```

## Directory Purpose

- `AGENTS.md` is the operating manual for every agent.
- `.agents/agents/` defines individual agent contracts.
- `.agents/skills/` defines reusable techniques that agents apply.
- `.agents/workflows/` defines multi-agent sequences and handoffs.
- `.agents/hooks/` contains local and CI automation entrypoints.
- `.agents/memory/` contains shared state, progress, decisions, coordination locks, and learned knowledge.
- `.agents/docs/` contains project-facing requirements, architecture, testing, and release documents.
- `.agents/src/` contains application code for the project adopting this framework.
- `.agents/tests/` contains automated verification and test planning artifacts.
- `.agents/config/` contains framework and automation configuration.
- `.agents/meta/` contains self-improvement templates and evaluation rules.
- `.agents/.github/workflows/` contains CI wiring that calls the shared hook.
