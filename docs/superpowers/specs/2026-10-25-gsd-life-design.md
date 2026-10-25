# gsd-life design

**Date:** 2026-10-25
**Status:** approved in brainstorming (sections confirmed by user)

## Goal

Turn GSD Core (a spec-driven development system for coding agents) into **gsd-life**: the same discipline (discuss, research, plan, act, verify, reflect) applied to general life goals. Remove everything that only exists for software delivery.

## Decisions

- **D-01 Lean rewrite.** Delete the Node/TypeScript engine (`gsd-tools`, `src/`), the 15k-line multi-runtime installer, runtime ports (pi, vscode, opencode, kilo), hooks, tests, CI, translations, changesets, docs. Ship markdown only.
- **D-02 One Claude Code plugin** named `gsd-life`. Commands appear as `/gsd-life:<skill>`.
- **D-03 Generic core plus optional wiki adapter.** State lives in `.life/` by default. `.life/config.json` can map `self`, `research`, `decisions`, `log` to folders in any LLM wiki or Obsidian vault (for example cele-life). Unset paths fall back to `.life/`.
- **D-04 Human executes.** Agents think, research, plan, track and review. The user does the real-world actions. Check-ins replace git commits as the record of truth.
- **D-05 Real-human evidence research.** The research skill generalizes cele-life's `research-wide`: scope by grilling, access gate, wide pass across communities (Reddit, HN, forums incl. non-English), articles and video, evidence tags (`[sourced]` `[inferred]` `[missing]` `[passive-knowledge]`), link verification, quiz after each pass. Output separates what works, what fails, and what is mixed, as reported by real people.
- **D-06 Dependencies declared and auto-enabled.** Plugin `.mcp.json` registers firecrawl, configured through plugin `userConfig` (`firecrawl_api_url`, `firecrawl_api_key`). `setup` checks and offers to install `watch@claude-video`, writes config, and reports gaps. `watch` is not a plugin.json `dependencies` entry: tested 2026-10-25, an unresolved hard dependency disables the whole plugin. Grilling rules are inlined in `new`, `discuss` and `research` instead of depending on a grilling skill. Every skill that needs a dependency degrades to WebSearch/WebFetch and says so.
- **D-07 Thinking models vendored.** The 28 `thinking-*` skills from tjboudreaux/cc-thinking-skills (MIT) ship inside the plugin with their license. Each loop stage invokes fixed models; the router handles open questions.

## Skill set

| Skill | Was (GSD) | Job | Thinking models |
|---|---|---|---|
| setup | install, settings | dependency preflight, adapter config | none |
| new | new-project | grill, write GOAL.md and ROADMAP.md | first-principles, jobs-to-be-done |
| discuss | discuss-phase | lock decisions (D-NN) for one phase | reversibility, opportunity-cost |
| research | phase-researcher | real-human evidence: works / fails / mixed | steel-manning, map-territory, lindy-effect |
| plan | plan-phase | research, plan, plan-check loop | pre-mortem, margin-of-safety, second-order |
| do | execute-phase | turn the plan into today's actions; user acts | none (router if stuck) |
| checkin | verify-work, progress | log reality vs plan, adjust | five-whys-plus, theory-of-constraints |
| reflect | complete-milestone, extract-learnings | lessons into self profile, close phase | via-negativa |
| next | next, progress | read state, route to next step | model-router |
| capture | capture | inbox for ideas and tasks | none |

Agents: `life-researcher`, `life-planner`, `life-plan-checker`.

## Artifacts (`.life/`)

```
.life/
  config.json        adapter paths (optional)
  self.md            constraints, energy, patterns, past failures
  GOALS.md           max 5 active goals, each with why and success test
  ROADMAP.md         phases per goal with outcome and done-test
  STATE.md           current goal, phase, step, last check-in
  INBOX.md           captured items
  phases/NN-slug/
    CONTEXT.md       decisions D-NN, deferred ideas
    RESEARCH.md      works / fails / mixed, evidence-tagged
    PLAN.md          actions: time cost, trigger, done-test, fallback
    CHECKINS.md      dated entries: did, missed, why, adjustment
    REFLECTION.md    what worked, what to stop, pattern updates
```

## Kept GSD principles

- Decision fidelity: locked D-NN decisions are honored; deferred ideas stay out.
- Goal-backward planning: phase goal, then observable truths, then actions.
- Tracer-first becomes **first real rep**: the plan leads with the smallest real action that proves the path this week.
- No silent scope reduction: split the phase instead.
- Plan-checker loop, max 3 revisions.
- Fresh-context subagents for research and planning.

## Out of scope

Code review, testing, UI, security, eval, codebase mapping, git automation, workstreams, multi-runtime install, MCP server, translations.

## Testing

Markdown-only plugin. One `scripts/check.sh` validates: every skill has frontmatter `name` + `description`, every `@`-reference and template path exists, plugin JSON parses. Manual smoke run: `claude --plugin-dir .` then `/gsd-life:next`.
