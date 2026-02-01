# Git Push

YOU MUST: Follow the Git guidelines defined in @../../instructions/git.md

YOU MUST: Use Git MCP server tools for all Git operations when available.

YOU MUST: Only use command line Git operations for functions not supported by the Git MCP server.

Execute the following workflow:

1. Check current git status and branch information
2. Verify that there are commits to push
3. **DISPLAY PUSH CONFIRMATION** - Present the following information to the user for confirmation:
   - **Current Branch**: Show the current branch name
   - **Remote**: Show the remote repository name (usually 'origin')
   - **Commits to push**: List commits that will be pushed (with commit messages)
   - **Warning**: If pushing to main/master branch, show extra warning
4. **WAIT FOR USER CONFIRMATION** - Ask user to confirm before proceeding with the push
5. Execute git push command
6. Verify push was successful

## Push Safety Guidelines

YOU MUST: Always verify the target branch before pushing
YOU MUST: Show the list of commits that will be pushed
NEVER: Force push to main/master without explicit user confirmation
NEVER: Push without showing what will be pushed

## Force Push Warning

If the user requests force push (--force or --force-with-lease):

YOU MUST: Display a prominent warning about the risks
YOU MUST: Require explicit confirmation
YOU MUST: Never force push to main/master unless absolutely necessary and explicitly confirmed

## Examples

- Normal push: `git push origin <branch-name>`
- First push: `git push -u origin <branch-name>`
- Force push (with confirmation): `git push --force-with-lease origin <branch-name>`
