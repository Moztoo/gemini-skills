---
name: git-assistant
description: An assistant to manage Git repositories, perform common operations like commit and push, and provide guidance on best practices, including initial remote repository setup on GitHub. Use for tasks involving git, commits, branches, and GitHub repository management.
---

# Git Assistant Skill

This skill helps manage Git repositories by automating common workflows like committing, pushing, and setting up remote repositories on GitHub.

## Core Workflow: Assisting with Commits and Pushes

This is the primary workflow for when a user wants to save and upload their work.

**User's Goal:** "I've finished my changes, help me commit and push them."

### 1. Check Git Status
Always start by checking the status of the repository to understand which files have been modified, staged, or are untracked.

Use the `get-git-status.sh` script for a concise, machine-readable output.
```bash
bash scripts/get-git-status.sh
```
The output is from `git status --porcelain=v1`. For example, `M  README.md` means README.md is modified but not staged. `A  src/new.py` means `src/new.py` is a new, staged file.

### 2. Stage Files
If there are modified files that are not staged, ask the user which files they want to include in the commit.
```bash
git add <file1> <file2> ...
```

### 3. Generate a Commit Message
A good commit message is crucial.

- **Analyze the diff:** Look at the staged changes using `git diff --staged`.
- **Consult best practices:** Use the `references/commit-best-practices.md` guide to structure the message.
- **Propose a message:** Based on the changes and the guide, propose a commit message to the user. For example: `feat(api): add new /health endpoint`.
- **Confirm with user:** Always confirm the proposed message before committing.

### 4. Perform the Commit
Once the message is approved, run the commit command.
```bash
git commit -m "feat(api): add new /health endpoint"
```

### 5. Push to Remote
Attempt to push the changes to the remote repository.
```bash
git push
```

### 6. Handle "No Remote" Error (Crucial)
This is a common failure point. If `git push` fails with an error like `fatal: No configured push destination`, it means the local repository is not connected to a remote one.

**This is the key guidance section of the skill:**

1.  **Inform the user:** Explain that the push failed because no remote repository is configured.
2.  **Offer a solution:** Ask if they would like you to create a new repository on their GitHub account and link it.
3.  **Check for `gh` CLI:** Before proceeding, check if the `gh` command is available (`command -v gh`).
    *   **If `gh` is NOT installed:** Inform the user that the GitHub CLI (`gh`) is needed. Explain its purpose (to create repos from the command line) and ask if they want you to guide them through the installation. If they agree, **read the instructions from `references/github-cli-setup.md`** and present them to the user. Do not proceed until `gh` is installed and authenticated.
    *   **If `gh` is installed:** Proceed to the next step.
4.  **Get Repository Name:** Ask the user for a name for the new GitHub repository. A good default is the name of the current directory.
5.  **Run the script:** Execute the `create-github-repo.sh` script with the chosen repository name.
    ```bash
    bash scripts/create-github-repo.sh <repo-name>
    ```
6.  **Confirm Success:** The script will create the repo, add it as the `origin` remote, and perform the initial push. The script's output will confirm success. Relay this to the user.

## Other Guidance

- For general questions about Git best practices (branching, merging, etc.), you can also consult `references/commit-best-practices.md` to inform your answers.
