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

Then, once per folder where you keep your life notes:

```text
/gsd-life:setup              # state in .life/
/gsd-life:setup --wiki wiki  # or connect an Obsidian vault / LLM wiki
```

Try it without installing: `claude --plugin-dir /path/to/gsd-life`.

### Research dependencies

None of these are required. Missing ones make research thinner, never block it; `/gsd-life:setup` reports which work.

| Dependency | What it adds | How |
|---|---|---|
| Firecrawl MCP | search and clean page scraping | Ships in the plugin. Cloud: set `firecrawl_api_key`. Self-hosted: set `firecrawl_api_url` (e.g. `http://localhost:3002`) and keep the instance running. Change later with `claude plugin configure gsd-life`, then restart. |
| `watch@claude-video` | watching video retrospectives | `/gsd-life:setup` offers to install it. If installed but disabled: `claude plugin enable watch@claude-video`. |
| `yt-dlp`, `ffmpeg` | video search and frames | system package manager |
| WebSearch / WebFetch | fallback | built in |

`watch` is deliberately not a hard plugin dependency: an unresolved hard dependency disables the whole plugin.

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

**Expect:** `new`, `discuss`, `checkin`, `reflect` take a few minutes. `plan` is slow on purpose, about 15 minutes for research and planning plus up to 10 for the checker loop, because it reads real reports instead of guessing.

## Example

A tested run of goal "run 5 km without stopping":

- **new** turned "start running" into a dated success test and 4 phases, and pulled past attempts from the self profile (both quit in week 2 with shin pain).
- **discuss** locked 12 decisions and flagged "6:30am runs" against a profile note saying mornings are unreliable.
- **research** read 17 beginner threads, NHS guidance and a cadence study. Pattern: full rest then restart at the same load repeats the injury.
- **plan** led with one 15-minute run/walk this Tuesday. The checker blocked the first draft (late gym nights would cut sleep before 6:30 runs); the revision passed.
- **checkin** traced a missed run to a 10pm gym session, not the morning slot, and changed one thing: two evening alarms.
- **reflect** recorded "mornings work when the gym ends early" as an exception in the self profile.

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
docs/superpowers/ design spec and implementation plan
```

## Develop

```bash
bash scripts/check.sh          # frontmatter, references, manifests
claude plugin validate .       # Claude Code's own validator
claude --plugin-dir . -p "/gsd-life:next --status"
```

Skills reference plugin files through `${CLAUDE_PLUGIN_ROOT}`. Thinking skills are not model-invocable; loop skills read their `SKILL.md` and follow it (see `references/thinking-map.md`).

## License

MIT. Derived from GSD Core (MIT, Open GSD). Thinking skills MIT, TJ Boudreaux.
