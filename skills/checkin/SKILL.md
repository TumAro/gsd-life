---
name: checkin
description: Check in on a life phase - log what was done and missed with numbers, find the root cause of drift or blockers, make one adjustment to the plan, and show progress against the done-test. Use for weekly reviews, "how am I doing", "I missed", "update my progress", or when a check-in is due.
argument-hint: "[phase number] [what happened, free text]"
allowed-tools: Read, Write, Edit, Bash, Glob, AskUserQuestion
---

<arguments>$ARGUMENTS</arguments>

Reality is the record. Paths: `${CLAUDE_PLUGIN_ROOT}/references/paths.md`. Models: `${CLAUDE_PLUGIN_ROOT}/references/thinking-map.md`.

## 1. Collect

Focus phase from STATE.md (or argument). Read PLAN.md and prior CHECKINS.md. If the user already wrote what happened, parse it; otherwise ask, as one batch: which actions happened (with numbers), which did not, and for each miss, why in their own words. Ask for the body-level reason ("I was exhausted after 9pm"), not the story ("I lacked discipline").

Fresh evidence beats the plan and the profile. If the user's report contradicts an assumption in PLAN.md or the self profile, the report wins.

## 2. Judge

Signal: `on track` (done-test trend is on pace), `drifting` (misses repeating, pace slipping), `blocked` (an action cannot happen as written).

Drifting or blocked: apply five-whys-plus (read `${CLAUDE_PLUGIN_ROOT}/skills/thinking-five-whys-plus/SKILL.md`) to the main miss, stopping at a cause the user can change. If several actions fail, apply theory-of-constraints (read `${CLAUDE_PLUGIN_ROOT}/skills/thinking-theory-of-constraints/SKILL.md`) to find the one binding constraint.

Self-blame is not a root cause. Redirect to trigger, time, cost or environment.

## 3. Adjust

Exactly one change to PLAN.md, or none: move a trigger, shrink an action, swap an approach for another `works` row in RESEARCH.md, add a fallback. Record it. If the plan needs more than one change, or the done-test is out of reach, offer `/gsd-life:plan NN --gaps`.

A pattern seen in 2+ check-ins goes to the self profile Patterns table with sources. One occurrence is a signal, not a pattern.

## 4. Write and show

Append the entry to CHECKINS.md from `${CLAUDE_PLUGIN_ROOT}/templates/CHECKINS.md`. ROADMAP status `doing`. Update STATE: last check-in, next due (cadence from config, default 7 days). Log line.

Show: progress against each must-be-true truth (one line each), the adjustment, next check-in date. If the done-test is met, end with: next `/gsd-life:reflect NN`. Otherwise: next `/gsd-life:do`.
