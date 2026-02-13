#!/bin/bash
#-*--
#_ver=20240307_193503
#_bas=create-github-repo
#
# create a new public github repository and output the ssh url
#
#_usage[0]="<repo-name>"
#

set -e

REPO_NAME=$1

if ! command -v gh &> /dev/null
then
    echo "ERROR: The 'gh' CLI is not installed. Please install it to use this script."
    echo "See reference 'github-cli-setup.md' for instructions."
    exit 1
fi

if [ -z "$REPO_NAME" ]
then
      echo "ERROR: Repository name is required."
      echo "Usage: $0 <repo-name>"
      exit 1
fi

# Create a public repo and capture the output
gh repo create "$REPO_NAME" --public --source=. --remote=origin

# Get the SSH URL of the newly created repo
SSH_URL=$(gh repo view "$REPO_NAME" --json sshUrl -q .sshUrl)

echo "SUCCESS: Created repository '$REPO_NAME' on GitHub."
echo "REMOTE_URL: $SSH_URL"
