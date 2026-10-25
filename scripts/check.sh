#!/usr/bin/env bash
# Validate the gsd-life plugin layout. Exit non-zero on any problem.
set -u
cd "$(dirname "$0")/.."
fail=0
err() { echo "FAIL: $*"; fail=1; }

for f in .claude-plugin/plugin.json .claude-plugin/marketplace.json .mcp.json; do
  python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$f" 2>/dev/null || err "$f missing or invalid JSON"
done

for s in setup new discuss research plan do checkin reflect next capture; do
  [ -f "skills/$s/SKILL.md" ] || err "skill $s missing"
done
for a in life-researcher life-planner life-plan-checker; do
  [ -f "agents/$a.md" ] || err "agent $a missing"
done

for f in skills/*/SKILL.md agents/*.md; do
  [ -f "$f" ] || continue
  head -1 "$f" | grep -qx -- '---' || { err "$f: no frontmatter"; continue; }
  fm=$(awk 'NR>1 && /^---$/{exit} NR>1' "$f")
  echo "$fm" | grep -q '^name:' || err "$f: frontmatter lacks name"
  echo "$fm" | grep -q '^description:' || err "$f: frontmatter lacks description"
done

# Every ${CLAUDE_PLUGIN_ROOT}/path reference must resolve.
grep -rhoE '\$\{CLAUDE_PLUGIN_ROOT\}/[A-Za-z0-9_./-]+' skills agents references 2>/dev/null \
  | sed 's|${CLAUDE_PLUGIN_ROOT}/||; s|[.,)]*$||' | grep -v -- '-$' | sort -u | while read -r p; do  # skip templated refs like thinking-<slug>
    [ -e "$p" ] || { echo "FAIL: dangling reference $p"; exit 1; }
  done || fail=1

[ "$fail" = 0 ] && echo "check: PASS" || { echo "check: FAILED"; exit 1; }
