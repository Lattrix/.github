# Contributing to LATTRIX

Thank you for considering contributing to LATTRIX! This document provides guidelines and instructions for contributing.

## Getting Started

1. **Fork** the repository
2. **Clone** your fork: `git clone https://github.com/YOUR_USERNAME/repo.git`
3. **Create a branch**: `git checkout -b feature/your-feature`
4. **Make changes** and test thoroughly
5. **Commit** with clear messages
6. **Push** to your fork
7. **Create a Pull Request**

## Commit Message Guidelines

Format: `type(scope): subject`

**Types:**
- `feat` — New feature
- `fix` — Bug fix
- `docs` — Documentation only
- `perf` — Performance improvement
- `refactor` — Code refactor
- `test` — Tests only
- `ci` — CI/CD changes

**Example:**
```
feat(mediaManager): add VP9 SVC support

- Implement VP9 codec configuration
- Add scalability layer detection
- Document bitrate parameters

Closes #123
```

## Code Style

- **JavaScript/TypeScript**: Use ESLint
- **Indentation**: 2 spaces (no tabs)
- **Line length**: 100 characters max
- **Comments**: JSDoc for functions

## Testing

Before submitting a PR:
```bash
npm test
npm run lint
npm run build
```

## Pull Request Process

1. **Title**: Descriptive, starts with type (e.g., `feat:`, `fix:`)
2. **Description**: Explain what and why
3. **Testing**: Describe testing done
4. **Related Issues**: Link with `Closes #123`
5. **Screenshots**: Add for UI changes

## Code Review

- Reviews are collaborative and constructive
- Address feedback respectfully
- Re-request review after making changes
- Patience appreciated — we're all volunteers

## Areas for Contribution

- 🚀 **Performance**: Profiling, optimization
- 🧪 **Testing**: Unit, integration, load tests
- 📖 **Documentation**: Guides, examples, API docs
- 🐛 **Bug Fixes**: Reported issues
- ✨ **Features**: From roadmap or discussions

## Legal

By submitting a contribution, you agree that your code will be licensed under LATTRIX's MIT License.

---

**Thank you for helping LATTRIX become better!** 💙
