---
name: new
description: Start a life goal - grill it down to the real why and a dated success test, check it against existing goals (max 5 active), fill the self profile gaps, and write GOALS.md and a phased ROADMAP.md. Use when the user wants to start, change or seriously commit to a goal (fitness, career, study abroad, money, relationships, learning, habits).
argument-hint: "[goal in your own words]"
allowed-tools: Read, Write, Edit, Bash, Glob, AskUserQuestion
---

<arguments>$ARGUMENTS</arguments>

Define one life goal and its roadmap. Read `${CLAUDE_PLUGIN_ROOT}/references/paths.md` and `${CLAUDE_PLUGIN_ROOT}/references/thinking-map.md`. If `.life/` is missing, run the steps of `/gsd-life:setup` section 2 first.

## 1. Load

Read `.life/GOALS.md`, `.life/ROADMAP.md` and the self profile. Count active goals. Five active means the user must park or finish one before adding; ask which.

## 2. Grill (one round, then follow-ups only where answers are vague)

Ask one batch of 5-8 numbered questions with lettered options; answer format `1a 2b,c 3 <words>`. Cover:
1. The outcome in their words, then: what would you see, on what date, that proves it happened?
2. Why now. Push past the polished reason to the real one (what it feels like if nothing changes in a year).
3. Hard constraints: hours per week, money per month, health, location, people.
4. What they already tried, and how it ended.
5. What they will not do (exclusions).
6. Reversibility: what in this goal is hard to undo (quitting a job, moving, spending savings)?

"idk" is data. Push once for a concrete example, then record `unknown` and move on. Fill gaps in the self profile from these answers with source `(said YYYY-MM-DD)`. Facts only in the profile.

## 3. Think

Apply first-principles (strip the goal to what must be true) and jobs-to-be-done (what job is this goal hired for; is there a cheaper way to do that job?) by reading their SKILL.md files under `${CLAUDE_PLUGIN_ROOT}/skills/`. If the cheaper way exists, say it in one line and ask whether to keep the goal as stated.

## 4. Write

- `GOALS.md`: add the goal with Why, Success test (dated, observable), Constraints, Not doing, Started.
- `ROADMAP.md`: 2-5 phases, each 1-6 weeks, each with Goal, Done-test, Window, Depends on, Status `not started`. Phase 01 should be the smallest phase that proves the goal is livable (first real reps, not preparation).
- `STATE.md`: focus goal, focus phase 01, step `discuss`.
- Log line.

Show the roadmap in under 15 lines and ask for changes. Apply them. End with: next `/gsd-life:discuss 01`.
