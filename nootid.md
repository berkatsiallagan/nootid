# nootid. — Gamified Second Brain untuk Media Sosial

> **Judul Resmi PKM-KC (20 Kata)**:  
> **"Nootid: Rancang Bangun Platform Edutech Gamified Knowledge Hub Terintegrasi AI untuk Transformasi Konsumsi Konten Media Sosial Menjadi Pengetahuan Produktif Terstruktur"**  
> *Tagline*: *"Found It, Noted It"* 🦫✨

---

## 🚀 Ringkasan Eksekutif & Karakter Produk

`nootid` adalah platform *knowledge management* dan *second brain* berbasis gamifikasi yang mengonversi link video edukatif berfaedah (Instagram Reels, TikTok, YouTube Shorts/Video, dan X) menjadi rangkuman terstruktur dan asupan nutrisi untuk maskot virtual.

- **Target Platform**: **Mobile App (Android First, iOS Ready)** via **Flutter 3.x (Dart)**.
- **Maskot Utama Resmi (100% Gratis)**: **Nootti the Capybara (Kapibara)** — Simbol ketenangan (*Zen & Anti-FOMO*), mengajarkan pembelajar mandiri untuk mencerna ilmu perlahan tanpa terdistraksi hiruk-pikuk media sosial.
- **Arsitektur Inti AI**:
  - **Speech-to-Text (STT)**: `OpenAI Whisper Large-v3` (via Groq Cloud API) — Transkripsi audio video medsos ke teks secara akurat dan ultra-cepat (< 0.5 detik).
  - **NLP & Summarization (LLM)**: `Google Gemini 1.5 Flash` (via Google AI Studio) — Ekstraksi 3 poin intisari tindakan konkret (*Actionable Key Takeaways*) & klasifikasi kategori wawasan.
- **Rencana Rilis Publik**: Rilis resmi di **Google Play Store** (didukung pendanaan akun developer $25 / Rp 410.000) dengan domain resmi `nootid.app` (DomaiNesia Rp 332.889 inc. PPN).

---

## 📂 Struktur Direktori Proyek

```
D:\startup\nootid\
├── docs/                                # Dokumentasi engineering lengkap (Arsitektur, DevOps, SOP, Blueprint, Agency)
│   ├── 01-arsitektur-dan-kode/          # Arsitektur Flutter, data layer, API contract, auth, mobile security, kamus 85 celah
│   ├── 02-devops-dan-infrastruktur/     # Git branching, GitHub Actions CI/CD Flutter, domain DomaiNesia, setup cloud
│   ├── 03-sop-tim-dan-kolaborasi/       # Konvensi penamaan Dart, siklus sprint & DoD, Git handbook, rescue kit, etika review
│   ├── 04-blueprint-proyek-baru/        # Tooling Flutter, roadmap Day 0 ke Google Play Store, checklist legalitas PKM
│   ├── 05-orkestrasi-agent-agency/      # Alur multi-agent, matriks peran, Dev-QA evidence loop, smoke test reality check
│   └── README.md                        # Indeks master panduan rekayasa software & agency
├── project-specs/
│   ├── nootid-setup.md                  # Spesifikasi produk lengkap & arsitektur sistem
│   ├── lean-canvas.md                   # Validasi model bisnis, problem-solution fit
│   └── anggaran-pkm-dan-operasional.md   # RAB rinci PKM-KC (4 skenario: 6jt, 8jt, 10jt, 11jt)
├── project-tasks/
│   ├── nootid-tasklist.md               # Master checklist perkembangan per fase
│   └── README.md                        # Panduan orkestrasi task
├── .agents/                             # Standards & quality guidelines (ECC + Agency)
├── .gitignore                           # Git ignore rules
└── README.md                            # Dokumentasi utama proyek
```

---

## 💰 Strategi Pendanaan & Zero-Rupiah Stack

1. **Tahap Pengembangan Lokal & Riset Awal (Rp 0 / Zero-Rupiah)**:
   - Whisper Large-v3 via Groq Cloud (Gratis).
   - Gemini 1.5 Flash via Google AI Studio (Gratis 1.500 req/hari).
   - Database lokal *Local-First (Hive / SQLite)* di memori perangkat pengguna.
2. **Tahap Hibah PKM-KC (Tersedia 4 Skenario Anggaran Proporsi 80% Operasional : 20% Administrasi)**:
   - Skenario 1 (Rp 6.000.000) — Batas Minimal APBN Belmawa
   - Skenario 2 (Rp 8.000.000) — Batas Maksimal Full APBN Belmawa
   - Skenario 3 (Rp 10.000.000) — APBN 8jt + Perguruan Tinggi 2jt
   - Skenario 4 (Rp 11.000.000) — APBN 8jt + Kampus 2jt + Mitra 1jt
   - *Seluruh skenario menjamin rilis Play Store, Paid Ads Rp 500rb, dan HAKI DJKI Rp 200rb.*

---

## 🛠️ Standar Pengembangan (ECC & Quality Gates)

1. **Commit Message**: Mengikuti format Conventional Commits (`feat:`, `fix:`, `refactor:`, `docs:`, `chore:`).
2. **Arsitektur Kode**: Flutter Modular / Feature-First dengan state management reaktif.
3. **Keamanan & Boundary**: Sanitasi input tautan, validasi format URL, dan perlindungan privasi data pengguna.
