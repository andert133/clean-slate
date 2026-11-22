# {{PROJECT_NAME}}

{{ONE_LINE_GOAL}}

Status: template. Kickoff has not run. This folder is not an application yet. Docs: [docs/](docs/).

## 🇷🇺 Что это

«Чистый лист» — шаблон репозитория, с которого начинается любой проект с ИИ-агентами (Cursor, Claude Code, Codex, Copilot, Gemini). Агент читает правила из `AGENTS.md`, при первом запуске задаёт вопросы и заполняет пустые места.

## Как начать

1. На GitHub нажмите **Use this template** или выполните `git clone <url> my-project && cd my-project && rm -rf .git && git init`.
2. Откройте папку в агенте. Для Claude Code один раз: `scripts/link-skills.sh` (без симлинков — `scripts/link-skills.sh --copy`).
3. Вставьте первое сообщение из [docs/START_PROMPT.md](docs/START_PROMPT.md) или блок ниже. Подставьте свою идею.
4. Ответьте на два коротких раунда. Дальше агент сам выберет стек, настроит `scripts/check.sh` и соберёт короткий рабочий скелет.

```text
Прочитай AGENTS.md. Если в docs/PRD.md написано status: TEMPLATE, сначала выполни скилл kickoff. Он вызывает adapt.

Идея: хочу телеграм-бота, который напоминает про домашку.

Задай два коротких раунда вопросов с вариантами и рекомендуемым ответом. Настрой стек, проверки и рабочий скелет. Секреты не коммить.
```

Чтобы агент решал сам, добавьте в конце: «autopilot» / «сделай как лучше». Английский текст — в [docs/START_PROMPT.md](docs/START_PROMPT.md).

## Как работать каждый день

Задача из [docs/PLAN.md](docs/PLAN.md) → `/plan` → ок → тест и код → `/verify` → `/review` в новом чате → `/ship`.

| Команда | Когда |
|---|---|
| `/kickoff` | Репозиторий ещё шаблон, или нужно заполнить его заново |
| `/adapt` | Подогнать стек, папки, CI и найти скиллы под тему |
| `/plan` | Задача больше ~30 строк или затрагивает 2+ файла |
| `/tdd` | Есть быстрый тест на поведение |
| `/debug` | Ошибка, странный вывод, «не работает» |
| `/verify` | Доказать на настоящем запуске, до коммита |
| `/review` | Свежий взгляд перед PR |
| `/simplify` | Код уже работает, но его тяжело читать |
| `/ship` | Коммит и pull request |
| `/correct` | Одна и та же ошибка агента повторилась |
| `/handoff` | Закончить сессию или продолжить чужую |
| `/explain` | Объяснить код простыми словами |
| `/autopilot` | «сделай как лучше»: решать самому и записывать выбор |

В Cursor встроенный `/autopilot` следит за уже открытым PR. Скилл этого репозитория — режим «решай сам».

## Если вас 2–3 человека

1. Доска задач — `docs/PLAN.md`: один владелец на задачу.
2. Ветка на задачу: `<кто>/T-012-slug`.
3. Два агента не правят один и тот же файл.
4. Общий контракт (типы, схема API, схема БД) сливается отдельным PR до параллельной работы.
5. Вливает другой человек, после ревью.
6. Передача смены — запись в `docs/PROGRESS.md`, не память чата.

Подробности: [docs/WORKFLOW.md](docs/WORKFLOW.md).

## Что где лежит

```text
AGENTS.md                         правила для всех агентов
CLAUDE.md                         указатель для Claude Code
THIRD_PARTY_NOTICES.md            лицензии и кредит pstack
LICENSE                           MIT этого шаблона
.cursor/rules/core.mdc            всегда читать AGENTS.md
.claude/settings.json             какие команды можно без вопроса
.agents/skills/                   канонические скиллы
docs/PRD.md                       требования, пока TEMPLATE
docs/ARCHITECTURE.md              стек, границы, формы данных
docs/DECISIONS.md                 журнал решений
docs/PLAN.md                      вехи и доска задач
docs/PROGRESS.md                  журнал сессий
docs/VERIFY.md                    как запустить и проверить
docs/WORKFLOW.md                  процесс на 1–3 человек
docs/START_PROMPT.md              первое сообщение, RU и EN
tasks/_TEMPLATE.md                карточка одной задачи
scripts/check.sh                  единые проверки
scripts/link-skills.sh            симлинки скиллов для Claude Code
.github/workflows/ci.yml          те же проверки в CI
.github/pull_request_template.md  текст pull request
.pre-commit-config.yaml           gitleaks и гигиена
.editorconfig
.gitignore
.env.example                      имена переменных, без значений
```

