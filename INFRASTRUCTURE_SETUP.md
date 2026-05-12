# LATTRIX GitHub Infrastructure Setup Guide

Complete guide to setting up a professional GitHub organization like IronCore's.

---

## 🎯 Overview

LATTRIX follows a **modular multi-repository architecture** where each component has a dedicated repo:

```
Lattrix (Organization)
├── backend-mediaserver (Core SFU)
├── client-sdk (TypeScript client)
├── ui-react (React components)
├── docs (Documentation)
├── helm (Kubernetes charts)
├── docker (Container images)
├── monitoring (Prometheus/Grafana)
├── examples (Reference apps)
└── .github (Organization config)
```

This enables:
- ✅ Parallel development
- ✅ Granular access control
- ✅ Independent versioning & releases
- ✅ Focused issue tracking
- ✅ Clearer responsibility

---

## Phase 1: Organization Setup (GitHub)

### 1.1 Create Organization
1. Go to github.com/organizations/new
2. Choose organization name: `Lattrix`
3. Contact email: `ops@lattrix.dev`
4. Organization type: `Free` or `Pro`
5. Create organization

### 1.2 Configure Organization Settings
1. Go to Organization Settings
2. **General**:
   - Set organization description
   - Add avatar/logo
   - Set default code owner (yourself)

3. **Member privileges**:
   - Base role: Maintainer
   - Repository creation: Allowed
   - Repository deletion: Restricted to admins

4. **Security & Analysis**:
   - Enable Dependabot alerts
   - Enable secret scanning
   - Enable code scanning

### 1.3 Create `.github` Repository
1. Create new repo: **`.github`** (with dot prefix)
2. Description: "Organization configuration, templates, and shared workflows"
3. Visibility: **Public**
4. Initialize with README
5. **Enable:**
   - Discussions
   - Wikis (optional)
   - Issues

### 1.4 Push Organization Configuration
```bash
# Clone the `.github` repo
git clone https://github.com/Lattrix/.github
cd .github

# Copy all files from this setup
cp -r <path-to-setup>/profile/ .
cp -r <path-to-setup>/.github .
cp <path-to-setup>/*.md .

# Commit and push
git add .
git commit -m "chore: add organization-wide templates and policies

- Add organization profile (profile/README.md)
- Add issue & PR templates (.github/ISSUE_TEMPLATE/, .github/pull_request_template.md)
- Add community guidelines (CODE_OF_CONDUCT.md, CONTRIBUTING.md, SECURITY.md)
- Add repository templates guide (REPO_TEMPLATES.md)
- Add CI/CD workflow template (.github/workflows/ci.yml)

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"

git push origin main
```

---

## Phase 2: Create Satellite Repositories

### 2.1 Backend Mediaserver
```bash
# Create on GitHub: LATTRIX-WebRTC-Voice-Backend-mediaserver-
# Clone it
git clone https://github.com/Lattrix/LATTRIX-WebRTC-Voice-Backend-mediaserver-
cd LATTRIX-WebRTC-Voice-Backend-mediaserver-

# Initialize with optimized code
# (Copy from your existing optimized version)
cp -r <path-to-optimized-code>/* .

# Set up files
touch .gitignore CHANGELOG.md
cp ../.github/.github . -r              # Copy org workflows
cp ../.github/CODE_OF_CONDUCT.md .
cp ../.github/CONTRIBUTING.md .
cp ../.github/SECURITY.md .
```

**Example .gitignore:**
```
node_modules/
dist/
build/
.env
.env.local
.DS_Store
npm-debug.log
coverage/
.vscode/
```

### 2.2 Client SDK
```bash
# Create: lattrix-client-sdk (public)
git clone https://github.com/Lattrix/lattrix-client-sdk
cd lattrix-client-sdk

# Initialize TypeScript project
npm init -y
npm install --save-dev typescript ts-node @types/node

# Create structure
mkdir -p src/{utils,types} tests examples dist
echo 'export * from "./client";' > src/index.ts

# Copy workflows & templates
```

