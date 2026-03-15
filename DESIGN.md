# RepoSense — CLI Contract

RepoSense is a lightweight, script-based CLI that wraps GitHub Copilot CLI.

Rather than implementing static analyzers or repository scanners directly,
RepoSense acts as a thin orchestration layer that structures prompts and
delegates reasoning to GitHub Copilot CLI. The goal is to provide meaningful
repository insights through simple terminal commands.

This interface was designed collaboratively with GitHub Copilot CLI before
any implementation began.

RepoSense treats Copilot as a **development partner**, allowing developers
to explore, document, review, and improve repositories directly from the
terminal.

---

# Core Design Philosophy

RepoSense follows three core principles:

### 1. Thin CLI Layer
RepoSense itself performs minimal logic. Its primary role is to:
- Accept user commands
- Construct focused prompts
- Delegate analysis to GitHub Copilot CLI

### 2. Copilot-Powered Reasoning
All intelligence comes from GitHub Copilot CLI. RepoSense simply structures
the interaction in a repeatable workflow.

### 3. Terminal-First Workflow
RepoSense is designed to work entirely from the command line, making it useful
for developers who prefer a terminal-centric workflow.

---

# Command Interface

RepoSense currently exposes eight commands.

Each command accepts an optional path argument. If no path is provided,
the current directory (`.`) is used.

---

# Commands

## reposense explain [path]

Explains the purpose, architecture, and structure of a repository.

This command is useful when exploring unfamiliar codebases or onboarding
onto a new project.

It asks GitHub Copilot CLI to analyze the repository and summarize:

- project purpose
- architecture overview
- key directories
- important files
- technology stack
- developer entry points

Example:

reposense explain .
reposense explain ./src
reposense explain ../another-repo


---

## reposense readme [path]

Generates a professional README.md for a repository.

This command analyzes the repository and asks Copilot CLI to produce a
well-structured README including:

- project overview
- installation instructions
- usage examples
- configuration details
- contribution guidelines

Output is printed to the terminal and can be redirected to a file.

Example:

reposense readme .
reposense readme ./backend
reposense readme . > README.md


---

## reposense suggest [path]

Suggests improvements for repository quality.

Copilot CLI evaluates the repository and produces prioritized recommendations
covering:

- documentation gaps
- testing improvements
- project structure
- DevOps practices
- maintainability improvements

Example:


reposense suggest .
reposense suggest ./backend


---

## reposense onboard [path]

Generates a developer onboarding guide for a repository.

This command helps new developers understand how to get started quickly.

Copilot CLI produces an onboarding summary including:

- project purpose
- high-level architecture
- key directories
- important files to read first
- technology stack
- setup instructions
- suggested starting points for contributors

Example:


reposense onboard .
reposense onboard ./service


---

## reposense review [path]

Performs an AI-assisted code review of a repository.

This command asks Copilot CLI to analyze the codebase as if performing a
senior engineer code review.

The analysis focuses on:

- architecture concerns
- code quality
- maintainability
- testing gaps
- potential security issues

Example:


reposense review .
reposense review ./api


---

## reposense health [path]

Generates a project health report.

Copilot CLI evaluates the repository across multiple dimensions and
produces a structured report including:

- documentation quality
- testing coverage
- CI/CD setup
- repository structure
- dependency management
- security practices

The output typically includes strengths, weaknesses, and improvement
recommendations.

Example:


reposense health .
reposense health ./backend


---

## reposense security [path]

Performs a security-oriented analysis of the repository.

Copilot CLI reviews the repository looking for:

- hardcoded secrets
- insecure configuration patterns
- authentication risks
- unsafe dependency practices
- exposure of sensitive data
- general security weaknesses

Findings are prioritized by severity and include suggested remediations.

Example:


reposense security .
reposense security ./service


---

## reposense generate-tests [path]

Recommends a testing strategy for the repository.

Copilot CLI analyzes the repository and suggests:

- appropriate testing frameworks
- modules that should be tested first
- sample test structures
- example test cases
- testing priorities

This command helps teams improve test coverage quickly.

Example:


reposense generate-tests .
reposense generate-tests ./api


---

# Typical Developer Workflow

A common workflow when exploring a repository might look like this:


reposense onboard .
reposense explain .
reposense health .
reposense review .
reposense suggest .


Developers can then improve the repository using recommendations generated
by Copilot CLI.

---

# Implementation Model

RepoSense intentionally avoids implementing repository analyzers internally.

Instead, each command:

1. Accepts a command and optional path
2. Constructs a focused prompt
3. Delegates analysis to GitHub Copilot CLI
4. Displays the result in the terminal

This design keeps the CLI lightweight while leveraging the reasoning
capabilities of GitHub Copilot.

---

# Design Goals

RepoSense aims to:

- Reduce time spent understanding unfamiliar repositories
- Improve repository documentation
- Surface improvement opportunities
- Assist with onboarding and code review
- Provide repository insights directly from the terminal

By keeping the CLI minimal and relying on Copilot for reasoning, RepoSense
remains simple while still providing powerful repository analysis capabilities.