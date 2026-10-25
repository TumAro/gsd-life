---
name: capture
description: Capture an idea, task, note or worry into the gsd-life inbox without breaking focus, or file it straight into a goal when it obviously belongs there. Use for "note this", "remind me", "add to my list", "idea:", or any stray thought mid-session.
argument-hint: "<text>"
allowed-tools: Read, Write, Edit, Bash
---

<arguments>$ARGUMENTS</arguments>

1. If `.life/` is missing, create `.life/INBOX.md` from `${CLAUDE_PLUGIN_ROOT}/templates/INBOX.md`.
2. Classify the text: idea, task, note or worry.
3. If it clearly belongs to the focus phase as a small action (fits the plan's time budget, serves a truth), ask once: "Add to the plan as an action, or inbox?" Otherwise append to INBOX.md: `- [ ] YYYY-MM-DD [type] text`.
4. Reply in one line: where it went. Do not start working on it. Do not discuss it.
