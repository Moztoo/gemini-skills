# GitHub CLI (`gh`) Setup Guide

This guide provides instructions for installing and authenticating the official GitHub CLI tool, `gh`. This tool is required for scripts that interact with the GitHub API, such as creating repositories.

## Installation

Follow the instructions for your operating system.

### macOS

Using [Homebrew](https://brew.sh/):
```bash
brew install gh
```

### Windows

Using [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/):
```powershell
winget install GitHub.cli
```
Using [Chocolatey](https://chocolatey.org/):
```powershell
choco install gh
```

### Linux (Debian, Ubuntu, Raspberry Pi OS)

```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```

For other Linux distributions, see the [official installation instructions](https://github.com/cli/cli#installation).

## Authentication

Once `gh` is installed, you need to authenticate with your GitHub account.

1.  Run the following command in your terminal:
    ```bash
    gh auth login
    ```

2.  The CLI will ask you a few questions:
    *   **What account do you want to log into?** Select `GitHub.com`.
    *   **What is your preferred protocol for Git operations?** Select `SSH`.
    *   **Generate a new SSH key or upload an existing one?** If you don't have an SSH key for this machine, let it generate a new one for you.
    *   **How would you like to authenticate?** Select `Login with a web browser`.

3.  It will give you a one-time code and open a browser window. Paste the code into the browser to authorize the CLI.

After these steps, the `gh` CLI will be ready to use.
