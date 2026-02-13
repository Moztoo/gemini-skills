# Commit Message Best Practices (Conventional Commits)

This guide outlines the Conventional Commits specification, a lightweight convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history, which makes it easier to write automated tools on top of.

## Format

The basic format is:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Type

The `type` must be one of the following:

*   **feat**: A new feature for the user.
*   **fix**: A bug fix for the user.
*   **docs**: Documentation only changes.
*   **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
*   **refactor**: A code change that neither fixes a bug nor adds a feature.
*   **perf**: A code change that improves performance.
*   **test**: Adding missing tests or correcting existing tests.
*   **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm).
*   **ci**: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs).
*   **chore**: Other changes that don't modify `src` or `test` files.
*   **revert**: Reverts a previous commit.

### Description

The description is a short summary of the code changes.

*   Use the imperative, present tense: "change" not "changed" nor "changes".
*   Don't capitalize the first letter.
*   No dot (.) at the end.

### Body (Optional)

The body should provide more context for the change.

*   Use it to explain *what* and *why* vs. *how*.
*   Separate from the subject line with a blank line.

### Breaking Change (Optional)

A commit that has a footer `BREAKING CHANGE:` or appends a `!` after the type/scope, introduces a breaking API change. A BREAKING CHANGE can be part of any type.

## Examples

### Commit with `feat` type
```
feat: allow provided config object to extend other configs
```

### Commit with `fix` type and scope
```
fix(api): correct handling of null values
```

### Commit with `!` to indicate a breaking change
```
refactor!: drop support for Node 6
```

### Commit with `BREAKING CHANGE` footer
```
refactor: drop support for Node 6

BREAKING CHANGE: Refactor to use JavaScript features not available in Node 6.
```

### Commit with both a body and a breaking change
```
feat(lang): add polish language

The new language is available to all clients.

BREAKING CHANGE: The `language` parameter is now required.
```
