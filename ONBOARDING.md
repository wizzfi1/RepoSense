# RepoSense Developer Onboarding Guide

Welcome to RepoSense! This guide will help you quickly understand the project and get ready to contribute.

## What is RepoSense?

**RepoSense** is a lightweight CLI tool that harnesses GitHub Copilot CLI to provide intelligent repository analysis and documentation generation. It helps developers understand codebases, generate professional documentation, and identify improvement opportunities—all through simple terminal commands.

Think of it as a smart assistant that uses AI to answer questions about repositories, generate docs, and provide improvement suggestions.

## High-Level Architecture

RepoSense follows a simple, elegant architecture:

```
┌─────────────────────────────────────────────────────┐
│              User Terminal / PowerShell              │
│         (runs reposense.ps1 with a command)         │
└─────────────────┬───────────────────────────────────┘
                  │
                  │ delegates to
                  ▼
┌─────────────────────────────────────────────────────┐
│         reposense.ps1 (Main Script)                 │
│  - Accepts commands (explain, readme, suggest, etc) │
│  - Routes to appropriate GitHub Copilot CLI prompt  │
│  - Formats and displays results                     │
└─────────────────┬───────────────────────────────────┘
                  │
                  │ calls with structured prompts
                  ▼
┌─────────────────────────────────────────────────────┐
│      GitHub Copilot CLI (gh copilot -i)            │
│  - Receives focused, task-specific prompts          │
│  - Analyzes the target repository                   │
│  - Generates intelligent, context-aware responses   │
└─────────────────────────────────────────────────────┘
```

**Key Design Principle**: RepoSense is intentionally lightweight. It doesn't implement static analyzers or code scanners. Instead, it acts as an orchestration layer that structures high-quality prompts and delegates analysis to GitHub Copilot CLI.

## Key Directories & Files

```
reposense/
├── reposense.ps1          # Main entry point (CRITICAL - read first!)
├── README.md              # User-facing documentation
├── DESIGN.md              # Technical design contract
├── ONBOARDING.md          # This file
└── .git/                  # Version control history
```

### File Descriptions

| File | Purpose |
|------|---------|
| **reposense.ps1** | The core script that handles all CLI commands. Contains the command routing logic and prompt templates. |
| **README.md** | Complete user documentation covering installation, usage, troubleshooting, and contribution guidelines. |
| **DESIGN.md** | Technical design document defining the CLI contract and command specifications. |
| **ONBOARDING.md** | This file—your guide to getting started as a contributor. |

## Technology Stack

- **PowerShell**: Core scripting language (Windows PowerShell 5.0+ or PowerShell Core 7.0+)
- **GitHub Copilot CLI**: The intelligence engine (`gh copilot -i` command)
- **GitHub CLI (gh)**: Provides the Copilot integration
- **Git**: For version control and repository detection

**Why PowerShell?**
- Cross-platform (Windows, macOS, Linux via PowerShell Core)
- Lightweight scripting
- Native integration with GitHub CLI
- No external dependencies required

## How to Run the Project

### Prerequisites

Before you can run RepoSense, ensure you have:

```powershell
# 1. Verify PowerShell version
$PSVersionTable.PSVersion

# 2. Check GitHub CLI is installed
gh --version

# 3. Verify GitHub Copilot CLI access
gh copilot --version

# 4. Ensure you're authenticated with GitHub
gh auth status
```

### Running Commands

```powershell
# Navigate to the reposense directory
cd reposense

# Set execution policy (one-time setup)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Run any command:
.\reposense.ps1 explain .              # Analyze current repository
.\reposense.ps1 readme ./src            # Generate README for src directory
.\reposense.ps1 suggest .               # Get improvement suggestions
.\reposense.ps1 onboard .               # Get onboarding guidance
```

## Available Commands

RepoSense provides six main commands:

### 1. `explain`
Analyzes a repository and provides comprehensive explanation covering its purpose, architecture, structure, and onboarding guidance.
```powershell
.\reposense.ps1 explain [path]
```

### 2. `readme`
Generates a professional, well-structured README.md file for any repository.
```powershell
.\reposense.ps1 readme [path] > README.md
```

### 3. `suggest`
Analyzes a repository and provides prioritized, actionable recommendations across documentation, testing, structure, and DevOps practices.
```powershell
.\reposense.ps1 suggest [path]
```

### 4. `onboard`
Creates a practical onboarding guide for new developers covering project purpose, architecture, directories, technology stack, setup, and contribution starting points.
```powershell
.\reposense.ps1 onboard [path]
```

### 5. `review`
Reviews a repository as a senior engineer would, focusing on code quality, architecture, testing, security, and maintainability.
```powershell
.\reposense.ps1 review [path]
```

### 6. `health`
Generates a comprehensive project health report with scores and recommendations across all aspects of a project.
```powershell
.\reposense.ps1 health [path]
```

