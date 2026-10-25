# Path resolution

Every gsd-life skill and agent resolves files the same way.

1. State root is `.life/` in the current working directory.
2. If `.life/config.json` exists, read `paths`. Each key may point anywhere relative to the working directory, for example into an Obsidian vault or LLM wiki:
   - `self`: the self profile. A file (`wiki/self/profile.md`) or a folder (`wiki/self/`). If a folder, read every `.md` in it and write new patterns to `<folder>/patterns.md` unless a page clearly fits better.
   - `research`: where RESEARCH.md copies go. Default `.life/phases` (research lives next to the phase). If set to a wiki folder, write `<folder>/<NN-slug>-research.md` and leave a one-line pointer in the phase folder.
   - `decisions`: where locked decisions are mirrored. Default `.life/phases` (CONTEXT.md only). If set, also append each new D-NN to `<folder>/active.md`.
   - `log`: an append-only log. Default `.life/log.md`. One line per state change: `YYYY-MM-DD gsd-life:<skill> <what changed>`.
3. Unset keys fall back to the defaults above. No config file means all defaults.
4. GOALS.md, ROADMAP.md, STATE.md, INBOX.md and `phases/` always live in `.life/`. The adapter never moves them, so the loop works the same in every vault.

## Wiki etiquette (when paths point into a wiki)

- Read the wiki's own `CLAUDE.md` or `AGENTS.md` first and follow its page format, naming and index rules.
- Never write into folders the wiki marks immutable (for example `raw/`).
- If the wiki keeps an index page, add new pages to it.

## Phase folders

`.life/phases/NN-slug/` where NN is the two-digit phase number from ROADMAP.md and slug is the phase outcome in lowercase-with-hyphens.

## Templates

Copy from `${CLAUDE_PLUGIN_ROOT}/templates/`. Fill every bracket. Delete rows you do not use. Never leave `[...]` placeholders in a written file.
