# Project Specification: nootid

> *"Found It, Noted It"*

---

## 1. Executive Summary & Brand Identity
- **Nama Produk**: `nootid` (Berasal dari kata *"Noted"* + identitas lokal *"-id"*).
- **Judul Resmi PKM-KC (20 Kata)**: *Nootid: Rancang Bangun Platform Edutech Gamified Knowledge Hub Terintegrasi AI untuk Transformasi Konsumsi Konten Media Sosial Menjadi Pengetahuan Produktif Terstruktur*
- **Target Platform**: **Mobile App (Android First, iOS Ready)**
- **Tech Stack Utama**:
  - **Mobile Framework**: **Flutter (Dart)** (Cross-platform, high-performance 60-120 FPS rendering)
  - **Native Share Integration**: `receive_sharing_intent` (Menangkap link share sheet dari IG/TikTok/YT/X)
  - **Mascot Animation Engine**: `flutter_svg`, `rive` / Custom Canvas Painter
  - **Audio & Haptic Feedback**: `audioplayers` / `just_audio` (Sound effects interaktif)
  - **State Management & Local Cache**: `flutter_riverpod` & `shared_preferences` / `hive`
- **Tagline**: *"Found It, Noted It"*
- **Konsep Inti**: **Gamified Knowledge Hub & Second Brain untuk Media Sosial**.
- **Karakter & Maskot Utama**: **Nootti the Capybara (Kapibara)** — Simbol ketenangan (*Zen & Anti-FOMO*). Hewan paling santai yang mencerna wawasan perlahan tanpa terdistraksi hiruk-pikuk media sosial. Maskot ini 100% gratis sebagai starter companion.
- **Karakter Produk**: Menggabungkan utilitas pencatatan cerdas (*Second Brain*) dengan ikatan emosional *Virtual Pet* (ala Tamagotchi x Duolingo).
- **Arsitektur Inti AI**:
  - **Speech-to-Text (STT)**: *OpenAI Whisper Large-v3* (Transkripsi audio video medsos ke teks)
  - **NLP & Summarization (LLM)**: *Google Gemini 1.5 Flash* (Ekstraksi 3 intisari edukasi & klasifikasi kategori)

---

## 2. Problem Statement (Masalah Nyata)
1. **The Fragmentation Silo**: Tiap medsos (IG, TikTok, YouTube, X) punya sistem bookmark terpisah. User bingung mencari kembali referensi yang tersimpan di platform yang berbeda-beda.
2. **The Link Cemetery (Digital Hoarding)**: User sering menyimpan video berfaedah ke aplikasi notes bawaan HP hanya berupa link teks mentah tanpa konteks, tanpa transkrip, dan akhirnya terlupakan begitu saja.
3. **Low Discoverability & Internal SEO**: Algoritma pencarian internal di media sosial sangat buruk untuk menemukan kembali micro-content/reels edukatif spesifik yang pernah ditonton.

---

## 3. The Core Solution & The "Feed the Pet" Mechanism
`nootid` hadir sebagai satu pintu masuk universal (*Unified Cross-Platform Inbox*):
- **Zero-Friction Ingestion**: Memanfaatkan fitur *Native Share Sheet* pada HP (Klik Share ➔ Pilih `nootid` ➔ Tersimpan instan tanpa harus keluar dari medsos).
- **Gamified Core Loop ("Feeding the Mascot")**:
  - Link yang di-share oleh user dianggap sebagai **"makanan/asupan nutrisi"** untuk maskot virtual user.
  - Setiap kali link masuk, maskot memakan link tersebut dengan animasi lucu dan ekspresif.
  - Maskot memiliki kondisi emosional (*Mascot as Interface State*):
    - *Lapar*: Jika seminggu tidak ada asupan ilmu baru.
    - *Happy / Nyam*: Saat menerima link baru.
    - *Level Up / Glow Up*: Saat user rajin mengoleksi beragam kategori ilmu.
- **Mascot Companion & Pet Sanctuary**:
  - **Maskot Default (100% Gratis)**: Kapibara ("Nootti") sebagai sahabat belajar utama sejak aplikasi diinstal.
  - **Pet Sanctuary (Unlockable/Premium)**: Koleksi hewan lain (Kucing "Miko", Rubah "Robi", Panda Merah) dapat di-unlock melalui capaian streak/level atau mikrotransaksi kosmetik.
  - **Kustomisasi Aksesoris**: Topi wisuda, kacamata, dan tema visual kamar maskot.

---

## 4. Fitur Utama MVP (Minimum Viable Product)
1. **Link Intake & Visual Preview**:
   - Menarik thumbnail, judul, platform icon, dan creator dari link medsos secara otomatis.
2. **AI Takeaway Summary**:
   - Merangkum 3-5 poin inti dari video/konten agar user tidak perlu menonton ulang video panjang.
3. **Interactive Virtual Pet Widget**:
   - Maskot responsif di layar utama yang bereaksi terhadap aktivitas input catatan.
4. **Knowledge Screen Time (Monthly Recap)**:
   - Laporan bulanan estetik ala *Spotify Wrapped* / *iPhone Screen Time*: Menampilkan berapa banyak ilmu yang diserap, kategori terbanyak, dan tombol *"Share to Instagram Story"*.
5. **Smart Tagging & Search**:
   - Pengelompokan kategori (Startup, Coding, Marketing, Self-dev, dll) dan pencarian berbasis isi rangkuman.

---

## 5. Model Bisnis & Monetisasi (Freemium)
### A. Bilah Fungsional (Nootid Pro - Subscription Rp 15.000 - Rp 25.000 / bln)
- Unlimited AI Summaries & Video Transcripts (Free tier dibatasi 10-15 link/bln).
- **Ask Your Mascot**: Fitur chat langsung dengan maskot untuk mencari catatan masa lalu (*"Eh Nootti, rumus Excel yang kemarin apa ya?"*).
- Export catatan ke PDF / Notion untuk tugas kuliah.

### B. Bilah Gamifikasi (Microtransactions Aksesoris)
- Koleksi kosmetik virtual pet (Kostum edisi wisuda, kacamata unik, tema latar belakang) dengan harga terjangkau (Rp 5.000 - Rp 10.000).

---

## 6. Target Pengguna Awal (Early Adopters)
- Mahasiswa aktif & Gen-Z pembelajar mandiri yang sering scrolling konten edukasi di Instagram, TikTok, dan YouTube.
