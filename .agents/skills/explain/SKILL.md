---
name: explain
description: "Explain code, a diff, or a concept to the human in plain words so they actually understand it. Use when the human asks how or why something works, says объясни or не понял, or before they approve a diff they did not write."
---

# Explain

Answer in the chat language from AGENTS.md §1. The owner is learning the code. A definition beats a jargon word.

1. Start from what the change does for the user, in one sentence.
2. Walk the path through the code. Cite file:line. Skip files that do not affect the outcome.
3. Name the one or two ideas that make it work. Define any term you cannot replace with a plain word.
4. Give a small example with real values in and out.
5. Name the trade-off, or the alternative that was rejected and why (link the ADR if there is one).
6. End with one check-yourself question the human can answer from the code.

Do not paste the whole file. Do not tell them it is "simple" and stop.

## Report

The explanation itself is the report. Close with the check-yourself question and, if useful, the command that shows the behavior.
