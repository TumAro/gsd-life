---
name: next
description: Read the gsd-life state and do or route to the single right next step - setup, new goal, discuss, research, plan, do, check-in or reflect - with a short progress view across active goals. Use when the user asks what next, where am I, show progress, or starts a session.
argument-hint: "[--status]"
allowed-tools: Read, Bash, Glob, Skill, AskUserQuestion
---

<arguments>$ARGUMENTS</arguments>

## 1. Read state

- No `.life/`: next is `/gsd-life:setup`.
- Read STATE.md, GOALS.md, ROADMAP.md, INBOX.md. Paths per `${CLAUDE_PLUGIN_ROOT}/references/paths.md`.

## 2. Show progress (max 10 lines)

One line per active goal: `G1 <title> · phase NN/<total> <status> · last check-in <date>`. Flag overdue check-ins and phases past their window.

## 3. Route (first rule that matches)

1. No active goals: `/gsd-life:new`.
2. A check-in is overdue: `/gsd-life:checkin`.
3. Focus phase status:
   - `not started`: `/gsd-life:discuss NN`
   - `discussed` or `researched`: `/gsd-life:plan NN`
   - `planned` or `doing`: `/gsd-life:do`
   - done-test met per last check-in: `/gsd-life:reflect NN`
   - `done`: next phase `/gsd-life:discuss NN+1`, or `/gsd-life:new` if the goal is done
4. INBOX.md has more than 10 open items: offer triage (each item: goal action, new goal, defer, delete).

The user asks an open question that fits no step ("should I take this job?"): read `${CLAUDE_PLUGIN_ROOT}/skills/thinking-model-router/SKILL.md`, route to one model, apply it, and offer `/gsd-life:research` if evidence would change the answer.

## 4. Act

`--status`: stop after showing progress and the recommended command.
Otherwise state the next step in one line and invoke it with the Skill tool (`gsd-life:<skill>`), unless it changes a goal or parks something; then ask first.
