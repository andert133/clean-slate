---
status: TEMPLATE
updated: 2026-11-22
---

Purpose: where code lives and which boundaries hold. Update this file in the same PR that changes structure. If a boundary can be a lint or an import rule, add that check and record it in AGENTS.md §9.

# Architecture

## Overview

{{OVERVIEW}}

```mermaid
flowchart LR
  caller[{{CALLER}}] --> entry[{{ENTRY}}]
  entry --> core[{{CORE_MODULE}}]
  core --> config[{{CONFIG_MODULE}}]
```

## Stack

{{STACK}}. Why: [ADR-0001](DECISIONS.md).

## Directory map

| Path | Purpose | Owns this state |
|---|---|---|
| `{{ENTRY_PATH}}` | {{ENTRY_PURPOSE}} | {{ENTRY_STATE}} |
| `{{CORE_PATH}}` | {{CORE_PURPOSE}} | {{CORE_STATE}} |
| `{{CONFIG_PATH}}` | Reads env once | secrets and settings |
| `docs/` | PRD, plan, decisions, verification | product intent |
| `scripts/check.sh` | The gate | none |

## Boundaries and rules

- {{IMPORT_RULE}}
- Validate untrusted input (user, network, files, env) at the edge. Inside the boundary, trust typed values.
- Read secrets only in `{{CONFIG_PATH}}`. Other modules receive already-loaded settings.
- Agents follow AGENTS.md. Product code does not import `docs/`.

## Core data shapes

```text
{{CORE_DATA_SHAPE}}
```

## External services

{{EXTERNAL_SERVICES}}

## How to run

See [VERIFY.md](VERIFY.md).
