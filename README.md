# 🦫 Nootid — Agile Development, Architecture & Mobile CI/CD Guide

> **Judul Resmi PKM-KC (20 Kata)**:  
> **"Nootid: Rancang Bangun Platform Edutech Gamified Knowledge Hub Terintegrasi AI untuk Transformasi Konsumsi Konten Media Sosial Menjadi Pengetahuan Produktif Terstruktur"**  
> *Tagline*: *"Found It, Noted It"* 🦫✨  
> *Target Platform*: **Mobile App (Android First, iOS Ready) via Flutter 3.x (Dart)**  
> *Maskot Utama*: **Nootti the Capybara (100% Gratis Starter Companion)**  
> *Domain Resmi*: [`nootid.app`](https://nootid.app) (DomaiNesia Rp 332.889 / tahun)  
> *Distribusi Target*: **Google Play Store ($25 / Rp 410.000)**  

Dokumentasi utama pengembangan **Nootid**, platform *gamified second brain* media sosial yang dirancang untuk mentransformasi kebiasaan *doom-scrolling* mahasiswa dan Gen-Z menjadi penyerapan ilmu terstruktur bersama maskot Kapibara.

README ini menjadi panduan teknis operasional tim dalam menjalankan proses rekayasa perangkat lunak, mulai dari **pembagian task berbasis User Story di PKM-KC, branching strategy, Pull Request, code review, arsitektur Mobile Frontend (Flutter & Riverpod), arsitektur AI & Data (Whisper STT, Gemini Flash & Hive), hingga pipeline CI/CD GitHub Actions dan rilis Google Play Store**.

---

# 📋 Daftar Isi

* [1. Development Workflow](#1--development-workflow)
* [2. Branching Strategy](#2--branching-strategy)
* [3. Branch Naming Convention](#3--branch-naming-convention)
* [4. Workflow Pengembangan Per Task](#4--workflow-pengembangan-per-task)
* [5. Pull Request Rules](#5--pull-request-rules)
* [6. Arsitektur Proyek (Flutter Feature-First)](#6--arsitektur-proyek-flutter-feature-first)
* [7. AI & Data Architecture](#7--ai--data-architecture)
* [8. Mobile Frontend Architecture](#8--mobile-frontend-architecture)
* [9. Alur Request & Ingestion Data](#9--alur-request--ingestion-data)
* [10. CI/CD Pipeline](#10--cicd-pipeline)
* [11. Local Development](#11--local-development)
* [12. Definition of Done (DoD)](#12--definition-of-done-dod)
* [13. Quick Reference](#13--quick-reference)
* [14. Development Principle](#14--development-principle)

---

# 1. 🔄 Development Workflow

Nootid menggunakan pendekatan **Agile Development** dengan pembagian pekerjaan berdasarkan **User Story & Tasklist Granular** yang terdaftar di [`project-tasks/nootid-tasklist.md`](file:///D:/startup/nootid/project-tasks/nootid-tasklist.md).

Setiap task dikerjakan pada branch terpisah dan dilarang keras melakukan commit/push langsung pada branch utama.

Alur pengembangan resmi:

```text
User Story / Task (nootid-tasklist.md)
       │
       ▼
Create Feature Branch (feat/TASK-*)
       │
       ▼
Mobile Development (Flutter + Riverpod)
       │
       ▼
Pull Request → staging
       │
       ▼
CI Check (flutter analyze + flutter test)
       │
       ▼
Code Review (Min. 1 Peer Developer)
       │
       ▼
Squash & Merge ke staging
       │
       ▼
Build APK Staging Tester (GitHub Actions Artifact)
       │
       ▼
QA Testing (Emulator / Device Fisik)
       │
       ├─────────────── ❌ Bug / Overflow
       │                    │
       │                    ▼
       │              Create fix/* branch
       │                    │
       │                    ▼
       │              Merge ke staging
       │                    │
       │                    ▼
       │                 QA Ulang
       │
       └─────────────── ✅ Passed (Screenshots Don't Lie)
                            │
                            ▼
                     staging → main
                            │
                            ▼
             Build Android App Bundle (.aab)
                            │
                            ▼
              Rilis Google Play Console Track
```

---

# 2. 🌿 Branching Strategy

Nootid mengadopsi pola **Trunk-Based Development dengan Environment Branches** yang disesuaikan untuk siklus rilis biner mobile.

Struktur branch utama:

```text
main (Production / Google Play Store Track)
  │
  └── staging (Integrasi Fitur & Build APK Tester)
        │
        ├── feat/TASK-2.1-mascot-animation-canvas
        ├── feat/TASK-2.2-quick-link-bar-input
        ├── feat/TASK-3.1-social-link-parser
        ├── feat/TASK-3.2-whisper-gemini-pipeline
        └── fix/TASK-1.2-android-share-intent-null
```

## Branches

| Branch | Fungsi | Media Rilis / Target |
|---|---|---|
| `main` | Production / Versi rilis stabil siap uji Monev PKM-KC | Google Play Store (`.aab`) |
| `staging` | Integrasi fitur dan pengujian tim internal | GitHub Actions Release APK Tester |
| `feat/*` | Pengerjaan fitur baru spesifik per task | Lokal & PR ke staging |
| `fix/*` | Perbaikan cacat/overflow yang ditemukan QA | Lokal & PR ke staging |
| `refactor/*` | Perapian struktur kode tanpa mengubah fungsionalitas | Lokal & PR ke staging |
| `docs/*` | Pembaruan dokumentasi, Lean Canvas, atau anggaran RAB | Review tim |

### Aturan Utama
* `main` hanya berisi kode teruji yang siap dipublikasikan ke Google Play Store.
* `staging` adalah cabang integrasi; seluruh APK tester tim dikompilasi dari branch ini.
* Setiap task kodingan **wajib** dikerjakan pada branch terpisah yang dicabangkan dari `staging`.
* Dilarang push langsung (`git push origin main` atau `git push origin staging`).
* Semua integrasi wajib melalui **Pull Request** dengan minimal satu persetujuan rekan tim (*peer review*).

---

# 3. 🌱 Branch Naming Convention

Format nama branch harus secara eksplisit merefleksikan jenis pekerjaan dan nomor task yang tercantum di tasklist:

### Format Baku
```text
<type>/<TASK-ID>-<scope>-<description>
```

### Contoh yang Benar ✅:
```text
feat/TASK-2.1-mascot-chew-animation
feat/TASK-2.2-fe-quick-link-bar
feat/TASK-3.1-core-link-sanitizer
feat/TASK-3.2-ai-gemini-summarizer
fix/TASK-2.1-canvas-renderflex-overflow
hotfix/v1.0.1-gemini-quota-fallback
docs/budget-domain-domainesia-update
```

### Jenis Branch

| Type | Digunakan Untuk | Contoh |
|---|---|---|
| `feat` | Fitur mobile baru | `feat/TASK-2.1-mascot-canvas` |
| `fix` | Perbaikan bug pada staging | `fix/TASK-3.1-ig-link-null` |
| `hotfix` | Perbaikan kritis langsung di produksi Play Store | `hotfix/v1.0.1-crash-null-intent` |
| `refactor`| Perapian arsitektur atau controller Riverpod | `refactor/notes-repository-hive` |
| `docs` | Spesifikasi, Lean Canvas, atau panduan engineering | `docs/update-architecture-guide` |
| `test` | Penambahan unit test atau widget test | `test/mascot-controller-test` |

---

# 4. 🛠️ Workflow Pengembangan Per Task

## 4.1. Tentukan Task
Setiap pekerjaan wajib merujuk pada task spesifik di [`project-tasks/nootid-tasklist.md`](file:///D:/startup/nootid/project-tasks/nootid-tasklist.md).

Contoh:
```text
Fase 2: Komponen Inti & "Feed the Mascot" Engine
├── Task 2.1: Buat komponen MascotWidget (Animasi Nootti the Capybara)
├── Task 2.2: Buat komponen QuickLinkBar (Input URL medsos & tombol lempar)
└── Task 2.3: Integrasikan efek suara kunyah dopamin (SFX)
```

## 4.2. Sinkronisasi Kontrak Data & AI
Sebelum koding antarmuka dimulai, pastikan kontrak model data Dart dan skema respons JSON AI sudah disepakati di [`docs/01-arsitektur-dan-kode/03-api-contract-dan-response-builder.md`](file:///D:/startup/nootid/docs/01-arsitektur-dan-kode/03-api-contract-dan-response-builder.md).

Contoh model kontrak catatan:
```dart
class NoteModel {
  final String id;
  final String originalUrl;
  final String platform; // instagram, tiktok, youtube, x
  final String title;
  final String creatorName;
  final List<String> keyTakeaways; // 3 poin intisari dari Whisper + Gemini
  final List<String> tags;
  final DateTime createdAt;
  ...
}
```

## 4.3. Membuat Branch
Pastikan branch `staging` lokal sudah tersinkronisasi dengan remote:

```bash
git checkout staging
git pull origin staging
```

Kemudian buat branch fitur baru:
```bash
git checkout -b feat/TASK-2.1-mascot-animation
```

## 4.4. Development
Tulis kodingan secara modular di folder `lib/features/<nama_fitur>/`. Gunakan commit kecil berbasis [Conventional Commits](https://www.conventionalcommits.org/):

```bash
git add .
git commit -m "feat(mascot): implement canvas painter for capybara idle mood"
```

Lanjutkan ke langkah berikutnya:
```bash
git add .
git commit -m "feat(mascot): add chewing animation transition and sfx trigger"
```

## 4.5. Push Branch
```bash
git push -u origin feat/TASK-2.1-mascot-animation
```

## 4.6. Membuat Pull Request (PR)
Buat Pull Request di GitHub dengan konfigurasi:
* **Base**: `staging`
* **Compare**: `feat/TASK-2.1-mascot-animation`

Sertakan tangkapan layar (*screenshot*) emulator Android yang membuktikan bahwa fitur berjalan mulus tanpa error visual.

## 4.7. Squash and Merge ke Staging
Setelah PR lolos CI test dan disetujui reviewer, gunakan:
```text
Squash and Merge
```
Histori branch `staging` akan tetap bersih dan merepresentasikan satu unit fitur yang utuh.

## 4.8. QA Testing
Tim QA menguji biner APK hasil kompilasi staging pada smartphone fisik.
* **Jika Lolos (PASSED)**: Task dicentang `[x]` pada tasklist.
* **Jika Ditemukan Bug**: Buat branch `fix/TASK-...` dari `staging`, perbaiki, dan ajukan PR baru.

---

# 5. 🔀 Pull Request Rules

Setiap PR wajib mematuhi aturan berikut:

### Target Branch Matriks

| Cabang Asal | Target Cabang | Kebutuhan Review |
|---|---|---|
| `feat/*` | `staging` | Minimal 1 Code Reviewer + Lolos CI |
| `fix/*` | `staging` | Minimal 1 Code Reviewer + Lolos CI |
| `staging` | `main` | Lead Architect Review + Verifikasi QA |
| `hotfix/*` | `main` & `staging` | Review Cepat + Verifikasi Darurat |

### Aturan Mutlak:
1. Dilarang push langsung ke `main` dan `staging`.
2. Minimal satu anggota tim melakukan peninjauan kode (*peer review*).
3. GitHub Actions CI harus berstatus hijau (lolos `flutter analyze` & `flutter test`).
4. Bebas dari *merge conflict*.
5. Wajib menyertakan bukti screenshot/video singkat UI di deskripsi PR (*"Screenshots Don't Lie"*).
6. Gunakan opsi **Squash and Merge** untuk menjaga riwayat git tetap terstruktur.

---

# 6. 🏗️ Arsitektur Proyek (Flutter Feature-First)

Nootid menggunakan **Flutter 3.x** dengan arsitektur **Feature-First / Modular Architecture**:

```text
nootid/
├── android/                           # Proyek native Android (Intent Filter Share Sheet)
├── ios/                               # Proyek native iOS (Share Extension)
├── assets/                            # Aset visual & audio lokal
│   ├── animations/                    # File Rive / Lottie animasi Nootti
│   ├── audio/                         # Sound effect sfx (chew.mp3, pop.mp3)
│   └── icons/                         # Ikon SVG platform (IG, TikTok, YT, X)
│
├── docs/                              # DOKUMENTASI ENGINEERING RESMI
│   ├── 01-arsitektur-dan-kode/        # Arsitektur Flutter, Cache Hive, Kontrak AI, Keamanan 85 celah
│   ├── 02-devops-dan-infrastruktur/   # Git Branching, GitHub Actions CI/CD, Domain DomaiNesia, Secrets
│   ├── 03-sop-tim-dan-kolaborasi/     # Naming Conventions, Sprint DoD, Git Handbook & Rescue Kit
│   ├── 04-blueprint-proyek-baru/      # Tooling Catalog, Roadmap Day 0 ke Play Store, Checklist Legalitas
│   ├── 05-orkestrasi-agent-agency/    # Multi-Agent Pipeline, Roles Matrix, Dev-QA Loop, Reality Check
│   └── README.md                      # Indeks master seluruh dokumentasi engineering
│
├── project-specs/                     # Spesifikasi produk, Lean Canvas & Anggaran PKM (4 Skenario)
│   ├── nootid-setup.md                # Product spec lengkap & AI pipeline
│   ├── lean-canvas.md                 # Lean Canvas bisnis & monetisasi
│   └── anggaran-pkm-dan-operasional.md# RAB detail (6jt, 8jt, 10jt, 11jt) & Domain Rp 332.889
├── project-tasks/                     # Tasklist pengerjaan tim
│   └── nootid-tasklist.md             # Checklist perkembangan per fase
│
├── lib/                               # SOURCE CODE UTAMA (FLUTTER 3.x DART)
│   ├── main.dart                      # Entry point, ProviderScope, Supabase init
│   ├── app.dart                       # MaterialApp, Routing & Tema Zen
│   │
│   ├── core/                          # Fondasi Reusable Lintas Fitur
│   │   ├── constants/                 # AppColors (Zen Palette), AppTypography, AppAssets
│   │   ├── errors/                    # Failure & Exception classes
│   │   ├── network/                   # Dio client, Interceptor & SSL Pinning
│   │   ├── theme/                     # Light & Dark Theme
│   │   └── utils/                     # LinkSanitizer & DateFormatter
│   │
│   ├── features/                      # FITUR MODULAR (Feature-First)
│   │   ├── mascot/                    # Engine Virtual Pet "Nootti the Capybara"
│   │   │   ├── data/                  # MascotRepository (Hive / SharedPreferences)
│   │   │   ├── domain/                # MascotModel, MascotMood (idle, eating, happy, hungry)
│   │   │   ├── presentation/          # MascotWidget, MascotController (Riverpod)
│   │   │   └── widgets/               # CanvasChewPainter, MoodBubble, FeedButton
│   │   │
│   │   ├── notes_ingestion/           # Intake Link Medsos & AI Summarizer
│   │   │   ├── data/                  # NotesRepository, WhisperSTTService, GeminiSummarizerService
│   │   │   ├── domain/                # NoteModel, KeyTakeaway, SocialPlatformEnum
│   │   │   ├── presentation/          # QuickLinkBar, NoteDetailScreen, IngestionController
│   │   │   └── widgets/               # NoteCard, PlatformBadge, ReflectionInput
│   │   │
│   │   ├── pet_sanctuary/             # Kustomisasi & Peliharaan Tambahan (Miko, Robi)
│   │   │   ├── data/                  # CosmeticsRepository
│   │   │   ├── domain/                # AccessoryModel, PetTypeEnum
│   │   │   └── presentation/          # CustomizeMascotModal, WardrobeGrid
│   │   │
│   │   ├── recap_wrapped/             # Knowledge Screen Time (Monthly Recap 9:16)
│   │   │   ├── data/                  # RecapStatsRepository
│   │   │   ├── domain/                # MonthlyStatsModel, TopCategoryBreakdown
│   │   │   └── presentation/          # KnowledgeWrappedScreen, StoryShareCard916
│   │   │
│   │   └── auth_profile/              # Otentikasi Supabase & User Profile
│   │       ├── data/                  # AuthRepository (Supabase PKCE & Google Sign-In)
│   │       ├── domain/                # UserModel, AuthState
│   │       └── presentation/          # LoginScreen, ProfileScreen, AuthController
│   │
│   └── shared/                        # Komponen Antarmuka Bersama
│       └── widgets/                   # AppButton, AppTextField, EmptyStateCard, SkeletonCard
│
├── .env.example                       # Contoh template API keys (Groq, Gemini, Supabase)
├── pubspec.yaml                       # Manifest dependensi & asset Flutter
└── README.md                          # Panduan arsitektur & workflow tim (berkas ini)
```

---

# 7. 🛠️ AI & Data Architecture

Arsitektur data Nootid dirancang dengan filosofi **Local-First & Zero-Cost Serverless**:

| Komponen | Lokasi / Teknologi | Tanggung Jawab Utama |
|---|---|---|
| **Local Cache** | Hive CE / SQLite | Menyimpan daftar catatan, riwayat link, dan status Nootti secara offline di storage HP. |
| **STT Engine** | OpenAI Whisper Large-v3 (Groq API) | Mentranskripsi audio video reels/tiktok menjadi teks dalam hitungan milidetik (< 0.5s). |
| **NLP Summarizer** | Google Gemini 1.5 Flash (AI Studio) | Menganalisis transkrip dan menghasilkan 3 poin intisari tindakan konkret ke format JSON. |
| **Native Ingestion** | `receive_sharing_intent` | Menangkap payload tautan yang dibagikan dari tombol Share OS Android tanpa mengetik manual. |
| **Cloud Sync & Auth** | Supabase Flutter (Singapore) | Backup catatan pengguna multi-device & login akun Google via alur PKCE. |
| **Sanitizer Guard** | `LinkSanitizer` (Dart) | Membersihkan query tracking dan memblokir URL berbahaya sebelum diproses model AI. |

---

# 8. 🎨 Mobile Frontend Architecture

Frontend dibangun menggunakan **Flutter Widget Tree** dan dikendalikan oleh **Flutter Riverpod**:

```text
┌────────────────────────────────────────────────────────┐
│  Presentation Layer (UI Widgets & Screens)             │
│  - MascotWidget (Render grafis Nootti di Canvas)       │
│  - QuickLinkBar (Input link medsos interaktif)         │
│  - NoteCard (Daftar intisari wawasan & kategori)       │
└───────────────────────────┬────────────────────────────┘
                            │ ref.watch() / ref.read()
                            ▼
┌────────────────────────────────────────────────────────┐
│  State Management (Riverpod StateNotifier / Notifier)  │
│  - MascotController: Mengelola mood (eating, happy)    │
│  - IngestionController: Mengelola status loading AI    │
│  - NotesController: Mengelola filter & pencarian       │
└───────────────────────────┬────────────────────────────┘
                            │ Memanggil Repository
                            ▼
┌────────────────────────────────────────────────────────┐
│  Domain & Data Layer (Pure Dart Business Logic)        │
│  - NotesRepository ➔ Hive Local Box + Supabase Cloud  │
│  - AISummarizerService ➔ Groq Whisper + Gemini Flash   │
└────────────────────────────────────────────────────────┘
```

---

# 9. 🔄 Alur Request & Ingestion Data

## A. Alur Ingestion Normal (Share Sheet ➔ AI ➔ Feeding Mascot)

```text
[User di Instagram / TikTok / YouTube]
             │
             ▼ Klik "Share" ➔ Pilih "Nootid"
[Native Android Share Sheet (receive_sharing_intent)]
             │
             ▼
[LinkSanitizer]: Bersihkan parameter pelacak (fbclid, igsh, si)
             │
             ▼
[IngestionController]: Set status AI Loading
             │
             ├────────────────────────────────────────────────┐
             ▼                                                ▼
[Groq Cloud API (Whisper STT)]              [Nootti Animasi Kunyah Link]
  Transkripsi Audio Video ➔ Teks             + Efek Suara SFX (chew.mp3)
             │
             ▼
[Google AI Studio (Gemini 1.5 Flash)]
  Ekstraksi 3 Intisari Edukasi & Kategori JSON
             │
             ▼
[Simpan ke Database Lokal (Hive CE)] ──> UI Update Instan (< 50ms)
             │
             ▼
[Background Sync ke Supabase Cloud] (Jika user telah menghubungkan akun Google)
```

## B. Alur Offline (Mode Pesawat / Tanpa Sinyal)

Jika pengguna membagikan link saat offline:
1. URL disimpan ke antrean tunggu lokal (`PendingIngestionQueue` di SQLite/Hive).
2. Nootti tetap menampilkan reaksi ramah (*"Link disimpan! Nootti bakal kunyah pas ada sinyal ya, bro."*).
3. Saat koneksi internet kembali terdeteksi, `SyncManager` secara otomatis mengeksekusi antrean ke pipeline AI.

---

# 10. ⚡ CI/CD Pipeline

Nootid menggunakan **GitHub Actions** untuk memeriksa integritas kodingan secara otomatis pada setiap push/PR:

| Job Pipeline | Pemicu (Trigger) | Perintah Eksekusi | Target Lingkungan |
|---|---|---|---|
| **Static Analysis** | Push / Pull Request | `flutter analyze` | GitHub Ubuntu Runner |
| **Unit & Widget Test** | Push / Pull Request | `flutter test` | GitHub Ubuntu Runner |
| **Build Staging APK** | Merge ke `staging` | `flutter build apk --release` | GitHub Actions Artifact Siap Unduh |
| **Build Production AAB**| Merge ke `main` | `flutter build appbundle --release` | Google Play Console Internal Track |

---

# 11. 💻 Local Development

## 11.1. Prasyarat Lingkungan
Pastikan perangkat Anda telah terpasang:
* **Flutter SDK**: Versi `3.24.x` atau lebih baru (`flutter doctor` centang hijau).
* **Android Studio / VS Code**: Dengan ekstensi Flutter & Dart terpasang.
* **JDK**: OpenJDK 17.

## 11.2. Kloning Repositori & Pasang Dependensi
```bash
git clone https://github.com/your-org/nootid.git
cd nootid
flutter pub get
```

## 11.3. Konfigurasi Kunci Lingkungan (`.env`)
Salin file `.env.example` menjadi `.env`:
```bash
cp .env.example .env
```

Isi variabel kredensial lokal:
```env
GROQ_API_KEY=gsk_...
GEMINI_API_KEY=AIzaSy...
SUPABASE_URL=https://[project-ref].supabase.co
SUPABASE_ANON_KEY=eyJhbGciOi...
```

> ⚠️ **PENTING**: Dilarang meng-commit file `.env` ke repositori publik!

## 11.4. Menjalankan Aplikasi di Emulator / Smartphone Fisik
Pastikan smartphone Android terhubung via kabel USB dengan opsi **USB Debugging** aktif, lalu jalankan:

```bash
flutter run
```

Atau jalankan pada perangkat Chrome / Desktop untuk verifikasi tata letak cepat:
```bash
flutter run -d chrome
```

## 11.5. Pemeriksaan Kualitas Mandiri (Sebelum Membuat PR)
Sebelum membuka PR, jalankan pengujian lokal:
```bash
flutter analyze
flutter test
```
Pastikan seluruh pengujian menghasilkan output hijau tanpa warning fatal!

---

# 12. ✅ Definition of Done (DoD)

Sebuah tugas kodingan dinyatakan **SELESAI (DONE)** apabila memenuhi kriteria berikut:

### Kriteria Pengembangan:
* [ ] Mengacu pada nomor Task resmi di `project-tasks/nootid-tasklist.md`.
* [ ] Mengikuti arsitektur feature-first di `lib/features/`.
* [ ] Lolos analisis statis `flutter analyze` (Zero error & zero warning).
* [ ] Unit test terkait berstatus PASS (`flutter test`).
* [ ] Tampilan responsif pada smartphone compact (360px) & besar (412px) tanpa *RenderFlex overflow*.
* [ ] Animasi Nootti the Capybara berjalan mulus di 60 FPS tanpa jank memori.
* [ ] Bebas dari hardcoded secret API key di kodingan Dart.

### Kriteria Pull Request:
* [ ] Branch menggunakan format baku: `feat/TASK-...` atau `fix/TASK-...`.
* [ ] Target branch adalah `staging`.
* [ ] Disertai bukti visual (*screenshot/video*) pada deskripsi PR.
* [ ] Lolos pengujian otomatis GitHub Actions.
* [ ] Telah direview dan disetujui (*Approved*) oleh rekan tim.
* [ ] Digabungkan menggunakan metode **Squash and Merge**.

---

# 13. 📌 Quick Reference

### Navigasi Git Harian
```bash
# Tarik pembaruan staging
git checkout staging
git pull origin staging

# Buat branch task baru
git checkout -b feat/TASK-2.1-mascot-animation

# Simpan perubahan
git add .
git commit -m "feat(mascot): add capybara chew animation"

# Push ke remote
git push -u origin feat/TASK-2.1-mascot-animation
```

### Flutter Commands
```bash
flutter pub get               # Unduh paket dependensi
flutter analyze               # Periksa kualitas dan sintaks kode
flutter test                  # Jalankan seluruh unit/widget test
flutter build apk --release   # Kompilasi file APK rilis
flutter build appbundle       # Kompilasi Android App Bundle (.aab)
```

---

# 14. 🚀 Development Principle

> **One Task → One Branch → One Pull Request → Peer Review → Staging APK → QA Evidence → Google Play Store**

Setiap baris kode yang ditulis untuk **Nootid** harus dapat dipertanggungjawabkan kualitasnya, menjaga keamanan data pengguna, dan menyebarkan budaya belajar yang menenangkan (*Mindful Learning*) bagi generasi muda Indonesia.

*Salam Tim Nootid — Found It, Noted It!* 🦫✨
