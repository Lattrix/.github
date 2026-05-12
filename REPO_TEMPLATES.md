# Repository Templates for LATTRIX Satellite Repos

Use these templates to create consistent, professional repositories across the LATTRIX organization.

---

## 📋 Backend Repository Template

### Directory Structure
```
lattrix-backend-mediaserver/
├── src/
│   ├── server.js              # Main entry point
│   ├── mediaManager.js        # Mediasoup wrapper
│   ├── socketHandlers/
│   │   ├── roomHandlers.js
│   │   ├── transportHandlers.js
│   │   ├── producerHandlers.js
│   │   └── consumerHandlers.js
│   ├── utils/
│   │   ├── validation.js
│   │   ├── config.js
│   │   └── logger.js
│   └── middleware/
│       ├── auth.js
│       └── errorHandler.js
├── tests/
│   ├── unit/
│   ├── integration/
│   └── load/
├── .github/
│   ├── workflows/
│   │   ├── ci.yml             # Tests on push
│   │   └── deploy.yml         # Auto-deploy on tag
│   └── ISSUE_TEMPLATE/
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── .env.example
├── package.json
├── README.md
└── CHANGELOG.md
```

### README Template
```markdown
# LATTRIX Backend Mediaserver

High-performance WebRTC Selective Forwarding Unit (SFU) for voice and video.

## Features
- Audio & video media routing
- Screen sharing support
- Active speaker detection
- Producer indexing (O(1) broadcasts)
- Graceful shutdown & recovery

## Quick Start
\`\`\`bash
npm install
npm run dev
\`\`\`

## Documentation
- [API Reference](../docs/api.md)
- [Architecture](../docs/architecture.md)
- [Deployment Guide](../docs/deployment.md)

## Testing
\`\`\`bash
npm test
npm run load-test
\`\`\`

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md)
```

---

## 🎨 Client SDK Repository Template

### Directory Structure
```
lattrix-client-sdk/
├── src/
│   ├── index.ts               # Main export
│   ├── client.ts              # Core WebRTC client
│   ├── transport.ts           # Transport management
│   ├── producer.ts            # Producer wrapper
│   ├── consumer.ts            # Consumer wrapper
│   ├── types.ts               # TypeScript interfaces
│   └── utils/
│       ├── logger.ts
│       └── errors.ts
├── tests/
│   ├── unit/
│   └── integration/
├── examples/
│   ├── basic.ts
│   └── advanced.ts
├── dist/                      # Built output
├── .github/workflows/
│   ├── test.yml
│   └── publish.yml
├── tsconfig.json
├── package.json
└── README.md
```

### README Template
```markdown
# LATTRIX Client SDK

TypeScript/JavaScript SDK for integrating with LATTRIX SFU.

## Installation
\`\`\`bash
npm install @lattrix/client-sdk
\`\`\`

## Usage
\`\`\`typescript
import { LattrixClient } from '@lattrix/client-sdk';

const client = new LattrixClient({
  serverUrl: 'wss://your-server.com',
  roomId: 'room-123',
  userId: 'user-456'
});

await client.connect();
\`\`\`

## API Reference
[Full documentation](../docs/sdk-api.md)

## Examples
- [Basic voice call](./examples/basic.ts)
- [Advanced features](./examples/advanced.ts)

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md)
```

---

## ⚛️ React UI Repository Template

### Directory Structure
```
lattrix-ui-react/
├── src/
│   ├── components/
│   │   ├── VoiceChannel.tsx
│   │   ├── ActiveSpeakerList.tsx
│   │   ├── ParticipantGrid.tsx
│   │   ├── Controls.tsx
│   │   └── index.ts
│   ├── hooks/
│   │   ├── useVoiceChannel.ts
│   │   ├── useProducer.ts
│   │   └── useConsumer.ts
│   ├── types.ts
│   └── styles/
│       └── index.css
├── stories/                   # Storybook stories
├── tests/
├── .github/workflows/
│   ├── test.yml
│   └── publish.yml
├── storybook/
├── package.json
└── README.md
```

