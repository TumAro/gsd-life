---
name: setup
description: Set up gsd-life - check and install dependencies (firecrawl MCP, watch video plugin, yt-dlp), create .life/, and optionally point self, research, decisions and log at an Obsidian vault or LLM wiki. Use on first run, when a dependency is missing, or to connect a wiki.
argument-hint: "[--wiki <folder>] [--check]"
allowed-tools: Read, Write, Edit, Bash, Glob, AskUserQuestion
---

<arguments>$ARGUMENTS</arguments>

Set up gsd-life in the current folder. Plugin root: `${CLAUDE_PLUGIN_ROOT}`. Path rules: `${CLAUDE_PLUGIN_ROOT}/references/paths.md`.

## 1. Dependency preflight

Check each dependency and print one table: name | status (ok / missing / degraded) | fix.

| Dependency | Check | Auto-fix |
|---|---|---|
| firecrawl MCP | Is a `firecrawl_search` tool available (plugin server `firecrawl` or a user-level one)? Try one search, limit 1. | Ships in this plugin's `.mcp.json`. If it fails: cloud needs a key, run `claude plugin configure gsd-life` and set `firecrawl_api_key`; self-hosted needs `firecrawl_api_url` (for example `http://localhost:3002`) and the instance running. Restart Claude Code after. |
| watch (claude-video) | Is the `watch` skill or `/watch` command available? | Not a hard plugin dependency on purpose: a missing hard dependency disables the whole plugin. If missing, ask once, then run `claude plugin marketplace add bradautomates/claude-video` and `claude plugin install watch@claude-video`. Restart needed. |
| yt-dlp, ffmpeg | `command -v yt-dlp ffmpeg` | Suggest the user's package manager (`pipx install yt-dlp`, `sudo apt install ffmpeg`, `brew install yt-dlp ffmpeg`). Never run sudo yourself; tell the user to type `! <command>`. |
| curl, python3 | `command -v` | Report only. |

Missing dependencies never block. Research falls back to WebSearch and WebFetch and says so. `--check` stops after this step.

## 2. Create `.life/`

If `.life/` does not exist, create it and copy from `${CLAUDE_PLUGIN_ROOT}/templates/`: `GOALS.md`, `ROADMAP.md`, `STATE.md`, `INBOX.md`, `self.md`, `config.json`. Create `.life/phases/`. Never overwrite existing files.

## 3. Wiki adapter (optional)

Ask once (skip if `--wiki` given): "Keep everything in `.life/`, or connect a wiki or Obsidian vault?"

If connecting:
1. Read the vault's `CLAUDE.md`, `AGENTS.md`, `README.md` and index page if present.
2. Propose a mapping for `self`, `research`, `decisions`, `log` based on its folders (for example `wiki/self/`, `wiki/web_research/`, `wiki/coach/decisions/`, `wiki/log.md`). Show it and confirm.
3. Write `.life/config.json` `paths`. Only map folders that exist.
4. If the vault already has a self profile, do not copy it into `.life/self.md`; delete the stub `.life/self.md` instead so there is one source of truth.

Also ask, once: "Do you run Firecrawl self-hosted? If so, what command starts it?" Save to `research.firecrawl_local_start`. And: "Which languages should research cover besides English?" Save to `research.languages`.

## 4. Finish

Append to the log: `YYYY-MM-DD gsd-life:setup done`. Print the dependency table, where state lives, and the next step: `/gsd-life:new` to define a goal.
