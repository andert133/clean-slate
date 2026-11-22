---
name: adapt
description: "Shape a clean-slate repo to the task: stack, folders, scripts/check.sh, CI, placeholders, and removal of parts that do not apply. Find, vet, and install stack or topic skills from public catalogs. Use when kickoff calls it, at project start, or when the human says adapt."
---

# Adapt

`kickoff` calls this skill after the product answers exist. You may also run it when the stack is still a placeholder. Follow AGENTS.md §4 and §5. Do not commit secrets.

1. Read the task, `docs/PRD.md`, ADR-0001 if present, and the last PROGRESS entry. Restate platform, stack, and core job in one line.
2. List remaining double-brace tokens with `rg '\{\{'`. Fill the ones this task decides. Leave `tasks/_TEMPLATE.md` and GitHub Actions `${{ }}` expressions.
3. Add only the folders this stack needs. Do not add a package manager file for a stack you did not choose.
4. Fill `scripts/check.sh` from the stack table in the `kickoff` skill. Uncomment the matching block in `.pre-commit-config.yaml`. Delete commented blocks for stacks you are not using. Enable the pre-push `scripts/check.sh` hook only after a local run exits 0.
5. Replace `{{CI_SETUP_STEPS}}` with the runtime setup. Delete the CI branch that treats the message "Not configured yet" as success, so a real failure fails the job.
6. Extend `.gitignore` and `.env.example` for this stack. Append the stack's test and run commands to the allow list in `.claude/settings.json`. Remove template sample sections that would now mislead a reader. Keep LICENSE, AGENTS.md, and the skills that shipped with clean-slate.
7. Search reputable public sources for skills that match the stack and topic (PHP, Rust, Python ML, Telegram bots, web, and so on):
   - https://github.com/anthropics/skills
   - https://github.com/obra/superpowers
   - https://github.com/mattpocock/skills
   - https://skills.sh and the agentskills ecosystem (https://github.com/agentskills/agentskills)
   - the framework vendor's docs or GitHub org
8. Vet each candidate before copying it. Require a license file (MIT, Apache-2.0, BSD, or the repo LICENSE). Read `SKILL.md`: steps must be specific. Reject missing licenses, secrets, obfuscated scripts, and anything that downloads and executes remote code, reads credentials, or hides commands. If you cannot explain it, do not install it.
9. Copy accepted skills into `.agents/skills/<name>/`. Do not overwrite `kickoff`, `adapt`, `plan`, `tdd`, `debug`, `verify`, `review`, `simplify`, `ship`, `correct`, `handoff`, `explain`, or `autopilot`. Append source URL, license, and copyright to `THIRD_PARTY_NOTICES.md`. Run `scripts/link-skills.sh` when `.claude/skills/` is in use.
10. Record the next ADR: stack, files removed, skills installed, skills rejected and the reason.

## Report

What changed in the tree. Installed skills with URLs. Rejected skills with the reason. The ADR id.