## Главные правила

1. Сначала план, потом код.
2. Маленькие шаги, каждый можно проверить.
3. Тест и проверка на настоящем запуске, не «собралось».
4. Не выдумывать API и флаги библиотек.
5. Если есть два смысла — спросить и предложить вариант по умолчанию.
6. Секреты только в `.env`. В git их нет.
7. Повторная ошибка становится проверкой в `scripts/check.sh`, а не новой строкой правил.

## Благодарности

Идеи среды для агента: доклад Lauren Tan, [All Code Is Slop (Except Mine)](https://www.youtube.com/watch?v=O_zcc6Xl12g), и плагин [pstack](https://github.com/cursor/plugins/tree/main/pstack) (MIT, © 2026 Lauren Tan). Скиллы переписаны своими словами; соответствие и текст лицензии — в `THIRD_PARTY_NOTICES.md`.

Ещё: [AGENTS.md](https://agents.md/), [Agent Skills](https://agentskills.io/specification), [заметки Karpathy и репозиторий guidelines](https://github.com/multica-ai/andrej-karpathy-skills), [Simon Willison](https://simonwillison.net/guides/agentic-engineering-patterns/), [Boris Cherny](https://www.infoq.com/news/2026/01/claude-code-creator-workflow/), [Mitchell Hashimoto](https://mitchellh.com/writing/my-ai-adoption-journey), [Peter Steinberger](https://steipete.me/posts/just-talk-to-it).

## Дальше по желанию

Формальная проверка и маршрутизация моделей в этот шаблон не входят. Их можно поставить отдельно: в Cursor `/add-plugin pstack`, в Claude Code `/plugin marketplace add cursor/plugins`.

---

## 🇬🇧 English

### What this is

A blank repository you clone at the start of any project with coding agents. The agent reads `AGENTS.md`, asks two short rounds, and fills every double-brace placeholder.

### Start

1. **Use this template** on GitHub, or clone, delete `.git`, and `git init`.
2. Open the folder. Claude Code: run `scripts/link-skills.sh` once.
3. Paste [docs/START_PROMPT.md](docs/START_PROMPT.md). One example: "I want a Telegram bot that reminds me about homework."
4. Answer the questions. The agent sets the stack, the gate, and a walking skeleton.

Say "autopilot" or "just do it" when you want the recommended default recorded instead of a question.

### Daily loop

PLAN task → `/plan` → ok → test and code → `/verify` → `/review` in a new chat → `/ship`. Skills: `kickoff` (blank repo), `adapt` (stack and topic skills), `plan`, `tdd`, `debug`, `verify`, `review`, `simplify`, `ship`, `correct`, `handoff`, `explain`, `autopilot` (decide and proceed; Cursor's built-in `/autopilot` is the PR watcher).

### Team of 2–3

One owner per PLAN row, one branch per task, no shared-file edits, contracts merged first, a second human merges, handoff goes in `docs/PROGRESS.md`. Full process: [docs/WORKFLOW.md](docs/WORKFLOW.md).

### Layout

See the tree above. `AGENTS.md` is the only rules file. Other agent files point at it.

### Rules

Plan before code. Small checked steps. Test the real run. Do not invent APIs. Ask when the request has two readings, and offer a default. Secrets live only in `.env`. A repeated mistake becomes a check, not another paragraph.

### Credits

[Lauren Tan's talk](https://www.youtube.com/watch?v=O_zcc6Xl12g) and [pstack](https://github.com/cursor/plugins/tree/main/pstack) (MIT, © 2026 Lauren Tan). Also [AGENTS.md](https://agents.md/), [Agent Skills](https://agentskills.io/specification), [Karpathy guidelines](https://github.com/multica-ai/andrej-karpathy-skills), [Simon Willison](https://simonwillison.net/guides/agentic-engineering-patterns/), [Boris Cherny](https://www.infoq.com/news/2026/01/claude-code-creator-workflow/), [Mitchell Hashimoto](https://mitchellh.com/writing/my-ai-adoption-journey), [Peter Steinberger](https://steipete.me/posts/just-talk-to-it).

### Going further

Model routing and TLA+ tooling are optional: `/add-plugin pstack` in Cursor, `/plugin marketplace add cursor/plugins` in Claude Code.
