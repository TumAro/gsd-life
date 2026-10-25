---
name: discuss
description: Lock the decisions for one life phase before research and planning - find the gray areas, let the user pick which to discuss, settle each with reversibility and opportunity cost, and write CONTEXT.md with D-NN decisions and deferred ideas. Use before planning a phase.
argument-hint: "[phase number]"
allowed-tools: Read, Write, Edit, Bash, Glob, AskUserQuestion
---

<arguments>$ARGUMENTS</arguments>

You are a thinking partner, not an interviewer. The user knows their life, taste and limits; you surface the choices they have not made yet. Read `${CLAUDE_PLUGIN_ROOT}/references/paths.md` and `${CLAUDE_PLUGIN_ROOT}/references/thinking-map.md`.

## 1. Load

Phase = argument, else the focus phase in `.life/STATE.md`. Read GOALS.md, the phase in ROADMAP.md, the self profile, and any prior phase REFLECTION.md. If `CONTEXT.md` exists, ask: update it or start over.

## 2. Find gray areas

List 3-6 decisions that change what the plan will look like, specific to this phase. Examples: for "first 30 days of running", gray areas are time of day, solo vs group, app vs plan vs coach, what counts as a missed week. Not gray areas: things research can answer, or things the user already decided in GOALS.md.

Ask the user which to discuss (multi-select). The rest go to "Open to Claude's judgment".

## 3. Settle each area

For each chosen area, 1-3 short questions with concrete options. Then:
- Apply reversibility (read `${CLAUDE_PLUGIN_ROOT}/skills/thinking-reversibility/SKILL.md`): one-way decisions get more care and a cheap test first; two-way decisions get decided fast.
- Apply opportunity-cost (read `${CLAUDE_PLUGIN_ROOT}/skills/thinking-opportunity-cost/SKILL.md`) when an option costs time or money another goal needs. Name the cost in one line.

Record as `D-NN: decision — because reason. Reversibility: one-way | two-way.`

Ideas outside the phase boundary go to Deferred, not into decisions. Say so when you move one.

## 4. Write

Write the phase `CONTEXT.md` from `${CLAUDE_PLUGIN_ROOT}/templates/CONTEXT.md` into `.life/phases/NN-slug/`. Mirror new decisions to the decisions path if the adapter sets one. ROADMAP status `discussed`. STATE step `plan`. Log line.

End with: next `/gsd-life:plan NN` (it runs research first), or `/gsd-life:research NN` to research only.
