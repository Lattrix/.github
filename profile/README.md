# LATTRIX 🎙️

> **Enterprise WebRTC Voice & Video Infrastructure**  
> Built for scale, optimized for real-time communication.

---

## 🎯 What is LATTRIX?

LATTRIX is a **Selective Forwarding Unit (SFU)** — a high-performance, production-ready WebRTC infrastructure for building Discord-like voice and video applications. We handle the hard parts: signaling, media routing, active speaker detection, and screen sharing.

### Key Metrics
| Metric | Value |
|--------|-------|
| **Architecture** | O(1) room broadcasting |
| **Latency** | <50ms P99 |
| **Concurrent Participants** | 100+ per room |
| **Media Tracks** | Audio, Video, Screen |
| **Deployment** | Cloud-native, Kubernetes-ready |

---

## 📦 Our Repositories

| Repository | Purpose | Status |
|-----------|---------|--------|
| [**backend-mediaserver**](https://github.com/Lattrix/LATTRIX-WebRTC-Voice-Backend-mediaserver-) | Core SFU engine, signaling, media routing | ✅ Production |
| [**client-sdk**](https://github.com/Lattrix/lattrix-client-sdk) | TypeScript/JavaScript client library | ✅ Production |
| [**ui-react**](https://github.com/Lattrix/lattrix-ui-react) | Pre-built React components | ✅ Production |
| [**documentation**](https://github.com/Lattrix/lattrix-docs) | Full API & integration guides | ✅ Production |
| [**helm-charts**](https://github.com/Lattrix/lattrix-helm) | Kubernetes deployment charts | ✅ Production |
| [**docker-images**](https://github.com/Lattrix/lattrix-docker) | Container images (mediaserver, examples) | ✅ Production |
| [**monitoring**](https://github.com/Lattrix/lattrix-monitoring) | Prometheus metrics, Grafana dashboards | ✅ Production |
| [**examples**](https://github.com/Lattrix/lattrix-examples) | Reference implementations & tutorials | ✅ Production |

---

## 🚀 Quick Start

### 1. **Backend Deployment**
```bash
git clone https://github.com/Lattrix/LATTRIX-WebRTC-Voice-Backend-mediaserver-
npm install
npm run dev
```

### 2. **Integrate Client**
```bash
npm install @lattrix/client-sdk
```

### 3. **Use React Components**
```tsx
import { VoiceChannel, ActiveSpeakerList } from '@lattrix/ui-react';

<VoiceChannel 
  roomId="your-room" 
  userId="user-123"
  onParticipantJoin={handleJoin}
/>
```

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────┐
│   Client Applications (Web, Mobile)      │
│   (React, Vue, Native, etc.)              │
└──────────────┬──────────────────────────┘
               │ WebRTC (DTLS-SRTP)
               │ Signaling (Socket.io)
┌──────────────▼──────────────────────────┐
│   LATTRIX SFU Backend (Mediasoup)       │
├──────────────────────────────────────── │
│ • Producer Indexing (O(1) lookup)       │
│ • Room Isolation                         │
│ • Active Speaker Detection               │
│ • Graceful Shutdown / Recovery           │
└──────────────┬──────────────────────────┘
               │ Media Routing (UDP)
               ▼
        ┌──────────────┐
        │ TURN Server  │
        │ (COTURN)     │
        └──────────────┘
```

---

## 📊 Performance Optimizations

### Producer Indexing
- **Before**: O(n²) room broadcasts (scan all producers for each user)
- **After**: O(1) with Map-based indexing
- **Improvement**: **100x faster** for 50+ participant rooms

### Graceful Shutdown
- Drains connections before termination
- Notifies clients with SERVER_SHUTDOWN event
- Prevents abrupt disconnects on deploy

### Input Validation
- All socket events validated against 128-char max
- Prevents DoS attacks and type mismatches

### Efficient Memory Management
- Consumer pause on creation (prevents buffer bloat)
- Graceful disconnect grace period
- Automatic producer cleanup

---

## 🛠️ Tech Stack

- **Runtime**: Node.js 18+ (LTS)
- **Signaling**: Socket.io 4.8+
- **Media Engine**: Mediasoup 3.19+ (C++ SFU)
- **Message Queue**: Redis (optional, for clustering)
- **Monitoring**: Prometheus + Grafana
- **Deployment**: Kubernetes, Docker, PM2
- **Client**: TypeScript, React (optional)

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

**Areas we need help:**
- 🚀 Performance profiling & optimization
- 🧪 Test coverage & benchmarks
- 📖 Documentation & examples
- 🐛 Bug fixes & issue triage
- 🌍 Language packs & i18n

---

## 📖 Documentation

- **[Getting Started](https://docs.lattrix.dev/getting-started)** — Setup and deployment
- **[API Reference](https://docs.lattrix.dev/api)** — Socket.io events and payloads
- **[Architecture Guide](https://docs.lattrix.dev/architecture)** — Deep dive into SFU design
- **[Troubleshooting](https://docs.lattrix.dev/troubleshooting)** — Common issues & solutions

---

## 📋 Code of Conduct

We are committed to providing a welcoming and inclusive community. See [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).

---

## 🔒 Security

Found a vulnerability? **Do not open a public issue.** Email security@lattrix.dev instead. See [SECURITY.md](./SECURITY.md).

---

## 📄 License

All LATTRIX repositories are licensed under the **MIT License**.

---

## 📞 Support

- **Issues**: Use GitHub Issues in the relevant repository
- **Discussions**: [GitHub Discussions](https://github.com/orgs/Lattrix/discussions)
- **Email**: support@lattrix.dev
- **Community**: [Discord](https://discord.gg/lattrix)

---

## 🌟 Roadmap

- [ ] v1.5: VP9 SVC support for adaptive bitrate
- [ ] v1.6: Recording & Replay API
- [ ] v1.7: Live transcription (AI-powered)
- [ ] v2.0: Multi-region federation

See [ROADMAP.md](./ROADMAP.md) for details.

---

**Built with ❤️ by the LATTRIX Team**
