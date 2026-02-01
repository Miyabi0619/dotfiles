# Code Quality Guidelines

## General Principles

- Write clean, readable, and maintainable code
- Follow the principle of least surprise
- Prefer composition over inheritance
- Keep functions small and focused on a single responsibility

## Code Style

- Follow the existing code style in the project
- Use meaningful variable and function names
- Avoid magic numbers - use named constants
- Comment only when necessary to explain "why", not "what"

## Error Handling

- Handle errors explicitly
- Provide meaningful error messages
- Fail fast and loudly in development
- Log errors appropriately

## Testing

- Write tests for critical functionality
- Maintain good test coverage
- Keep tests simple and focused
- Use descriptive test names

## Performance

- Optimize only when necessary
- Profile before optimizing
- Document performance-critical sections
- Balance performance with code clarity

## Security

- Never commit sensitive data (API keys, passwords, etc.)
- Validate and sanitize user input
- Follow security best practices for the language/framework
- Keep dependencies up to date
