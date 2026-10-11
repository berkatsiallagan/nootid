# 🚀 Panduan Eksekusi Lengkap: Dari Nol (Day 0) Sampai Rilis Google Play Store

Halo tim Nootid! Dokumen ini adalah peta jalan eksekusi langkah demi langkah dari hari pertama (*Day 0*) hingga aplikasi mobile **Nootid** terbit di Google Play Store dan siap diuji pada evaluasi **Monev PKM-KC**.

Ikuti tahapan ini secara kronologis:

---

## 🗺️ Peta 10 Tahapan Pengerjaan

```text
[Tahap 1: Akun Cloud, Domain & Play Console] ──> [Tahap 2: Inisialisasi Project Flutter]
                    │                                             │
                    ▼                                             ▼
[Tahap 3: Native Android Share Sheet Intent] ──> [Tahap 4: Local Storage Hive/SQLite]
                    │                                             │
                    ▼                                             ▼
[Tahap 5: Animasi Nootti the Capybara & SFX] ──> [Tahap 6: Pipeline AI Whisper & Gemini]
                    │                                             │
                    ▼                                             ▼
[Tahap 7: Gamifikasi, Wardrobe & Wrapped]   ──> [Tahap 8: CI/CD Build APK & App Bundle]
                    │                                             │
                    ▼                                             ▼
[Tahap 9: Landing Page & Privacy Policy]     ──> [Tahap 10: Rilis Play Store & Monev PKM]
```

---

### TAHAP 1: Kesiapan Akun & Registrasi Eksternal
1. Ambil domain resmi `nootid.app` di DomaiNesia (Rp 332.889).
2. Daftarkan akun Google Play Console ($25 / Rp 410.000).
3. Buat API key gratis di Groq Cloud (Whisper) dan Google AI Studio (Gemini 1.5 Flash).
4. Buat project Supabase di region Singapore (ap-southeast-1).

### TAHAP 2: Inisialisasi Project Flutter
1. Jalankan inisialisasi:
   ```bash
   flutter create --org app.nootid --platforms android,ios nootid
   ```
2. Daftarkan dependensi di `pubspec.yaml`:
   - `flutter_riverpod`, `receive_sharing_intent`, `hive_ce`, `shared_preferences`, `flutter_svg`, `audioplayers`, `dio`, `flutter_dotenv`.
3. Buat struktur folder modular sesuai panduan arsitektur feature-first.

### TAHAP 3: Integrasi Native Android Share Sheet
1. Buka `android/app/src/main/AndroidManifest.xml`.
2. Tambahkan `<intent-filter>` untuk menerima action `android.intent.action.SEND` dengan MIME type `text/plain`.
3. Hubungkan package `receive_sharing_intent` di Flutter agar URL yang dibagikan dari IG/TikTok langsung memicu pembukaan Nootid.

### TAHAP 4: Fondasi Data Layer & Local Cache
1. Inisialisasi Hive box untuk menyimpan list `notes` dan objek data `mascot`.
2. Pastikan operasi CRUD catatan bekerja 100% saat device dalam keadaan offline (airplane mode).

### TAHAP 5: Animasi Nootti the Capybara & Sound FX
1. Buat widget `MascotWidget` dengan Canvas / SVG.
2. Tambahkan state animasi: `idle` (santai/zen), `eating` (mengunyah), `happy` (loncat senang), dan `hungry` (muka memelas jika lama tidak diisi).
3. Sambungkan efek suara kunyah dopamin (`chew.mp3`) menggunakan `audioplayers`.

### TAHAP 6: Integrasi Pipeline AI Ingestion
1. Buat service penghubung ke Groq Whisper Large-v3 untuk mentranskripsi audio video.
2. Buat service Google Gemini 1.5 Flash untuk mengekstrak 3 intisari edukasi ke format JSON.
3. Pasang validasi link dan sistem prompt anti-injection.

### TAHAP 7: Gamifikasi & Knowledge Wrapped
1. Buat modal kustomisasi Nootti (topi wisuda, kacamata nerd) & preview *Pet Sanctuary*.
2. Rancang kartu rekap bulanan 9:16 ala Spotify Wrapped yang siap di-ekspor/share ke Instagram Story.

### TAHAP 8: Otomasi CI/CD GitHub Actions
1. Pasang file `.github/workflows/flutter-ci-cd.yml`.
2. Verifikasi automated runner berhasil mengompilasi APK pengujian dan file `.aab` rilis.

### TAHAP 9: Hosting Landing Page & Halaman Legalitas
1. Deploy landing page statis ke Cloudflare Pages terhubung ke domain `nootid.app`.
2. Sediakan halaman publik `https://nootid.app/privacy` dan `https://nootid.app/terms` sesuai standar UU PDP No. 27/2022.

### TAHAP 10: Rilis Google Play Store & Presentasi Monev PKM
1. Siapkan aset toko: Ikon 512x512 px, Grafis Fitur 1024x500 px, dan tangkapan layar smartphone.
2. Unggah Android App Bundle (`app-release.aab`) ke track Closed / Open Testing Google Play Console.
3. Kumpulkan data feedback responden testing awal sebagai materi bukti nyata presentasi Monev PKM-KC!
