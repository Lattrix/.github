#!/bin/bash
# LATTRIX GitHub Organization - Push to Production
# Run this script to deploy your organization infrastructure to GitHub

set -e

echo "🚀 LATTRIX GitHub Organization Deployment"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get organization name
echo "What is your GitHub organization name?"
echo "Example: Lattrix"
read -p "Organization name: " ORG_NAME

if [ -z "$ORG_NAME" ]; then
  echo -e "${RED}✗ Organization name is required${NC}"
  exit 1
fi

echo -e "${YELLOW}ℹ Deploying to: https://github.com/${ORG_NAME}/.github${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "profile/README.md" ] || [ ! -d ".github" ]; then
  echo -e "${RED}✗ Error: Not in lattrix-github-org directory${NC}"
  echo "Please run from /home/elias/lattrix-github-org"
  exit 1
fi

echo -e "${GREEN}✓ Files found${NC}"
echo ""

# Verify git is initialized
if [ ! -d ".git" ]; then
  echo "Initializing git repository..."
  git init
  git config user.email "ops@lattrix.dev"
  git config user.name "LATTRIX Team"
fi

echo -e "${GREEN}✓ Git initialized${NC}"
echo ""

# Add remote
echo "Configuring remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${ORG_NAME}/.github.git"

echo -e "${GREEN}✓ Remote configured: origin${NC}"
echo ""

# Stage files
echo "Staging files..."
git add .
git status

echo ""
read -p "Proceed with commit? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted."
  exit 1
fi

# Commit
echo "Committing..."
git commit -m "chore: initialize organization infrastructure

- Add organization profile (profile/README.md)
- Add community templates and guidelines (CODE_OF_CONDUCT.md, CONTRIBUTING.md, SECURITY.md)
- Add issue templates (.github/ISSUE_TEMPLATE/)
- Add PR template (.github/pull_request_template.md)
- Add CI/CD workflow (.github/workflows/ci.yml)
- Add repository templates guide (REPO_TEMPLATES.md)
- Add infrastructure setup guide (INFRASTRUCTURE_SETUP.md)
- Add getting started guide (GETTING_STARTED.md)
- Add roadmap (ROADMAP.md)

This establishes professional, enterprise-grade GitHub infrastructure for the Lattrix organization.

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>" || true

echo -e "${GREEN}✓ Committed${NC}"
echo ""

# Push
echo "Pushing to GitHub..."
git branch -M main
git push -u origin main --force

echo ""
echo -e "${GREEN}✓ Successfully deployed to GitHub!${NC}"
echo ""
echo "📍 Organization Profile:"
echo "   https://github.com/${ORG_NAME}"
echo ""
echo ".github Repository:"
echo "   https://github.com/${ORG_NAME}/.github"
echo ""
echo "✅ Next steps:"
echo "   1. Visit https://github.com/${ORG_NAME} to see your organization profile"
echo "   2. Create 8 satellite repositories (see INFRASTRUCTURE_SETUP.md Phase 2)"
echo "   3. Configure each repository (see INFRASTRUCTURE_SETUP.md Phase 3)"
echo ""
echo "📖 Documentation:"
echo "   - Quick overview: GETTING_STARTED.md"
echo "   - Complete setup: INFRASTRUCTURE_SETUP.md"
echo "   - Repository templates: REPO_TEMPLATES.md"
echo ""
echo "🎉 Happy coding!"
