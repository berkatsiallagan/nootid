# 📦 Katalog Lengkap Stack Teknologi & Tooling Nootid

Halo kawan-kawan! Dokumen ini merangkum seluruh inventaris teknologi, library resmi, dan perkakas pengembangan yang digunakan dalam membangun platform **Nootid: Rancang Bangun Platform Edutech Gamified Knowledge Hub Terintegrasi AI**.

---

## 1. Stack Inti Aplikasi Mobile (Mobile Framework & Runtime)

| Komponen | Pilihan Teknologi | Versi Target | Alasan & Keunggulan |
|---|---|---|---|
| **Mobile SDK** | **Flutter** | `3.24.x`+ | Single codebase cross-platform performa tinggi (60–120 FPS), rendering grafis Skia/Impeller. |
| **Programming Language** | **Dart** | `3.5.x`+ | Sound null safety, strongly typed, kompilasi AOT (Ahead-of-Time) langsung ke biner mesin ARM. |
| **State Management** | **Flutter Riverpod** | `^2.5.x` | Compile-time safe, tanpa dependensi BuildContext, arsitektur modular terisolasi. |
| **Local Document Storage** | **Hive CE** / **SQLite** | `^2.x` | Database lokal NoSQL ringan & cepat untuk penyimpanan offline-first tanpa overhead server. |
| **Key-Value Storage** | **shared_preferences** | `^2.3.x` | Penyimpanan pengaturan aplikasi, status sound FX, dan streak hari ini. |
| **Native Share Integration** | **receive_sharing_intent** | `^2.0.x` | Menangkap link kiriman langsung dari tombol "Bagikan" di Instagram, TikTok, dan YouTube. |
| **Animasi Grafis** | **flutter_svg** & **Custom Canvas** | `^2.0.x` | Rendering visual Nootti the Capybara tajam di semua densitas layar smartphone. |
| **Sound Effects (SFX)** | **audioplayers** | `^6.0.x` | Memutar efek suara kunyah dopamin, pop, dan level-up saat interaksi maskot. |

---

## 2. Kecerdasan Buatan & Pemrosesan Bahasa Alami (AI Stack)

| Peran AI | Provider / Model | Endpoint / SDK | Alokasi Biaya |
|---|---|---|---|
| **Speech-to-Text (STT)** | **OpenAI Whisper Large-v3** | Groq Cloud API (`https://api.groq.com`) | Free Tier Groq (Inferensi super kencang >300 token/detik). |
| **NLP & Summarizer** | **Google Gemini 1.5 Flash** | Google AI Studio REST / Dart SDK | Free Tier Google (15 RPM, kuota masif 1M context window). |

---

## 3. Infrastruktur Cloud & Rilis Produksi

| Layanan | Provider | Detail Konfigurasi | Biaya Riil |
|---|---|---|---|
| **Distribusi Mobile** | **Google Play Console** | Akun Pengembang Google Play (Android App Bundle `.aab`) | $25 USD (~Rp 410.000) sekali seumur hidup |
| **Domain Resmi** | **DomaiNesia** | `nootid.app` (DNSSEC & WHOIS Protection) | Rp 332.889 / tahun (inc. PPN) |
| **Hosting Landing Page**| **Cloudflare Pages / Vercel** | Static Web Hosting untuk showcase & `nootid.app/privacy` | Rp 0 (Free Tier) |
| **Backend & Cloud Auth**| **Supabase** | PostgreSQL Cloud (Region Singapore ap-southeast-1) | Rp 0 (Free Tier) |
| **Pemasaran Berbayar** | **Meta & TikTok Ads** | Kampanye Paid Ads akuisisi pengguna awal | Rp 500.000 (Sesuai RAB PKM) |
| **Legalitas HKI** | **DJKI Kemenkumham** | Hak Cipta Program Komputer Mahasiswa | Rp 200.000 (Sesuai RAB PKM) |