## Recommended Starting Points for Contributors

### Phase 1: Understand the Project
1. **Read README.md** — User perspective on what RepoSense does and how to use it
2. **Read DESIGN.md** — Technical design contract and command specifications
3. **Read reposense.ps1** — See exactly how commands are implemented
4. **Try the tool** — Run it on a test repository to see how it works
   ```powershell
   .\reposense.ps1 explain .
   ```

### Phase 2: Environment Setup
1. Fork the repository on GitHub
2. Clone to your local machine:
   ```powershell
   git clone https://github.com/<your-username>/reposense.git
   cd reposense
   ```
3. Create a feature branch for your work:
   ```powershell
   git checkout -b feature/your-feature-name
   ```

### Phase 3: Contribute

**Easy Starting Contributions:**
- Add new command variations or improve prompt templates
- Enhance error handling and validation
- Improve documentation with examples
- Add troubleshooting guides for common issues
- Create test scenarios and validation examples

**Medium Contributions:**
- Refactor command handling logic
- Improve output formatting or presentation
- Add command aliases or shortcuts
- Enhance configuration options

**Larger Contributions:**
- Add new major commands following the established pattern
- Implement interactive mode
- Add output filtering or formatting options
- Create integration with other GitHub tools

### Phase 4: Testing & Validation

Test your changes with different repositories and command variations:

```powershell
# Test with RepoSense itself
.\reposense.ps1 explain .

# Test with another public repository
.\reposense.ps1 explain C:\path\to\other\repo

# Verify help text works
.\reposense.ps1 invalid-command  # Should show usage info
```

## Code Guidelines

When contributing to RepoSense, follow these principles:

### PowerShell Style
- Use PascalCase for function and parameter names
- Use descriptive variable names (avoid $x, $y, etc.)
- Include comments for complex logic
- Follow [PowerShell Best Practices](https://docs.microsoft.com/en-us/powershell/scripting/community/contributing/style-guide)

### Error Handling
- Validate command-line arguments
- Provide clear error messages
- Suggest solutions in error output
- Test edge cases (invalid paths, missing dependencies, etc.)

### Documentation
- Update README.md for new commands
- Include usage examples
- Document any new parameters or options
- Explain the "why" behind features, not just "what"

### Pull Request Process
1. Ensure all existing functionality still works
2. Test with multiple repository types
3. Update documentation to reflect changes
4. Provide clear description of changes in PR
5. Link any related issues

## Common Workflows

### Adding a New Command

1. **Add switch case in reposense.ps1**:
   ```powershell
   "newcommand" {
       gh copilot -i "Your detailed prompt here..."
   }
   ```

2. **Update usage text** in the default case

3. **Document in README.md** with examples

4. **Test thoroughly** with different repositories

### Testing Your Changes

```powershell
# Test with current directory
.\reposense.ps1 yourcommand .

# Test with specific path
.\reposense.ps1 yourcommand ./subdirectory

# Check for syntax errors before running
Test-Path .\reposense.ps1
```

## Key Resources

- **[GitHub Copilot CLI Docs](https://docs.github.com/en/copilot)** — Understanding how the underlying tool works
- **[GitHub CLI Installation](https://github.com/cli/cli#installation)** — Setting up gh CLI
- **[PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)** — PowerShell language reference
- **[git Documentation](https://git-scm.com/doc)** — Version control basics

## Troubleshooting for Developers

### "gh copilot" command not found
```powershell
# Ensure GitHub CLI is installed
gh --version

# Update if needed
# Visit https://github.com/cli/cli#installation
```

### PowerShell execution policy errors
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### GitHub authentication issues
```powershell
gh auth login
gh auth status
```

### Copilot CLI not responding
- GitHub Copilot CLI requests can take 30+ seconds
- Ensure stable internet connection
- Try targeting a specific path instead of root directory
- Check that you have Copilot access in your GitHub account

## Getting Help

- **Open an issue** — Report bugs or ask questions on GitHub
- **Review existing issues** — Your question might already be answered
- **Check documentation** — README.md covers most common scenarios
- **Examine existing code** — The main script is small and well-commented

## Project Principles

RepoSense was designed with these core principles:

1. **Simplicity** — Minimal setup, maximum value
2. **Accessibility** — Works with any repository type
3. **Intelligence** — Leverages AI for meaningful analysis
4. **Transparency** — Clear, understandable output
5. **Extensibility** — Easy to add new commands or capabilities

Keep these in mind when making contributions.

## Next Steps

1. ✅ Read this guide completely
2. 📖 Review README.md for user perspective
3. 💻 Set up your development environment
4. 🧪 Run RepoSense on a test repository
5. 🔍 Read reposense.ps1 to understand the code
6. 🚀 Start with a small contribution (documentation improvement, etc.)
7. 📝 Open a PR with your changes

Welcome to the RepoSense community! We're excited to have you contributing. 🎉
