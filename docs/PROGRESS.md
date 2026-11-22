---
status: TEMPLATE
updated: 2026-11-22
---

Purpose: append-only session log. Agents read the last 3 entries at session start. Never edit an old entry; add a correction entry. The `handoff` skill moves entries to `docs/archive/PROGRESS-<year>.md` when this file passes about 300 lines.

# Progress

Newest entries go at the bottom. Copy this shape:

```text
### YYYY-MM-DD HH:MM · <human>/<agent> · T-xxx
Done: …
Verified: <command> → <result>
Next: …
Open questions / blockers: …
Branch@commit: …
```
