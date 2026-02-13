# RepoSense — CLI Contract

RepoSense is a lightweight, script-based CLI that wraps GitHub Copilot CLI.

This interface was designed collaboratively with GitHub Copilot CLI before
any implementation began.

## Commands

### reposense explain [path]

Explains the purpose, architecture, and structure of a repository.

- Default path: current directory
- Delegates analysis to GitHub Copilot CLI

Example:
reposense explain .
reposense explain ./src

---

### reposense readme [path]

Generates a professional README.md for a repository.

- Default path: current directory
- Output is printed to terminal and can be redirected to file

Example:
reposense readme .
reposense readme . > README.md

---

### reposense suggest [path]

Suggests improvements for structure, documentation, testing, and DevOps practices.

- Default path: current directory
- Suggestions are prioritized and actionable

Example:
reposense suggest .
reposense suggest ./backend
