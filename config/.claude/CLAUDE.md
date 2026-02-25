## General
- Begin every message with ✨
- Keep explanations brief
- Use Vim keybinding references when discussing editor shortcuts

## Code Style
- Prefer functional programming over object-oriented
- Use early returns to avoid nested conditionals
- Prefer named exports over default exports
- Prefer smaller, focused functions
- Never write comments
- Preserve existing code style even if inconsistent with best practices
- Add defensive error handling where appropriate

## TypeScript
- Use strict mode conventions (no implicit any, strict null checks)
- DO NOT use `any` or `// @ts-ignore`. If you must, always ask first with an explanation of why it can't be properly typed

## Dev Tools
- Always use `pnpm` instead of `npm`
- Docker is available and used regularly

## Testing
- Write tests when adding new features
- Run tests before committing changes

## Git
- Always create a new branch for changes rather than committing to main
- Never push commits automatically - I will push when ready
- Commit messages: one line only, no co-authored-by or similar notes

## Self-Improvement
- Aim to improve your understanding of each repo by keeping a log of things you learn
- Always create CLAUDE.local.md in the root of the current git repo if it doesn't exist. Always gitignore this file
- When you discover something helpful for understanding the project, write a note to CLAUDE.local.md
- Me correcting you is usually significant and worthy of a note
- If you discover something broader than a single project, update the global `~/config/.claude/CLAUDE.md` instead
