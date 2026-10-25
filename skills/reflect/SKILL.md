---
name: reflect
description: Close a life phase or goal - compare results to the plan, keep what worked, decide what to stop (via negativa), record surprises, update the self profile with confirmed patterns and failures, and choose the next phase, a re-plan, or parking the goal. Use when a phase ends, its done-test is met, or the user wants to stop or rethink.
argument-hint: "[phase number]"
allowed-tools: Read, Write, Edit, Bash, Glob, AskUserQuestion
---

<arguments>$ARGUMENTS</arguments>

Paths: `${CLAUDE_PLUGIN_ROOT}/references/paths.md`.

## 1. Load

Phase from argument or STATE. Read CONTEXT.md, RESEARCH.md, PLAN.md, all CHECKINS.md entries, the self profile.

## 2. Results

For each must-be-true truth: met, partly, not met, with evidence from check-ins. Done-test met: yes, partly, no.

## 3. Ask (one batch, lettered)

What surprised you? Which action felt easiest and which hardest? What would you never do again? What did research get wrong for you?

## 4. Think

Apply via-negativa (read `${CLAUDE_PLUGIN_ROOT}/skills/thinking-via-negativa/SKILL.md`): what to remove next phase so the rest works better. Removing beats adding.

## 5. Write

- `REFLECTION.md` from `${CLAUDE_PLUGIN_ROOT}/templates/REFLECTION.md`.
- Self profile: add confirmed patterns, failed approaches (increase the count if already listed), and what worked, each with source `(reflection NN-slug)`. Facts only, no advice.
- Research notes the user marked wrong: add a line under Gaps in RESEARCH.md so later research avoids the same trap.
- ROADMAP: phase status `done`. GOALS: if the success test is met, move the goal to Done.
- STATE: next phase, step `discuss`. Log line.

## 6. Next

Offer one of: next phase (`/gsd-life:discuss NN+1`), re-plan this phase (`/gsd-life:plan NN --gaps`), or park the goal (move to Parked with a reason). Recommend one, with a one-line reason.
