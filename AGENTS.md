# Style
- Avoid self-evident comments
- Ensure newline at the end of file
- Optimize code for top-down readability and ease of reasoning
  - Prefer entry points first, then core behavior, public/private utilities, etc
  - When there are distinct groups, use obvious block section headers rather than single-line comments
  - Keep small helpers inline unless defining them materially improves readability or reuse
  - Inline pass-through locals unless aliases clarify intent or reduce meaningful duplication
  - Prefer single source of truth; derive related values instead of repeating them

# Git
- Commit messages
  - Review previous commits for patterns
  - If no clear pattern, prefix with feat/fix/refactor/docs/test/chore/style/perf/build/ci/config/deps/hotfix/revert/etc
- Rebase before creating new PR
  - `git fetch`
  - `git rebase origin/master`
  - `git push --force`
