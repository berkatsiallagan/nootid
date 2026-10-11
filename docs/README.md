# 🦫 Nootid Engineering & Agency Docs: Panduan Lengkap Rekayasa Perangkat Lunak Mobile & Alur Multi-Agent

Halo tim Nootid! Selamat datang di **Dokumentasi Resmi Rekayasa Perangkat Lunak & Sistem Orkestrasi Multi-Agent Nootid**.

Kumpulan panduan, blueprint teknis, dan standar kualitas ini dirancang khusus untuk memandu pengembang manusia dan agent AI otonom (*Agency Skills*) dalam membangun platform **Nootid**: *Rancang Bangun Platform Edutech Gamified Knowledge Hub Terintegrasi AI untuk Transformasi Konsumsi Konten Media Sosial Menjadi Pengetahuan Produktif Terstruktur* (Program Kreativitas Mahasiswa Karsa Cipta / PKM-KC).

Seluruh panduan mengadopsi standar arsitektur mobile modern (**Flutter 3.x**, **Dart Sound Null Safety**, **Riverpod**, **Local-First Hive/SQLite**, **Groq Whisper Large-v3 STT**, **Google Gemini 1.5 Flash**, **Supabase Cloud**, **Google Play Store Distribution**, serta **Orkestrasi Multi-Agent Agency** berbasis bukti nyata).

---

## 🗺️ Peta Panduan & Struktur Berkas Dokumentasi

```text
docs/
├── README.md                                          <-- Peta panduan utama yang sedang Anda baca
│
├── 01-arsitektur-dan-kode/                            # Fondasi arsitektur Flutter, data layer & keamanan
│   ├── 01-feature-driven-architecture-flutter.md     # Arsitektur feature-first (lib/features/), 3-layer pattern & Riverpod
│   ├── 02-mobile-data-layer-dan-local-cache.md       # Local-first Hive/SQLite, offline-first sync & Supabase client
│   ├── 03-api-contract-dan-response-builder.md       # Standar kontrak API, ResponseBuilder, & pipeline AI Whisper + Gemini
│   ├── 04-auth-mobile-supabase-dan-oauth.md          # Otentikasi mobile Supabase PKCE, Google Sign-In & Secure Storage
│   ├── 05-mobile-security-dan-anti-tampering.md      # Keamanan mobile, obfuskasi R8, sanitasi Intent Share Sheet & prompt guard
│   └── 06-kamus-85-celah-keamanan-cyber.md           # Ensiklopedia 85 celah keamanan cyber, OWASP Mobile & mitigasi AI
│
├── 02-devops-dan-infrastruktur/                       # Urusan Git, CI/CD, build Android APK/AAB & cloud
│   ├── 01-git-branching-strategy.md                  # Aturan branch (main, staging, feat) & semantic versioning pubspec.yaml
│   ├── 02-github-actions-flutter-cicd.md             # Pipeline CI/CD 3-tahap Flutter test, build APK tester & bundle .aab
│   ├── 03-hosting-landing-page-dan-domain.md         # Konfigurasi domain DomaiNesia nootid.app, DNS, & landing page gratis
│   ├── 04-panduan-setup-cloud-dan-secrets.md         # Setup Groq, Google AI Studio, Play Console ($25), Supabase & GitHub Secrets
│   └── 05-membuat-bot-asisten-github.md              # Pembuatan bot asisten PR Nootti the Capybara di GitHub Actions
│
├── 03-sop-tim-dan-kolaborasi/                         # Standar kerja harian, konvensi & etika review
│   ├── 01-master-naming-conventions.md               # Konvensi penamaan Dart/Flutter, Conventional Commits & GitHub Issues
│   ├── 02-siklus-harian-sprint-dan-dod.md            # Ritme harian tim PKM-KC & 7 checklist Definition of Done (DoD)
│   ├── 03-git-command-handbook.md                    # Buku saku contekan perintah terminal Git harian (rutinitas 5 menit)
│   ├── 04-git-emergency-rescue-kit.md                # Kotak obat darurat Git bila salah branch, conflict, atau salah reset
│   └── 05-budaya-tim-dan-etika-code-review.md        # Budaya tim inklusif, etika review kode konstruktif & label PR
│
├── 04-blueprint-proyek-baru/                          # Panduan eksekusi Day 0 sampai rilis toko
│   ├── 01-katalog-lengkap-stack-dan-tooling.md       # Inventaris dependensi Flutter, AI model, tooling & alokasi biaya
│   ├── 02-step-by-step-day0-sampai-production.md     # Panduan 10 tahap dari inisialisasi awal hingga live di Google Play Store
│   └── 03-checklist-legal-pkm-dan-playstore-readiness.md # Checklist rilis Google Play Store, UU PDP, & Hak Cipta HKI DJKI
│
└── 05-orkestrasi-agent-agency/                        # Orkestrasi AI Agent Mandiri (Agency Skills Suite)
    ├── 01-arsitektur-dan-alur-multi-agent.md         # Pipeline 4-fase: Senior PM -> UX Architect -> [Dev-QA Loop] -> RealityCheck
    ├── 02-matriks-peran-dan-spesialis-agency.md      # Matriks peran: Orchestrator, PM, Mobile Dev, QA, AppSec, ASO
    ├── 03-dev-qa-loop-dan-evidence-gate.md           # Siklus Dev-QA per-task, bukti screenshot, & toleransi max 3x retry
    └── 04-production-reality-check-dan-smoke-test.md # Gerbang produksi "Default to NEEDS WORK" & Smoke Test 10-Poin Nootid
```

---

## ⚡ Sorotan Spesifikasi Kunci Nootid

1. **Flutter 3.x & Dart (Sound Null Safety)**:
   - Target rilis utama: **Android Mobile App** (dengan arsitektur single codebase siap ekspansi ke iOS).
   - Arsitektur berbasis fitur (*Feature-First*) dengan Riverpod state management.
2. **Kecerdasan Buatan Terintegrasi (Dual AI Engine)**:
   - **Speech-to-Text**: *OpenAI Whisper Large-v3* via Groq Cloud API (super cepat & akurat mentranskrip video reels/tiktok).
   - **Summarizer & Classifier**: *Google Gemini 1.5 Flash* via Google AI Studio Free Tier (mengekstrak 3 poin intisari edukasi ke format JSON).
3. **Mascot as Interface State ("Nootti the Capybara")**:
   - Maskot utama Kapibara (*Nootti*) gratis 100% sebagai pendamping belajar santai anti-FOMO.
   - Animasi mengunyah link dan efek suara dopamin saat link medsos dibagikan ke aplikasi.
4. **Distribusi & Anggaran Transparan**:
   - Rilis resmi di **Google Play Store** ($25 / Rp 410.000).
   - Domain resmi **`nootid.app`** di DomaiNesia (Rp 332.889 / tahun).
   - Pendaftaran Hak Cipta Program Komputer di **HKI DJKI** (Rp 200.000).
   - Kampanye pemasaran **Paid Ads** terarah (Rp 500.000).
