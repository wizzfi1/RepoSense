# RepoSense

A lightweight CLI tool that harnesses the power of GitHub Copilot CLI to provide intelligent repository analysis and documentation generation. RepoSense helps developers understand codebases, generate professional documentation, and identify improvement opportunities.

## Overview

RepoSense is a script-based CLI wrapper around GitHub Copilot CLI, designed to streamline repository analysis and documentation tasks. It provides three key commands to help teams work more effectively with their codebases:

## Why RepoSense?

Understanding an unfamiliar repository often involves:
- Manually reading files
- Guessing architecture
- Writing documentation from scratch
- Identifying gaps through trial and error

RepoSense compresses that workflow into a few terminal commands by leveraging
GitHub Copilot CLI as an interactive analysis engine.

## Built with GitHub Copilot CLI

RepoSense is intentionally built **around** GitHub Copilot CLI.

Rather than re-implementing static analyzers or repository scanners, RepoSense
acts as a lightweight orchestration layer that:

- Structures high-quality prompts
- Delegates analysis to GitHub Copilot CLI
- Presents Copilot’s output in a consistent, repeatable workflow

This approach treats Copilot as a **development partner**, not just a background tool.


- **Explain**: Get comprehensive analysis of repository purpose, architecture, and structure
- **README**: Auto-generate professional README documentation
- **Suggest**: Receive prioritized, actionable improvement recommendations

## Prerequisites

- **PowerShell**: Windows PowerShell 5.0+ or PowerShell Core 7.0+
- **GitHub Copilot CLI**: Must be installed and authenticated with `gh copilot`
- **Git**: For repository detection and context

Verify installation:
```powershell
gh copilot --version
```
> Note: RepoSense does not call GitHub APIs directly. All intelligence is provided
> through GitHub Copilot CLI.

## Installation

1. Clone or download the repository:
```bash
git clone <repository-url>
cd reposense
```

2. Make the script executable (if needed):
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Usage

RepoSense provides three main commands, each targeting a specific repository path:

### Command: `explain`

Analyzes a repository and provides a comprehensive explanation covering its purpose, architecture, structure, and onboarding guidance.

**Syntax:**
```powershell
.\reposense.ps1 explain [path]
```

**Parameters:**
- `explain`: Command to execute (required)
- `path`: Repository path to analyze (default: `.`)

**Examples:**
```powershell
# Analyze current directory
.\reposense.ps1 explain

# Analyze specific directory
.\reposense.ps1 explain ./src

# Analyze remote repository context
.\reposense.ps1 explain ./backend
```

### Command: `readme`

Generates a professional, well-structured README.md file for any repository. Output can be displayed in terminal or redirected to a file.

**Syntax:**
```powershell
.\reposense.ps1 readme [path]
```

**Parameters:**
- `readme`: Command to execute (required)
- `path`: Repository path for README generation (default: `.`)

**Examples:**
```powershell
# Generate and display README for current directory
.\reposense.ps1 readme

# Generate README for specific path
.\reposense.ps1 readme ./myproject

# Generate and save to file
.\reposense.ps1 readme . > README.md
```

### Command: `suggest`

Analyzes a repository and provides prioritized, actionable recommendations across documentation, testing, structure, and DevOps practices.

**Syntax:**
```powershell
.\reposense.ps1 suggest [path]
```

**Parameters:**
- `suggest`: Command to execute (required)
- `path`: Repository path to analyze (default: `.`)

**Examples:**
```powershell
# Get suggestions for current repository
.\reposense.ps1 suggest

# Get suggestions for specific component
.\reposense.ps1 suggest ./frontend

# Get suggestions and save to file
.\reposense.ps1 suggest . | Out-File suggestions.txt
```

## How It Works

RepoSense operates as an intelligent CLI wrapper that:

1. **Accepts Commands**: Takes user input for the desired analysis type
2. **Delegates to Copilot**: Passes focused, task-specific prompts to GitHub Copilot CLI, allowing Copilot
to explore the repository and generate context-aware responses directly from the terminal.
3. **Delivers Results**: Outputs structured, AI-powered analysis to the terminal

The tool was designed collaboratively with GitHub Copilot CLI to provide a seamless interface for repository analysis without requiring direct interaction with underlying APIs.

## Output Examples

### Explain Command Output
Provides:
- Repository purpose and goals
- Architecture overview
- Key components and modules
- Technology stack
- Setup and onboarding guide

### README Command Output
Generates sections including:
- Project overview and description
- Features and capabilities
- Prerequisites and dependencies
- Installation instructions
- Usage guide and examples
- Contribution guidelines
- License information

### Suggest Command Output
Recommendations cover:
- Documentation gaps and improvements
- Testing strategy and coverage
- Code structure optimizations
- CI/CD and DevOps enhancements
- Best practices and standards

## Configuration

RepoSense requires minimal configuration. Ensure your environment has:

1. **PowerShell Execution Policy** set to allow script execution
2. **GitHub Copilot CLI** installed and authenticated
3. **Read access** to the target repository

## Troubleshooting

### "gh copilot" command not found
- **Solution**: Ensure GitHub CLI is installed and updated
- Run: `gh --version` to verify installation
- Install/update: `https://github.com/cli/cli#installation`

### Authentication errors
- **Solution**: Authenticate with GitHub Copilot CLI
- Run: `gh auth login` to set up authentication

### Permission denied on script execution
- **Solution**: Update PowerShell execution policy
- Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### No output or timeout
- **Solution**: GitHub Copilot CLI requests may take 30+ seconds
- Ensure your internet connection is active
- Try targeting a specific path instead of the root directory

## Contributing

We welcome contributions! Please follow these guidelines:

### Getting Started
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes following the guidelines below
4. Test your changes thoroughly
5. Commit with clear, descriptive messages
6. Push to your fork and submit a pull request

### Code Guidelines
- **PowerShell Style**: Follow [PowerShell Best Practices](https://docs.microsoft.com/en-us/powershell/scripting/community/contributing/style-guide)
- **Naming**: Use clear, descriptive parameter and variable names
- **Comments**: Include comments for complex logic
- **Error Handling**: Implement proper error handling and validation
- **Documentation**: Update README.md for new features or commands

### Types of Contributions
- **Bug Reports**: Open an issue with reproduction steps and environment details
- **Feature Requests**: Describe the feature and use case
- **Improvements**: Suggest optimizations, refactoring, or documentation enhancements
- **Documentation**: Improve README, add examples, or clarify existing documentation

### Pull Request Process
1. Ensure all existing functionality still works
2. Test with multiple repository types
3. Update documentation to reflect changes
4. Provide clear description of changes in PR
5. Link any related issues

## Design Philosophy

RepoSense was designed with these principles in mind:

- **Simplicity**: Minimal setup, maximum value
- **Accessibility**: Works with any repository type
- **Intelligence**: Leverages AI for meaningful analysis
- **Transparency**: Clear, understandable output
- **Extensibility**: Easy to add new commands or capabilities

See [DESIGN.md](DESIGN.md) for detailed technical design documentation.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions, issues, or feedback:
- Open an issue on GitHub
- Check existing documentation and issues for solutions
- Provide detailed context including command used and output

## Roadmap
These items are intentionally out of scope for the current MVP and listed as future ideas only.

Future enhancements may include:
- Support for additional languages and frameworks
- Integration with more code analysis tools
- Custom analysis templates
- Batch processing for multiple repositories
- Web interface for repository analysis

## Related Links

- [GitHub Copilot CLI Documentation](https://docs.github.com/en/copilot)
- [GitHub CLI Installation](https://github.com/cli/cli#installation)
- [PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)



