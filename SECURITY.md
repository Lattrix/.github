# Security Policy

## Reporting Security Vulnerabilities

If you discover a security vulnerability, **do not** open a public issue.

Instead, email: **security@lattrix.dev**

Include:
- Type of vulnerability
- Location (file, line number)
- Proof of concept
- Potential impact
- Suggested fix (if any)

We will acknowledge your report within 48 hours and follow up with:
1. Investigation timeline
2. Fix development
3. Security advisory creation
4. Public disclosure coordination

## Security Best Practices

### For Users
- Keep Node.js and dependencies updated
- Use JWT tokens with sufficient expiration
- Configure TURN servers for production
- Enable DTLS-SRTP validation
- Use Redis with AUTH enabled
- Monitor for suspicious connection patterns

### For Developers
- Validate all input on socket events
- Use parameterized queries for SQL (if applicable)
- Never log sensitive data (tokens, passwords)
- Keep dependencies updated
- Run security audits: `npm audit`
- Report vulnerabilities responsibly

## Supported Versions

Security patches are provided for:
- Current stable release
- Previous major version (12 months)

| Version | Status |
|---------|--------|
| 1.x     | ✅ Active |
| 0.x     | ⚠️ EOL |

## Acknowledgments

We appreciate security researchers who responsibly disclose vulnerabilities.

---

*Last updated: 2026-05-12*
