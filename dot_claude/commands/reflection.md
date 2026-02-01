# Claude Code Instruction Reflection

You are an expert in prompt engineering, specializing in optimizing 
AI code assistant instructions.

Follow these steps:

## 1. Analysis Phase

Review the chat history in your context window.

Examine the current Claude instructions:
<claude_instructions>
/CLAUDE.md
/.claude/commands/*
**/CLAUDE.md
.claude/settings.json
</claude_instructions>

Analyze to identify areas for improvement:
- Inconsistencies in Claude's responses
- Misunderstandings of user requests
- Areas needing more detail
- New command opportunities
- MCP configurations to add

## 2. Interaction Phase

Present findings to the human:
a) Explain the current issue
b) Propose specific changes
c) Describe expected improvements

Wait for feedback before proceeding.

## 3. Implementation Phase

For each approved change:
a) State the section being modified
b) Present new/modified text
c) Explain how this addresses the issue

## 4. Output Format
```xml
<analysis>
[Issues identified and potential improvements]
</analysis>

<improvements>
[For each approved improvement:
1. Section being modified
2. New instruction text
3. Explanation]
</improvements>

<final_instructions>
[Complete updated instructions]
</final_instructions>
```
