param (
    [Parameter(Mandatory = $true)]
    [string]$Command,

    [string]$Path = "."
)

Write-Output "RepoSense - GitHub Copilot CLI powered repository assistant"
Write-Output "------------------------------------------------------------"
Write-Output "Target path: $Path"
Write-Output ""

switch ($Command) {
    "explain" {
        gh copilot -i "Explain the repository located at '$Path'. Cover its purpose, structure, key components, and how a new developer should get started."
    }
    "readme" {
        gh copilot -i "Generate a professional README.md for the repository located at '$Path'. Include overview, setup, usage, and contribution guidelines."
    }
    "suggest" {
        gh copilot -i "Analyze the repository at '$Path' and suggest improvements focusing on documentation, testing, structure, and DevOps best practices."
    }
    "onboard" {
        gh copilot -i "Analyze the repository located at '$Path' and create a practical onboarding guide for a new developer. Include: what the project does, high-level architecture, key directories, important files to read first, technology stack, how to run the project, and recommended starting points for contributors."
    }
    "review" {
        gh copilot -i "Review the repository located at '$Path' as if you were a senior engineer performing a code review. Focus on code quality, architecture issues, testing gaps, security concerns, maintainability, and prioritized recommendations."
    }
    "health" {
        gh copilot -i "Analyze the repository located at '$Path' and generate a project health report. Evaluate documentation, testing, CI/CD, project structure, dependency management, and security practices. Give a score out of 100 and explain strengths, weaknesses, and top recommendations."
    }
    default {
        Write-Output "Unknown command: $Command"
        Write-Output ""
        Write-Output "Usage:"
        Write-Output "  reposense explain [path]"
        Write-Output "  reposense readme [path]"
        Write-Output "  reposense suggest [path]"
        Write-Output "  reposense onboard [path]"
        Write-Output "  reposense review [path]"
        Write-Output "  reposense health [path]"
    }
}