### 2.3 React UI Components
```bash
# Create: lattrix-ui-react (public)
git clone https://github.com/Lattrix/lattrix-ui-react
cd lattrix-ui-react

# Initialize
npm init -y
npm install react react-dom typescript

# Create structure
mkdir -p src/{components,hooks,styles} stories tests
```

### 2.4 Documentation
```bash
# Create: lattrix-docs (public)
git clone https://github.com/Lattrix/lattrix-docs
cd lattrix-docs

# Use Jekyll or Markdown
mkdir -p docs/{guides,examples,api} _includes
```

### 2.5 Helm Charts
```bash
# Create: lattrix-helm (public)
git clone https://github.com/Lattrix/lattrix-helm
cd lattrix-helm

# Initialize Helm repo
helm repo create lattrix-helm
mkdir -p lattrix-backend/templates examples

# Create Chart.yaml
cat > lattrix-backend/Chart.yaml << 'YAML'
apiVersion: v2
name: lattrix-backend
version: 1.0.0
YAML
```

### 2.6 Docker Images
```bash
# Create: lattrix-docker (public)
git clone https://github.com/Lattrix/lattrix-docker
cd lattrix-docker

mkdir -p {mediaserver,coturn,examples}

# Create Dockerfile example (mediaserver)
cat > mediaserver/Dockerfile << 'DOCKER'
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 4000
CMD ["node", "server.js"]
DOCKER
```

### 2.7 Monitoring
```bash
# Create: lattrix-monitoring (public)
git clone https://github.com/Lattrix/lattrix-monitoring
cd lattrix-monitoring

# Prometheus & Grafana configs
mkdir -p prometheus grafana/dashboards
```

### 2.8 Examples
```bash
# Create: lattrix-examples (public)
git clone https://github.com/Lattrix/lattrix-examples
cd lattrix-examples

# Example projects
mkdir -p {basic-voice-chat,advanced-app,docker-compose}
```

---

## Phase 3: Configure Each Repository

### For Every Repository:

#### 3.1 GitHub Settings
1. **General**:
   - Add description
   - Set default branch: `main`
   - Allow auto-delete head branches: ✅
   
2. **Branch protection** (for `main`):
   - Require pull request reviews: 1
   - Require status checks to pass
   - Require branches up-to-date
   - Require code reviews before merge
   - Dismiss stale reviews

3. **Actions**:
   - Enable GitHub Actions
   - Set token permissions: Read and write

4. **Pages** (if docs repo):
   - Source: Deploy from branch
   - Branch: `main` / `docs` folder

#### 3.2 Add Standard Files
```bash
# In each repo:
- README.md (use REPO_TEMPLATES.md as reference)
- LICENSE (MIT)
- CONTRIBUTING.md (or reference .github repo)
- CODE_OF_CONDUCT.md (or reference .github repo)
- SECURITY.md (backend & main repos)
- CHANGELOG.md
- .gitignore
- .github/workflows/ci.yml (copy from .github repo)
```

#### 3.3 Add Collaborators & Teams
```bash
# Go to repo → Settings → Collaborators & teams
# Add team: @Lattrix/maintainers (Admin)
# Add team: @Lattrix/contributors (Maintain)
```

---

## Phase 4: Automation & CI/CD

### 4.1 Create GitHub Teams
1. Go to Organization → Teams
2. Create teams:
   - `maintainers` (write access, releases)
   - `contributors` (write access)
   - `triagers` (triage issues)

### 4.2 Enable Dependabot
1. Go to each repo → Settings → Code security & analysis
2. Enable:
   - Dependabot alerts
   - Dependabot security updates
   - Dependabot version updates

### 4.3 Configure Branch Protection
```bash
# For main branch in each repo:
1. Require pull request reviews (1 approval)
2. Require status checks to pass before merge
3. Require branches up to date before merge
4. Include administrators in restrictions
5. Restrict who can push to main
```

