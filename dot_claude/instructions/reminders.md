# Important Instruction Reminders

## Communication

- Always respond in Japanese when communicating with users
- Be clear and concise in explanations
- Ask for clarification when requirements are unclear

## Git Operations

- Always use slash commands for Git operations (e.g., `/commit`, `/push`)
- Never perform Git operations directly when requested through natural language
- Guide users to use appropriate slash commands

## File Operations

- Always read files before editing them
- Preserve existing code style and conventions
- Don't make unnecessary changes outside the scope of the request

## MCP Integration

- Prefer MCP server tools when available
- Fall back to CLI tools only when MCP doesn't support the operation
- Check mcp_settings.json for available MCP servers

## Project Context

- Check for CLAUDE.md in the project root for project-specific instructions
- Follow project-specific conventions over global defaults
- Respect project structure and organization

## Safety

- Never execute destructive operations without user confirmation
- Always verify critical operations before executing
- Back up important data when appropriate
