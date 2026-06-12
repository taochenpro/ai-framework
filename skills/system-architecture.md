# Skill: System Architecture

## Purpose

Design maintainable technical structure for the current product scope.

## Use When

- A change affects module boundaries, data models, public APIs, infrastructure, performance, reliability, or security.
- A new project needs a baseline architecture.
- Existing architecture no longer fits requirements.

## Steps

1. Read requirements, constraints, and existing decisions.
2. Identify the smallest architecture that supports the known needs.
3. Define boundaries, contracts, data flow, and failure handling.
4. Record tradeoffs and rejected alternatives.
5. Create or update a decision record in `memory/decisions/`.

## Output Standard

- Developers know where code belongs.
- Test engineers know which contracts matter.
- DevOps knows runtime and deployment assumptions.

