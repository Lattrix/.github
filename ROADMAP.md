# LATTRIX Roadmap

## Current Status: v1.0 (Production)

We're shipping production-grade infrastructure with a clear path forward.

---

## 🎯 v1.5 (Q3 2026)
### VP9 SVC & Adaptive Bitrate

- [x] VP9 codec support in mediaManager
- [ ] Scalability layer detection
- [ ] Automatic bitrate adaptation
- [ ] Bandwidth estimation algorithm
- [ ] Fallback to H264/VP8 on unsupported clients

**Why**: Better video quality on constrained networks, smoother experience for mobile users.

---

## 📹 v1.6 (Q4 2026)
### Recording & Replay

- [ ] Per-room recording API
- [ ] HLS stream output
- [ ] Selective track recording (audio-only, video-only)
- [ ] Replay dashboard in UI
- [ ] S3 / cloud storage integration

**Why**: Enterprise customers need compliance & record-keeping.

---

## 🤖 v1.7 (Q1 2027)
### Live Transcription & Translation

- [ ] Real-time speech-to-text (Whisper API integration)
- [ ] Auto-translation (Google Translate / DeepL)
- [ ] Captions overlay in UI
- [ ] Transcript download (PDF, VTT)

**Why**: Accessibility, multilinguality, searchable archives.

---

## 🌍 v2.0 (Q2 2027)
### Multi-Region Federation

- [ ] Router-to-router peering
- [ ] Geographic load balancing
- [ ] Cross-region producer forwarding
- [ ] Reduced latency via edge servers

**Why**: Global scale, sub-50ms latency everywhere.

---

## 🔄 Ongoing

- **Security**: Regular audits, CVE patching
- **Performance**: Continuous profiling, optimization
- **Documentation**: API docs, guides, examples
- **Testing**: Expand test coverage (unit, integration, load)
- **Community**: Respond to issues, review PRs

---

## 🤔 Under Discussion

- [ ] **WHIP/WHEP Protocol**: Standards-based publishing
- [ ] **SIP Integration**: Legacy phone system support
- [ ] **Analytics Dashboard**: Real-time metrics UI
- [ ] **AI-Powered Moderation**: Auto-detect/mute disruptive audio
- [ ] **WebRTC Stats API**: Client-side diagnostics

---

## 📊 Success Metrics

- **Deployment**: >100 productions instances
- **Uptime**: 99.99% SLA
- **P99 Latency**: <50ms global
- **Community**: 50+ contributors
- **Docs**: Complete API coverage + 20+ guides

---

## 🙏 Contributing to Roadmap

Have ideas? Propose them in [GitHub Discussions](https://github.com/orgs/Lattrix/discussions) or open a feature request issue.

---

*Last updated: 2026-05-12*
