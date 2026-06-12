# Decision 0001: Framework Baseline

## Status

Accepted

## Context

The repository needs a reusable meta-framework for AI agents to collaborate across software projects from idea to release.

## Decision

Use a language-agnostic structure with agent contracts, skill playbooks, workflow files, configurable hooks, shared memory, and a self-evolution mechanism.

## Consequences

- Concrete projects can adopt the framework without committing to one stack.
- Agents coordinate through files that are easy to inspect and version.
- Automation is available immediately but project-specific commands remain configurable.

