---
status: TEMPLATE
updated: 2026-11-22
---

Purpose: append-only decision log. Add an entry in the same PR as the change it explains. Do not edit past entries; supersede them.

# Decisions

Format for a new entry:

```text
## ADR-NNNN: <title>   (YYYY-MM-DD, status: accepted | superseded by ADR-XXXX)
Context: … (2–4 lines)
Decision: …
Alternatives considered: … (one line each, why not)
Consequences: …
```

## ADR-0000: Use clean-slate; AGENTS.md is the only rules file; skills live in .agents/skills   (2026-11-22, status: accepted)

Context: Cursor, Claude Code, Codex, Copilot, and Gemini will all touch this repo. Copying the same rules into each tool's file makes them drift. Cursor loads project skills from `.agents/skills/` and, for compatibility, also from `.claude/skills/` and `.codex/skills/` (Cursor docs: Skill directories). A committed symlink from `.claude/skills/<name>` to `.agents/skills/<name>` would list every skill twice.

Decision: `AGENTS.md` is the single source of truth. `CLAUDE.md` and `.cursor/rules/core.mdc` only point at it. Canonical skills live in `.agents/skills/`. `.claude/skills/` is gitignored. Claude Code does not read `.agents/skills/`, so run `scripts/link-skills.sh` once per clone. On Windows without symlinks, `scripts/link-skills.sh --copy` prints that copies must be re-synced.

Alternatives considered: Commit the symlinks (Cursor would show duplicates). Copy the skills into both trees in git (the copies drift).

Consequences: Edit a skill in one place. Claude Code needs the link script before `/kickoff` and the other skills appear. See README.

## ADR-0001: {{STACK_DECISION_TITLE}}   ({{DATE}}, status: proposed)

Context: {{STACK_CONTEXT}}
Decision: {{STACK}}
Alternatives considered: {{STACK_ALTERNATIVES}}
Consequences: {{STACK_CONSEQUENCES}}
