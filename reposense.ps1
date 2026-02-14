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
    default {
        Write-Output "Unknown command: $Command"
        Write-Output "Usage:"
        Write-Output "  reposense explain [path]"
        Write-Output "  reposense readme [path]"
        Write-Output "  reposense suggest [path]"
    }
}