### README Template
```markdown
# LATTRIX React UI Components

Pre-built React components for LATTRIX voice & video.

## Installation
\`\`\`bash
npm install @lattrix/ui-react
\`\`\`

## Components
- `<VoiceChannel />` — Main room interface
- `<ActiveSpeakerList />` — Speaker detection UI
- `<ParticipantGrid />` — Video grid layout
- `<Controls />` — Mute/unmute buttons

## Example
\`\`\`tsx
import { VoiceChannel } from '@lattrix/ui-react';

export default function App() {
  return (
    <VoiceChannel 
      serverUrl="wss://your-server.com"
      roomId="room-123"
      userId="user-456"
    />
  );
}
\`\`\`

## Storybook
\`\`\`bash
npm run storybook
\`\`\`

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md)
```

---

## 🐳 Docker Repository Template

### Directory Structure
```
lattrix-docker/
├── mediaserver/
│   ├── Dockerfile
│   └── docker-compose.yml
├── coturn/                    # TURN server image
│   ├── Dockerfile
│   └── turnserver.conf
├── examples/
│   ├── docker-compose.yml    # Full stack
│   └── .env.example
└── README.md
```

### README Template
```markdown
# LATTRIX Docker Images

Production-ready Docker images for LATTRIX stack.

## Quick Start
\`\`\`bash
docker-compose -f examples/docker-compose.yml up -d
\`\`\`

## Images
- `lattrix/mediaserver:latest` — SFU backend
- `lattrix/coturn:latest` — TURN server

## Configuration
See [docker-compose.yml](./examples/docker-compose.yml)

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md)
```

---

## ☸️ Helm Repository Template

### Directory Structure
```
lattrix-helm/
├── lattrix-backend/
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── templates/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   ├── configmap.yaml
│   │   └── hpa.yaml
│   └── README.md
├── examples/
│   └── values-prod.yaml
└── README.md
```

### README Template
```markdown
# LATTRIX Helm Charts

Kubernetes Helm charts for LATTRIX deployment.

## Installation
\`\`\`bash
helm repo add lattrix https://charts.lattrix.dev
helm install my-lattrix lattrix/lattrix-backend -f values.yaml
\`\`\`

## Configuration
See [values.yaml](./lattrix-backend/values.yaml)

## Production Example
\`\`\`bash
helm install lattrix lattrix/lattrix-backend -f examples/values-prod.yaml
\`\`\`

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md)
```

---

## 📚 Documentation Repository Template

### Directory Structure
```
lattrix-docs/
├── docs/
│   ├── getting-started.md
│   ├── architecture.md
│   ├── api.md
│   ├── deployment.md
│   ├── troubleshooting.md
│   └── faq.md
├── guides/
│   ├── docker-setup.md
│   ├── kubernetes-deployment.md
│   └── production-checklist.md
├── examples/
│   ├── basic-app.md
│   └── multi-room.md
├── _config.yml                # Jekyll config
└── README.md
```

---

## 🔄 Consistency Checklist

Every repo should have:

- [ ] ✅ Professional README with badges
- [ ] 📋 LICENSE file (MIT)
- [ ] 🤝 CONTRIBUTING.md
- [ ] 🐛 Issue templates
- [ ] 📝 Pull request template
- [ ] 🔒 SECURITY.md (for main repos)
- [ ] 📊 GitHub Actions workflows
- [ ] 📦 Version tagging (semver)
- [ ] 📖 Comprehensive docs
- [ ] 🧪 Unit tests + CI/CD

---

## 🎯 Repo Creation Checklist

```bash
# 1. Create repo on GitHub
# 2. Clone locally
git clone https://github.com/Lattrix/<repo-name>
cd <repo-name>

# 3. Initialize with template
cp -r ../template-files .

# 4. Update README, package.json, etc. for specific repo
# 5. Initialize git and first commit
git add .
git commit -m "chore: initialize repo from template"
git push origin main

# 6. Configure GitHub settings:
#    - Add collaborators
#    - Enable branch protection
#    - Set up CI/CD workflows
#    - Configure release automation
```

---

*Use these templates to maintain consistency across LATTRIX repositories.*
