---
name: simplify
description: "Refactor for readable, human code without changing behavior: delete before adding, collapse needless layers, rename for clarity. Use after a feature works, when code is hard to follow, or when the human says simplify or сделай понятнее."
---

# Simplify

Behavior stays the same. AGENTS.md §4. Delete before you add.

1. `scripts/check.sh` is green before you start. If there is no test around the behavior, add a characterization test first (`tdd`) and see it pass on the current code.
2. List deletions first: dead code, unused options, duplicated logic, a wrapper with one caller.
3. Then reshape: early returns, smaller functions, one table instead of a chain of conditionals, names a junior can read aloud.
4. Keep each commit to one kind of change (deletions, then renames, then control flow). Do not mix in a feature.
5. Run `scripts/check.sh` after each step. If a test fails, the refactor changed behavior. Back up.
6. Do not reformat unrelated files in the same change.

## Report

Lines before and after (a command such as `wc -l` on the files you touched). For each change, one sentence on why the file is easier to read.
