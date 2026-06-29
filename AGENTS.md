# Guideline
- Think before execution
  - State assumptions explicitly, and ask when requirements are ambiguous
  - If multiple interpretations exist, present them instead of choosing silently
  - Surface simpler approaches and tradeoffs before implementing
- Keep it simple
  - Build only what was asked: no speculative features, abstractions, configurability, or impossible-case handling
  - If the solution feels larger than the problem, simplify it before moving on
- Make surgical changes
  - Touch only what the request requires; do not improve adjacent code, comments, or formatting
  - Match existing style, even when another style would be preferable
  - Clean up only the mess created by your change
  - Mention unrelated dead code or cleanup opportunities instead of changing them
- Execute against a verifiable goal
  - Define success criteria before making changes
  - For multi-step work, state a brief plan with a verification step for each item
  - Turn vague requests into checks, such as reproducing a bug with a test before fixing it
  - Verify with the narrowest relevant test or command before finishing

# Coding Style
- Avoid self-evident comments
- Ensure newline at the end of file
- Optimize for top-down readability and ease of reasoning
  - Prefer entrypoints first, then core behavior or control flow, then public/private utilities, etc
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
  - `git rebase origin/<default branch>`
  - `git push --force`
