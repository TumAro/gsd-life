---
name: plan
description: Plan one life phase - research first if missing, then a life-planner writes PLAN.md (goal-backward truths, first real rep this week, actions with trigger, cost, done-test, fallback) and a life-plan-checker stress-tests it with pre-mortem, margin of safety and second-order effects, revising up to 3 times. Use when a phase is discussed and needs a plan, or a plan needs redoing after check-ins.
argument-hint: "[phase number] [--skip-research] [--gaps]"
allowed-tools: Read, Write, Edit, Bash, Glob, Agent, AskUserQuestion
---

<arguments>$ARGUMENTS</arguments>

Orchestrate; do not write the plan yourself. Paths: `${CLAUDE_PLUGIN_ROOT}/references/paths.md`.

## 1. Load and gate

Phase = argument, else STATE focus phase. Require the phase in ROADMAP.md. If `CONTEXT.md` is missing, ask: run `/gsd-life:discuss NN` first (recommended) or plan with everything open to judgment.

## 2. Research

If `RESEARCH.md` is missing and no `--skip-research`: run the `/gsd-life:research NN` flow (scope questions, access gate, researcher, one quiz). `--gaps` skips research and reads the latest CHECKINS.md gaps instead.

## 3. Plan

Spawn `life-planner` with: plugin root `${CLAUDE_PLUGIN_ROOT}`, phase folder, mode (`create`, or `gaps` with the check-in gaps).

If it returns `PHASE SPLIT RECOMMENDED`, show the split, ask, update ROADMAP.md on approval, and plan the first sub-phase.

## 4. Check loop (max 3 rounds)

Spawn `life-plan-checker` on the phase folder.
- `PASS`: continue.
- `ISSUES`: spawn `life-planner` in `revise` mode with the issues. Increase `Revisions` in PLAN.md. Re-check.
- After round 3 with blocking issues left: show them and ask the user to accept, edit, or re-discuss.

## 5. Present

Show, in under 20 lines: must-be-true list, the first real rep, weekly time and money, top 2 pre-mortem risks with their guards, first check-in date. Ask for changes; apply small ones directly to PLAN.md.

ROADMAP status `planned`, STATE step `do`, next check-in due date. Log line. End with: next `/gsd-life:do`.
