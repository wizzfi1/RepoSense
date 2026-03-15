# RepoSense

> Intelligent repository analysis and documentation powered by GitHub Copilot CLI

**RepoSense** is a lightweight CLI tool that harnesses the power of GitHub Copilot CLI to provide intelligent repository analysis, professional documentation generation, and actionable improvement suggestions. It's designed to help developers quickly understand codebases, generate high-quality documentation, and identify opportunities for improvement—all through simple terminal commands.

## Table of Contents

- [Features](#features)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Usage](#usage)
- [Commands](#commands)
- [Examples](#examples)
- [How It Works](#how-it-works)
- [Requirements](#requirements)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Features

- 🔍 **Intelligent Analysis** — Uses GitHub Copilot CLI to provide context-aware repository analysis
- 📄 **Documentation Generation** — Creates professional README.md files automatically
- 💡 **Improvement Suggestions** — Identifies actionable recommendations across documentation, testing, and DevOps
- 👥 **Onboarding Guides** — Generates practical guides for new developers
- 🔐 **Security Reviews** — Analyzes repositories for security vulnerabilities and risks
- 🏥 **Health Reports** — Generates comprehensive project health scores and recommendations
- ⚡ **Lightweight** — Minimal dependencies, works on Windows, macOS, and Linux
- 🎯 **Repository Agnostic** — Works with any repository type (Python, JavaScript, Go, Java, etc.)

## Quick Start

### Prerequisites

Before using RepoSense, ensure you have:

1. **PowerShell** (5.0+ on Windows, or PowerShell Core 7.0+ on macOS/Linux)
2. **GitHub CLI** (`gh`) installed and configured
3. **GitHub Copilot CLI** access enabled in your GitHub account

Verify your setup:

```powershell
# Check PowerShell version
$PSVersionTable.PSVersion

# Check GitHub CLI
gh --version

# Check GitHub Copilot CLI
gh copilot --version

# Verify authentication
gh auth status
```

### Installation

1. **Clone the repository:**
   ```powershell
   git clone https://github.com/yourusername/reposense.git
   cd reposense
   ```

2. **Set PowerShell execution policy** (one-time setup):
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Verify the installation:**
   ```powershell
   .\reposense.ps1 explain .
   ```

## Installation

### Option 1: Direct from GitHub

```powershell
# Clone to your preferred location
git clone https://github.com/yourusername/reposense.git
cd reposense

# Set execution policy if needed
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Option 2: Add to PATH (Optional)

To use `reposense` from anywhere:

**Windows PowerShell:**
```powershell
$RepoSensePath = "C:\path\to\reposense"
$CurrentPath = [Environment]::GetEnvironmentVariable("PATH", "User")

if ($CurrentPath -notlike "*$RepoSensePath*") {
    [Environment]::SetEnvironmentVariable("PATH", "$CurrentPath;$RepoSensePath", "User")
}

# Restart PowerShell for changes to take effect
```

**macOS/Linux:**
```bash
# Create alias in ~/.zshrc or ~/.bash_profile
alias reposense='/path/to/reposense/reposense.ps1'

# Or add directory to PATH
export PATH="/path/to/reposense:$PATH"
```

## Usage

### Basic Syntax

```powershell
.\reposense.ps1 <command> [path]
```

- **command**: The analysis or generation task to perform (see [Commands](#commands))
- **path**: Target repository path (default: current directory)

### General Workflow

```powershell
# Navigate to RepoSense directory
cd reposense

# Run any command on a repository
.\reposense.ps1 explain /path/to/repo

# Redirect output to file
.\reposense.ps1 readme /path/to/repo > README.md
```

## Commands

### 1. `explain` — Comprehensive Repository Analysis

Analyzes a repository and provides a detailed explanation of its purpose, architecture, structure, and onboarding guidance.

```powershell
.\reposense.ps1 explain [path]
```

**Use when:** You need to quickly understand what a repository does and how it's organized.

**Output includes:**
- Project purpose and key goals
- Architecture and design patterns
- Directory structure and important files
- Technology stack
- How to set up and run the project
- Recommended starting points for new developers

**Example:**
```powershell
.\reposense.ps1 explain .
.\reposense.ps1 explain ./backend
.\reposense.ps1 explain C:\projects\my-app
```

---

### 2. `readme` — Generate Professional README

Generates a polished, well-structured README.md file suitable for publishing.

```powershell
.\reposense.ps1 readme [path]
```

**Use when:** You need to create or update a README for a project.

**Output includes:**
- Project overview and key features
- Installation instructions
- Quick start guide
- Usage documentation
- API or feature documentation
- Contribution guidelines
- License information

**Example:**
```powershell
# Print to terminal
.\reposense.ps1 readme .

# Save to file
.\reposense.ps1 readme . > README.md

# Generate README for a subdirectory
.\reposense.ps1 readme ./src > src/README.md
```

---

### 3. `suggest` — Improvement Recommendations

Analyzes a repository and provides prioritized, actionable suggestions for improvement.

```powershell
.\reposense.ps1 suggest [path]
```

**Use when:** You want to identify areas for improvement in documentation, testing, structure, and DevOps practices.

**Output includes:**
- Documentation gaps and improvements
- Testing opportunities and recommendations
- Structural improvements
- DevOps and CI/CD enhancements
- Prioritized by impact and effort

**Example:**
```powershell
.\reposense.ps1 suggest .
.\reposense.ps1 suggest ./api
```

---

### 4. `onboard` — Developer Onboarding Guide

Creates a practical, actionable guide for new developers to quickly become productive.

```powershell
.\reposense.ps1 onboard [path]
```

**Use when:** You need to help new team members get started quickly.

**Output includes:**
- What the project does
- High-level architecture
- Key directories and files
- Technology stack explanation
- Environment setup instructions
- How to run the project
- Recommended first contributions

**Example:**
```powershell
.\reposense.ps1 onboard .
.\reposense.ps1 onboard ./backend
```

---

### 5. `review` — Senior Engineer Code Review

Performs a comprehensive code review as a senior engineer would, evaluating quality, architecture, and maintainability.

```powershell
.\reposense.ps1 review [path]
```

**Use when:** You need expert feedback on code quality, architecture, and best practices.

**Output includes:**
- Code quality assessment
- Architecture review
- Testing gaps and recommendations
- Security concerns
- Maintainability evaluation
- Prioritized improvement recommendations

**Example:**
```powershell
.\reposense.ps1 review .
.\reposense.ps1 review ./src
```

---

### 6. `health` — Project Health Report

Generates a comprehensive health report with scoring across all project dimensions.

```powershell
.\reposense.ps1 health [path]
```

**Use when:** You need a high-level overview of your project's overall health and quality.

**Output includes:**
- Overall health score (0-100)
- Documentation quality score
- Testing coverage and strategy
- CI/CD pipeline maturity
- Project structure quality
- Dependency management assessment
- Security practices evaluation
- Key strengths and weaknesses
- Top recommendations

**Example:**
```powershell
.\reposense.ps1 health .
.\reposense.ps1 health ./backend
```

---

### 7. `security` — Security Analysis

Performs a focused security analysis to identify vulnerabilities and risk areas.

```powershell
.\reposense.ps1 security [path]
```

**Use when:** You need to assess and improve the security posture of your project.

**Output includes:**
- Hardcoded secrets detection
- Insecure configuration analysis
- Authentication and authorization patterns
- Unsafe dependency practices
- Exposed sensitive data risks
- Security vulnerabilities by severity
- Recommended fixes and best practices

**Example:**
```powershell
.\reposense.ps1 security .
.\reposense.ps1 security ./api
```

---

### 8. `generate-tests` — Testing Strategy & Scaffolding

Recommends a practical testing strategy and generates sample test cases.

```powershell
.\reposense.ps1 generate-tests [path]
```

**Use when:** You need guidance on testing strategy or want to bootstrap test suites.

**Output includes:**
- Testing strategy recommendation
- High-value modules to test first
- Suggested testing framework
- Test scaffolding and examples
- Test coverage recommendations

**Example:**
```powershell
.\reposense.ps1 generate-tests .
.\reposense.ps1 generate-tests ./src
```

---

## Examples

### Generate a README for This Project

```powershell
cd reposense
.\reposense.ps1 readme . > README.md
```

### Analyze a Node.js Project

```powershell
.\reposense.ps1 explain C:\projects\my-node-app
.\reposense.ps1 suggest C:\projects\my-node-app
```

### Security Review of a Python Project

```powershell
.\reposense.ps1 security /path/to/python-project
```

### Generate Onboarding for New Team Member

```powershell
.\reposense.ps1 onboard . > ONBOARDING.md
```

### Full Project Health Check

```powershell
.\reposense.ps1 health .
.\reposense.ps1 review .
.\reposense.ps1 suggest .
```

## How It Works

RepoSense is designed with elegant simplicity in mind:

```
┌─────────────────────────────────────────┐
│  You run: reposense readme ./src        │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  reposense.ps1 routes to proper command │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  Structured prompt sent to GitHub       │
│  Copilot CLI with repository context    │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  Copilot CLI analyzes repository and    │
│  generates intelligent, context-aware   │
│  response                               │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  Output displayed in terminal or piped  │
│  to file/downstream tools               │
└─────────────────────────────────────────┘
```

**Key Design Principle:** RepoSense doesn't implement static analyzers or code scanners. Instead, it acts as an intelligent orchestration layer that structures high-quality prompts and delegates analysis to GitHub Copilot CLI.

## Requirements

### Minimum Requirements

- **Operating System:** Windows, macOS, or Linux
- **PowerShell:** 5.0+ (Windows) or PowerShell Core 7.0+ (macOS/Linux)
- **GitHub CLI:** 2.0+ ([installation guide](https://github.com/cli/cli#installation))
- **GitHub Account:** With Copilot access enabled
- **Git:** For repository detection and context

### Verify Your Setup

```powershell
# PowerShell version
$PSVersionTable.PSVersion

# GitHub CLI version
gh --version

# GitHub Copilot CLI
gh copilot --version

# GitHub authentication
gh auth status
```

### Network Requirements

- Stable internet connection (required for GitHub Copilot API calls)
- GitHub API access (typically through corporate firewalls allows this)
- Response times: 30-120 seconds depending on repository size and Copilot load

## Troubleshooting

### "gh copilot" command not found

**Problem:** GitHub Copilot CLI is not installed or accessible.

**Solution:**
```powershell
# Verify GitHub CLI is installed
gh --version

# Update GitHub CLI to latest version
# Visit https://github.com/cli/cli#installation for your OS

# Verify Copilot CLI is available
gh copilot --version
```

### PowerShell execution policy error

**Problem:** `cannot be loaded because running scripts is disabled on this system`

**Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### GitHub authentication error

**Problem:** `Not authenticated. Please run 'gh auth login' first`

**Solution:**
```powershell
# Log in to GitHub
gh auth login

# Verify authentication
gh auth status

# Test with a simple command
gh repo list
```

### Copilot CLI timing out

**Problem:** Command runs slowly or times out after 30+ seconds.

**Solutions:**
- Ensure stable internet connection
- Try targeting a specific subdirectory instead of large repositories
- Verify Copilot access: `gh copilot --version`
- Check GitHub status: https://www.githubstatus.com

### Path issues on Windows

**Problem:** Path not found or invalid path error

**Solution:** Use absolute paths or relative paths carefully:
```powershell
# Use absolute paths with backslashes (Windows)
.\reposense.ps1 explain C:\projects\my-app

# Or use relative paths from current directory
cd C:\projects\my-app
.\reposense.ps1 explain .

# Don't mix path styles
# ❌ Wrong: .\reposense.ps1 explain C:/projects/my-app
# ✅ Right: .\reposense.ps1 explain C:\projects\my-app
```

### Interactive Mode Issues

**Problem:** Copilot CLI gets stuck waiting for input

**Solution:**
- Ensure you have stable internet connectivity
- Check GitHub account permissions
- Try from a different machine or network
- Verify Copilot subscription is active

## Contributing

We welcome contributions from the community! Whether it's bug fixes, feature requests, or documentation improvements, please follow these guidelines.

### Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork:**
   ```powershell
   git clone https://github.com/YOUR_USERNAME/reposense.git
   cd reposense
   ```
3. **Create a feature branch:**
   ```powershell
   git checkout -b feature/your-feature-name
   ```
4. **Make your changes** following the guidelines below

### Code Guidelines

**PowerShell Style:**
- Use PascalCase for function and parameter names
- Use descriptive variable names (avoid $x, $y, etc.)
- Include comments for complex logic only
- Follow [PowerShell Best Practices](https://docs.microsoft.com/en-us/powershell/scripting/community/contributing/style-guide)

**Example:**
```powershell
param (
    [Parameter(Mandatory = $true)]
    [string]$Command,
    
    [string]$Path = "."
)

# Descriptive variable names
$repositoryPath = Resolve-Path $Path
$copilotCommand = "Analyze the repository..."

Write-Output "Starting analysis..."
```

### Development Workflow

**Adding a New Command:**

1. Add a new switch case in `reposense.ps1`:
   ```powershell
   "newcommand" {
       gh copilot -i "Your detailed, specific prompt here..."
   }
   ```

2. Update the usage text in the `default` case

3. Test with multiple repository types:
   ```powershell
   .\reposense.ps1 newcommand .
   .\reposense.ps1 newcommand ./src
   .\reposense.ps1 newcommand C:\path\to\repo
   ```

4. Document the command in README.md with examples

### Testing Before Submission

```powershell
# Test with RepoSense itself
.\reposense.ps1 explain .

# Test with different paths
.\reposense.ps1 yourcommand ./subdir
.\reposense.ps1 yourcommand C:\absolute\path

# Verify no syntax errors
Test-Path .\reposense.ps1

# Test help/unknown command
.\reposense.ps1 invalid-command
```

### Commit and PR Process

1. **Commit with clear messages:**
   ```powershell
   git add .
   git commit -m "feat: add new-command for better analysis"
   ```

2. **Push to your fork:**
   ```powershell
   git push origin feature/your-feature-name
   ```

3. **Create a Pull Request** on GitHub with:
   - Clear description of changes
   - Why this change is needed
   - Testing performed
   - Link to related issues

4. **Ensure all tests pass** and code review feedback is addressed

### Types of Contributions

**Easy (Good First Issues):**
- Documentation improvements
- Adding usage examples
- Fixing typos in README or comments
- Improving error messages

**Medium:**
- Adding command aliases or shortcuts
- Enhancing output formatting
- Improving error handling
- Adding configuration options

**Advanced:**
- New major commands following established patterns
- Interactive mode implementation
- Output filtering or formatting options
- Integration with other tools

### Questions or Need Help?

- **Open an issue** on GitHub for bugs or feature requests
- **Review existing issues** — your question might already be answered
- **Check documentation** — README.md covers most scenarios
- **Examine reposense.ps1** — the main script is small and readable

## License

RepoSense is licensed under the MIT License. See the LICENSE file for details.

---

## Additional Resources

- **[GitHub Copilot CLI Documentation](https://docs.github.com/en/copilot)** — Official documentation
- **[GitHub CLI Installation](https://github.com/cli/cli#installation)** — Setup guide
- **[PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)** — Language reference
- **[DESIGN.md](./DESIGN.md)** — Technical design contract
- **[ONBOARDING.md](./ONBOARDING.md)** — Developer onboarding guide

---

**Made with ❤️ by the RepoSense community**
