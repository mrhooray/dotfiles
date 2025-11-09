# Style
- **Avoid self-evident comments**
  ```
  # Bad: self-evident
  # Set x to 5
  x = 5
  # Return the result
  return result

  # Good: no comment needed
  x = 5
  return result
  ```
- **Ensure newline at the end of file**

# Git
- Commit messages
  - Review previous commits for patterns
  - If no clear pattern, prefix with feat/fix/refactor/docs/test/chore/style/perf/build/ci/config/deps/hotfix/revert/etc
- Rebase before creating new PR
  - `git fetch`
  - `git rebase origin/master`
  - `git push --force`
