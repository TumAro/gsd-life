# gsd-life

**Get Stuff Done, for life.** The GSD loop (discuss, research, plan, execute, verify) from [GSD Core](https://github.com/open-gsd/gsd-core), rebuilt for goals that are not code: fitness, career moves, study abroad, money, learning, relationships, habits.

Two ideas make it different from a todo app:

1. **Research from real people.** Before planning, a researcher looks at what actually worked and failed for people in your situation: Reddit, Hacker News, forums (non-English too), practitioners, video retrospectives, and studies where they exist. Every claim is tagged `[sourced]`, `[inferred]`, `[missing]` or `[passive-knowledge]`, and every link is checked.
2. **Thinking models at fixed points.** 28 thinking skills from [cc-thinking-skills](https://github.com/tjboudreaux/cc-thinking-skills) are built in and fire where they matter: pre-mortem and margin of safety on every plan, reversibility on decisions, five-whys on missed weeks, via negativa on reflection.

You do the actions. Claude thinks, researches, plans, tracks and pushes back.

## Install (Claude Code)

```text
/plugin marketplace add TumAro/gsd-life
/plugin install gsd-life@gsd-life
```

`/gsd-life:setup` checks for `watch@claude-video` (video research) and installs it with your OK. Firecrawl MCP ships in the plugin; on enable you are asked for a Firecrawl URL and key (leave the key empty for self-hosted, or skip both and research falls back to WebSearch). Then run `/gsd-life:setup` once per folder.

Optional system tools for video research: `yt-dlp`, `ffmpeg`.

## The loop

| Command | Does |
|---|---|
| `/gsd-life:setup` | dependency check, create `.life/`, connect a wiki |
| `/gsd-life:new` | grill a goal to its real why and a dated success test; write the roadmap |
| `/gsd-life:discuss NN` | lock the decisions for a phase (D-01, D-02, ...) |
| `/gsd-life:research NN` | what works and fails for real people; also free questions |
| `/gsd-life:plan NN` | research, plan, then a checker stress-tests it (up to 3 rounds) |
| `/gsd-life:do` | today's 1-3 actions; does the Claude-side prep |
| `/gsd-life:checkin` | log reality, find root cause, make one adjustment |
| `/gsd-life:reflect NN` | close the phase, update your self profile |
| `/gsd-life:next` | where am I, what next; runs it |
| `/gsd-life:capture <text>` | inbox without losing focus |

Start with `/gsd-life:next`.

## Files

```
.life/
  config.json   self.md   GOALS.md   ROADMAP.md   STATE.md   INBOX.md   log.md
  phases/NN-slug/  CONTEXT.md  RESEARCH.md  PLAN.md  CHECKINS.md  REFLECTION.md
```

Plain markdown. Keep it in a private git repo or your notes vault.

## Use with an Obsidian vault or LLM wiki

`/gsd-life:setup --wiki <folder>` maps four roles into your vault:

```json
{ "paths": { "self": "wiki/self", "research": "wiki/web_research",
             "decisions": "wiki/coach/decisions", "log": "wiki/log.md" } }
```

Your self profile, research and decisions then live in the wiki you already curate, and gsd-life follows the wiki's own `CLAUDE.md` rules. Goals, roadmap and phases stay in `.life/`.

## Rules gsd-life keeps from GSD

- Locked decisions are honored; deferred ideas stay out.
- Plans are goal-backward: what must be true at the end, then actions.
- Every plan leads with a **first real rep** this week, not preparation.
- No silent scope cuts: a phase that does not fit your time and money is split.
- Max 5 active goals.

## Layout

```
.claude-plugin/   plugin and marketplace manifests
.mcp.json         firecrawl MCP
skills/           10 loop skills + 28 thinking-* skills (MIT, see skills/THINKING-LICENSE)
agents/           life-researcher, life-planner, life-plan-checker
templates/        .life/ artifacts
references/       paths, evidence method, thinking-model map
scripts/check.sh  layout validation
```

## License

MIT. Derived from GSD Core (MIT, Open GSD). Thinking skills MIT, TJ Boudreaux.
