Generate a commit message for the staged changes. Keep the first line under 50 characters. Subsequent lines should be under 72 characters.

Steps:
1. Run `git log -5` to check existing commit style.
2. Run `git diff --cached` to view staged changes.
3. Output a commit message in a code block.

Examples:
- `fix: resolve null pointer in authentication`
- `feat(api): add rate limiting endpoint`
- `refactor(auth): extract validation logic`
- `docs(readme): update installation guide`
