# Real-human evidence research

Goal: find what actually worked and failed for real people in situations like the user's, not what polished advice says should work. Adapted from the `research-wide` method.

## 1. Access gate (before any research)

Test, do not assume. Run one tiny query per channel and report a table: works / weak / blocked.

| Channel | Test |
|---|---|
| Firecrawl MCP | `firecrawl_search` for the topic, limit 3. If the MCP tool errors and `.life/config.json` has `research.firecrawl_local_start`, tell the user to run it (`! <command>`), then retry once. For self-hosted instances, `curl -s localhost:3002/v2/search` may work when the MCP call fails. |
| WebSearch / WebFetch | one search. Built in; often thin and region-limited. Fallback, say so. |
| Reddit | `curl -s -A gsd-life "https://www.reddit.com/search.json?q=<q>&limit=10&sort=top&t=all"` |
| Hacker News | `curl -s "https://hn.algolia.com/api/v1/search?query=<q>&tags=story"` (URL-encode `>` as `%3E` in numeric filters) |
| Video | `yt-dlp --flat-playlist --print "%(title)s | %(uploader)s | %(duration)s | %(view_count)s | %(webpage_url)s" "ytsearch10:<q>"` for discovery. `/watch <url>` (watch@claude-video) to actually watch the top 1-2. |
| Papers | AlphArxiv or arXiv API only when the topic has real studies (sleep, training, nutrition, learning). |

Never route around login walls, CAPTCHAs or blocked calls. Report gaps in the output.

## 2. Wide pass: several source types, never one

- **Lived experience:** Reddit (topic subreddits, "what worked", "I failed at", "1 year later"), forums, HN "Ask HN", long-form personal blogs, non-English communities when the user's language list includes them.
- **Practitioners:** coaches, clinicians, teachers writing from caseload, not marketing.
- **Studies:** only to confirm or contradict lived reports; note sample and population.
- **Video:** progress logs and "what I'd do differently" retrospectives beat tutorials.

Read the top few per source type, not everything. Prefer reports with time spans ("6 months in"), numbers, and failures.

## 3. Bias guard

- Mine vocabulary the user did NOT use. Their named ideas are seeds, shown separately, not the answer.
- Survivorship: success posts over-represent winners. Actively search failure and quit stories ("gave up", "didn't work for me", "relapsed").
- Name each source's skew (beginner vs advanced, country, age, money).
- Fresh user evidence beats any stored pattern or source.
- A search that found nothing is a coverage gap, not proof of absence.

## 4. Tags (every claim carries one)

- `[sourced]` with a link you opened.
- `[inferred]` your reasoning from sourced items.
- `[missing]` looked, found nothing.
- `[passive-knowledge]` from model memory, not checked this session.

## 5. Verify before claiming

- HTTP 200 on every link you cite (`curl -s -o /dev/null -w "%{http_code}" <url>`).
- Never invent a link, a quote, a number or a username.
- Say "titles only, not read" or "not frame-watched" when true.

## 6. Quiz after each pass

Batch 3-6 numbered questions with lettered options, answer format `1a 2b,c 3`. Ask: rate each finding y/m/n, which fits their constraints, what turned them off, what to search next. Fold answers into the next pass. Stop after the user says enough or after 3 passes.
