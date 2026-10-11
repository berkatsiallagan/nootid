# nootid - Master Development Tasklist

> **Judul Resmi PKM-KC**: *Nootid: Rancang Bangun Platform Edutech Gamified Knowledge Hub Terintegrasi AI untuk Transformasi Konsumsi Konten Media Sosial Menjadi Pengetahuan Produktif Terstruktur*  
> **Target Platform**: *Mobile App (Android First, iOS Ready)*  
> **Tech Stack**: *Flutter 3.x (Dart) + Whisper Large-v3 (STT) + Gemini 1.5 Flash (LLM Summarizer)*  
> Sumber Acuan: `project-specs/nootid-setup.md` & `project-specs/lean-canvas.md`  
> Metodologi: Agency Continuous Quality Loop (Spec ➔ Dev ➔ QA ➔ Integration)

---

## 🎯 Status Keseluruhan Proyek
- [x] **Fase 0: Discovery & Strategy** (Problem Validation, Lean Canvas, Product Spec)
- [ ] **Fase 1: Inisialisasi Fondasi & Tech Stack (Flutter Mobile)**
- [ ] **Fase 2: Komponen Inti & "Feed the Mascot" Engine**
- [ ] **Fase 3: Smart Link Ingestion & AI Summarizer**
- [ ] **Fase 4: Gamifikasi (Kustomisasi Maskot & Monthly Recap)**
- [ ] **Fase 5: QA Testing, Audit Keamanan, & Rilis MVP**

---

## 📋 Breakdown Tugas Spesifik

### Fase 1: Inisialisasi Fondasi & Tech Stack (Flutter Mobile)
- [ ] **Task 1.1**: Setup struktur project Flutter (`nootid`) dengan Dart & arsitektur modular feature-first.
- [ ] **Task 1.2**: Konfigurasi dependencies inti di `pubspec.yaml` (`receive_sharing_intent`, `flutter_riverpod`, `flutter_svg`, `audioplayers`, `shared_preferences`).
- [ ] **Task 1.3**: Rancang schema data lokal (State Management / Local Cache) untuk `notes`, `mascot`, dan `stats`.
- [ ] **Task 1.4**: Buat tema dasar (Color palette, font typography) & bottom navigation/scaffold utama.

### Fase 2: Komponen Inti & "Feed the Mascot" Engine
- [ ] **Task 2.1**: Buat komponen `MascotWidget`:
  - Visual maskot default resmi: **Nootti the Capybara (Kapibara)**.
  - State animasi responsif: `idle` (santai/zen), `eating` (mengunyah link), `happy` (kenyang/loncat), `hungry` (muka melas jika lama tak diisi).
- [ ] **Task 2.2**: Buat komponen `QuickLinkBar`:
  - Input field paste link medsos (Support auto-detect: Instagram, TikTok, YouTube, X).
  - Tombol interaktif "Feed to Mascot" (animasi link terlempar dan dimakan).
- [ ] **Task 2.3**: Integrasikan animasi transisi saat link di-submit: link memicu efek suara/animasi partikel dopamin.

### Fase 3: Smart Link Ingestion & AI Summarizer
- [ ] **Task 3.1**: Buat utility parser URL untuk mendeteksi platform dan mengekstrak ID/embed info.
- [ ] **Task 3.2**: Buat komponen `NoteCard`:
  - Menampilkan thumbnail, badge platform medsos, judul, dan kategori tags.
  - Menampilkan 3 poin intisari hasil AI (*Key Takeaways*).
  - Kolom catatan refleksi pribadi (*"Kenapa gue simpan ini?"*).
- [ ] **Task 3.3**: Buat fitur filter kategori (*Startup, Coding, Marketing, Self-Dev*) dan semantic search bar.

### Fase 4: Gamifikasi (Kustomisasi Maskot & Monthly Recap)
- [ ] **Task 4.1**: Buat modal `CustomizeMascot`:
  - Ubah nama panggilan Nootti the Capybara.
  - Kustomisasi aksesoris kepala/baju/kamar (Topi wisuda, kacamata nerd, tema santai).
  - Preview koleksi hewan lain di *Pet Sanctuary* (Kucing "Miko", Rubah "Robi", Panda Merah).
- [ ] **Task 4.2**: Buat modal `KnowledgeWrapped` (Rekap Bulanan):
  - Tampilan visual ala *Spotify Wrapped* / *Screen Time iPhone*.
  - Statistik: Total ilmu diserap bulan ini, topik paling sering dipelajari.
  - Tombol "Export/Share to Instagram Story" (format kartu estetik 9:16).

### Fase 5: QA Testing, Audit Keamanan, & Rilis MVP
- [ ] **Task 5.1**: Audit responsivitas di layar smartphone (Viewport 375px - 430px) dan tablet.
- [ ] **Task 5.2**: Validasi input sanitization & boundary check sesuai standar ECC rules.
- [ ] **Task 5.3**: Siapkan demo flow untuk bahan presentasi mata kuliah startup semester 5, Monev PKM-KC, dan rilis Google Play Store ($25 dev account).
