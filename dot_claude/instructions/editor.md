# Editor Configuration

## General Principles

- Respect existing editor configuration files
- Maintain consistency with project settings
- Use EditorConfig when available

## Common Settings

- Use spaces for indentation (2 or 4 spaces depending on language)
- UTF-8 encoding
- LF line endings (except for Windows-specific files)
- Trim trailing whitespace
- Insert final newline

## Language-Specific Settings

### JavaScript/TypeScript
- 2 spaces indentation
- Semicolons preferred
- Single quotes for strings

### Python
- 4 spaces indentation
- Follow PEP 8

### Go
- Use gofmt
- Tabs for indentation

### Rust
- Use rustfmt
- 4 spaces indentation

### Shell Scripts
- 2 spaces indentation
- Use shellcheck for validation
