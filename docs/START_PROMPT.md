---
status: TEMPLATE
updated: 2026-11-22
---

Purpose: the first message to paste into a new agent chat. The human pastes one block and replaces the idea line. Kickoff may tighten the wording after the project has a name.

# First message

Copy one block into a new agent chat. Replace the idea line.

## Русский

```text
Прочитай AGENTS.md. Если в docs/PRD.md написано status: TEMPLATE, сначала выполни скилл kickoff. Он вызывает adapt.

Идея: хочу телеграм-бота, который напоминает про домашку.

Задай два коротких раунда вопросов. У каждого вопроса дай варианты и рекомендуемый ответ. Потом настрой стек, проверки и короткий рабочий скелет. Секреты не коммить. Для Claude Code один раз запусти scripts/link-skills.sh.

Если я напишу «autopilot», «pohuy mode», «just do it» или «сделай как лучше» — не спрашивай. Бери рекомендуемый вариант и записывай выбор в docs/DECISIONS.md и docs/PROGRESS.md.
```

## English

```text
Read AGENTS.md. If docs/PRD.md says status: TEMPLATE, run the kickoff skill first. It calls adapt.

Idea: I want a Telegram bot that reminds me about homework.

Ask two short rounds of questions. Give options and a recommended default for each. Then set up the stack, the checks, and a walking skeleton. Do not commit secrets. On Claude Code, run scripts/link-skills.sh once.

If I say "autopilot", "pohuy mode", "just do it", or "сделай как лучше", do not ask. Take the recommended default and record it in docs/DECISIONS.md and docs/PROGRESS.md.
```
