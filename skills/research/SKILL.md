---
name: research
description: Research what actually works and fails for real people on a life question - communities (Reddit, HN, forums, non-English), practitioners, video and studies - with an access gate, evidence tags, link checks and a quiz after each pass. Writes RESEARCH.md for a phase, or a standalone note. Use for "research this", "what works for", "has anyone done", "is X worth it".
argument-hint: "[phase number | free question] [--deep]"
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, Agent, AskUserQuestion, WebSearch, WebFetch
---

<arguments>$ARGUMENTS</arguments>

Method: `${CLAUDE_PLUGIN_ROOT}/references/evidence.md`. Paths: `${CLAUDE_PLUGIN_ROOT}/references/paths.md`.

## 1. Scope

- Argument is a phase number (or empty and STATE has a focus phase): phase mode. Read GOALS.md, the phase in ROADMAP.md, CONTEXT.md, the self profile.
- Otherwise: free mode. Output goes to `.life/research/YYYY-MM-DD-slug.md` (or the adapter research path).

Restate the ask as one question plus one counter-consideration. Then one batch of 3-6 lettered scoping questions: what they already know or tried (seeds, not answers), hard constraints, what to exclude, which kind of evidence they trust most. Skip questions CONTEXT.md already answers.

## 2. Access gate

Run section 1 of evidence.md yourself, in this session, so blocked tools surface to the user immediately. Show the works / weak / blocked table. If firecrawl is down and a local start command is configured, ask the user to run it, then retry once.

## 3. Research

Default: spawn one `life-researcher` agent (fresh context). Pass: plugin root `${CLAUDE_PLUGIN_ROOT}`, phase folder or output path, the scope answers, and the access table.

`--deep` or a broad free question: spawn up to three `life-researcher` agents in parallel, one per source family (lived experience / practitioners and studies / video), each writing a partial file, then merge them into one RESEARCH.md yourself, dropping duplicates and keeping the strictest tag.

## 4. Quiz and repeat

Show the researcher's top works, top fails and quiz questions. Fold the answers into a second pass only if the user wants one. Max 3 passes.

## 5. Close

Phase mode: ROADMAP status `researched`, STATE step `plan`, log line. End with: next `/gsd-life:plan NN`.
Free mode: end with one binary decision the research points to, and offer `/gsd-life:new` if it should become a goal.