### 4.4 Add GitHub Actions Secrets
For each repo that needs to deploy:
```bash
# Settings → Secrets → Actions
- NPM_TOKEN (for package publishing)
- DOCKER_USERNAME (for Docker Hub)
- DOCKER_TOKEN
- KUBECONFIG (for Helm deployments)
```

---

## Phase 5: Documentation & Discoverability

### 5.1 Organization Profile
- ✅ Set profile README (already done: profile/README.md)
- ✅ Add organization avatar
- ✅ Add organization website link

### 5.2 Repository Topics
Add to each repo → About section:
```
Backend:
  webrtc, sfu, mediasoup, nodejs, socket.io, real-time

Client SDK:
  typescript, webrtc, sdk, client, voice

UI Components:
  react, voice-chat, ui-components, webrtc

Examples:
  examples, starter-kit, tutorials, webrtc

Docs:
  documentation, guides, api-reference

Helm:
  kubernetes, helm, deployment, devops

Docker:
  docker, containers, deployment

Monitoring:
  prometheus, grafana, metrics, monitoring
```

### 5.3 Wikis & Discussions
Enable for main repos:
- **Discussions**: For Q&A, ideas, show & tell
- **Wikis**: For internal docs (optional)

---

## Phase 6: Release Management

### 6.1 Semantic Versioning
All repos use **semver**: `v1.2.3`

```
v[MAJOR].[MINOR].[PATCH]
- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes
```

### 6.2 Release Process
1. Update CHANGELOG.md
2. Tag: `git tag v1.2.3`
3. Push tag: `git push origin v1.2.3`
4. GitHub Actions automatically:
   - Publishes to npm (JS packages)
   - Creates GitHub release
   - Builds & pushes Docker images
   - Updates Helm repo

### 6.3 Automated Releases
Use `release.yml` workflow:
```yaml
on:
  push:
    tags: [ 'v*' ]
```

---

## 📊 Repository Status Board

Track all repos in your organization:

| Repo | Owner | Status | Version | Tests | Docs |
|------|-------|--------|---------|-------|------|
| backend-mediaserver | @team | ✅ | v1.0.0 | ✅ | ✅ |
| client-sdk | @team | ✅ | v1.0.0 | ✅ | ✅ |
| ui-react | @team | ✅ | v1.0.0 | ✅ | ✅ |
| docs | @team | ✅ | n/a | n/a | ✅ |
| helm | @team | ✅ | v1.0.0 | n/a | ✅ |
| docker | @team | ✅ | v1.0.0 | ⚠️ | ✅ |
| monitoring | @team | ✅ | v1.0.0 | n/a | ✅ |
| examples | @team | ✅ | v1.0.0 | ✅ | ✅ |

---

## ✅ Final Checklist

- [ ] Organization created & configured
- [ ] `.github` repository with templates & profiles
- [ ] 8 satellite repos created with structure
- [ ] Each repo has:
  - [ ] README.md
  - [ ] LICENSE (MIT)
  - [ ] CONTRIBUTING.md
  - [ ] CODE_OF_CONDUCT.md
  - [ ] .gitignore
  - [ ] GitHub Actions workflows
  - [ ] Branch protection on `main`
  - [ ] Topics/keywords added
- [ ] Teams created (maintainers, contributors, triagers)
- [ ] Dependabot enabled for all repos
- [ ] GitHub Actions secrets configured
- [ ] Documentation site deployed (docs repo)
- [ ] First release tagged and published

---

## 🎯 Next Steps

1. **Onboard contributors**: Add team members with appropriate access
2. **Enable discussions**: For questions & ideas
3. **Create roadmap**: Link ROADMAP.md in all repos
4. **Set up community**: Add Discord/forum link to org profile
5. **Monitor metrics**: Track stars, forks, issues, PRs

---

*This infrastructure supports growth to 100+ contributors across multiple projects.*
