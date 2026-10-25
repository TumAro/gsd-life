---
name: do
description: Turn the current life plan into today's or this week's concrete actions, help with the Claude-side parts (drafts, lookups, prep), and remove friction for the parts the user must do. Use when the user asks what to do today, wants to start the plan, or is stuck starting.
argument-hint: "[today | week] [phase number]"
allowed-tools: Read, Write, Edit, Bash, Glob, AskUserQuestion, WebSearch, WebFetch
---

<arguments>$ARGUMENTS</arguments>

The user executes. You make the next action obvious and small. Paths: `${CLAUDE_PLUGIN_ROOT}/references/paths.md`.

## 1. Load

Focus phase from STATE.md (or argument). Read PLAN.md and the latest CHECKINS.md entry. If no PLAN.md, route to `/gsd-life:plan`. If the next check-in is overdue, say so in one line and offer `/gsd-life:checkin` first.

## 2. Pick

- `today` (default): the 1-3 actions whose trigger falls today, plus the first real rep if not yet done. Nothing else.
- `week`: the actions for the next 7 days as a dated list.

For each: what exactly, when, how long, done-test. If the user is stuck on one, shrink it to a 2-minute version that still counts toward its done-test, and name the first physical move.

## 3. Claude-side help

Do the `claude:` actions in the plan now (draft the email, find the class times, prepare the list). Show results; never send, buy, book or sign anything for the user.

## 4. Close

Ask the user to reply with what they did when done, or run `/gsd-life:checkin`. Do not log completion on intent alone; only check-ins record reality. STATE step stays `do`. Log line only if Claude-side actions were done.

If the user starts planning or researching instead of doing (a third new question about the plan, or more reading than acting), say once: "This is planning again. Next action: <action>." Then stop.
