# 📋 Checklist Kesiapan Rilis Google Play Store & Legalitas PKM-KC

Halo tim Nootid! Dokumen ini adalah panduan periksa wajib sebelum aplikasi mobile **Nootid** diajukan ke Google Play Console dan didaftarkan hak ciptanya ke DJKI Kemenkumham.

---

## 1. Kepatuhan Hukum & Regulasi Privasi (UU PDP No. 27/2022)

Google Play Store dan regulasi hukum Indonesia mewajibkan aplikasi memiliki transparansi data:

- [ ] **Privacy Policy Publik**: Halaman `https://nootid.app/privacy` aktif dan dapat diakses publik tanpa login.
- [ ] **Deklarasi Pengumpulan Data**: Menjelaskan bahwa Nootid hanya mengumpulkan URL media sosial untuk ekstraksi rangkuman edukasi dan email akun Google jika user memilih login sinkronisasi cloud.
- [ ] **Prinsip Minimasi Izin (Zero Danger Permissions)**: Aplikasi hanya meminta izin koneksi jaringan (`INTERNET`). Tidak meminta akses kamera, kontak, mikrofon, atau lokasi.
- [ ] **Mekanisme Hak Hapus Akun (Account Deletion)**: Sesuai aturan Google Play terbaru, sediakan opsi tombol *"Hapus Akun & Data Saya"* di menu pengaturan profil.

---

## 2. Tabel 20 Kriteria Kesiapan Rilis Google Play Store

| No | Kriteria Kesiapan | Status | Standar Persyaratan Teknis Google Play |
|---|---|:---:|---|
| 1 | **Ikon Aplikasi Beresolusi Tinggi** | [ ] | PNG 32-bit, ukuran persis 512 x 512 px, max 1MB. |
| 2 | **Grafis Fitur (Feature Graphic)** | [ ] | JPEG atau PNG 24-bit, ukuran persis 1024 x 500 px. |
| 3 | **Tangkapan Layar Ponsel (Screenshots)** | [ ] | Minimal 4 tangkapan layar rasio 16:9 atau 9:16 resolusi HD. |
| 4 | **Deskripsi Singkat (Short Description)**| [ ] | Maksimal 80 karakter: *"Second brain medsos & rangkuman AI bareng maskot Nootti si Kapibara."* |
| 5 | **Deskripsi Lengkap (Full Description)** | [ ] | Maksimal 4.000 karakter menjelaskan fitur, AI stack, dan manfaat. |
| 6 | **Kategori Aplikasi** | [ ] | Pilih kategori **Education (Pendidikan)**. |
| 7 | **Rating Konten (IARC Questionnaire)** | [ ] | Isi kuesioner rating konten (Target: Semua Umur / Pegi 3 / Everyone). |
| 8 | **Target Audiens** | [ ] | Target audiens: Usia 13 tahun ke atas (Remaja & Mahasiswa). |
| 9 | **Bagian Keamanan Data (Data Safety)** | [ ] | Deklarasikan data yang dikumpulkan (Email opsional, Data catatan). |
| 10 | **URL Kebijakan Privasi** | [ ] | Tautkan `https://nootid.app/privacy`. |
| 11 | **URL Dukungan / Support** | [ ] | Tautkan `https://nootid.app/support` atau email `contact@nootid.app`. |
| 12 | **Target API Level Terbaru** | [ ] | Android Target SDK 34 (Android 14) atau lebih tinggi di `build.gradle`. |
| 13 | **Dukungan Arsitektur 64-bit** | [ ] | Otomatis dipenuhi oleh Flutter AOT build engine. |
| 14 | **Format Biner Android App Bundle** | [ ] | Wajib format `.aab` (bukan `.apk` mentah untuk upload toko). |
| 15 | **Kode Versi Unik** | [ ] | Pastikan `versionCode` lebih tinggi dari versi build sebelumnya. |
| 16 | **Obfuskasi Kode R8 Aktif** | [ ] | `minifyEnabled true` terpasang tanpa error pada biner release. |
| 17 | **Uji Bebas Crash (Zero ANR)** | [ ] | Uji coba di smartphone fisik minimal 15 menit tanpa freeze atau crash. |
| 18 | **Lolos Review Play App Signing** | [ ] | Kunci keystore terkonfigurasi dengan aman. |
| 19 | **Program Closed Testing 14 Hari** | [ ] | Daftarkan minimal 20 tester internal (rekan kampus PKM) untuk uji coba. |
| 20 | **Tagline & Hak Cipta Terpasang** | [ ] | Tagline resmi *"Found It, Noted It"* tertera jelas pada deskripsi. |

---

## 3. Checklist Dokumen Pendukung Monev PKM-KC & HKI DJKI

- [ ] **Sertifikat Hak Cipta DJKI**: Pendaftaran program komputer melalui portal resmi DJKI Kemenkumham (alokasi dana Rp 200.000 dari anggaran administrasi PKM).
- [ ] **Buku Catatan Harian (Logbook)**: Dokumentasi mingguan kemajuan pengembangan perangkat lunak di sistem Simbelmawa.
- [ ] **Bukti Validasi Responden Pengguna**: Hasil survei kemudahan penggunaan (SUS - System Usability Scale) dari 20–50 responden mahasiswa yang mencoba Nootid (alokasi insentif Rp 1.5jt - Rp 4jt).
- [ ] **Tautan Live Google Play Store**: Bukti link aplikasi aktif yang dapat diunduh langsung oleh dosen penilai Monev Kemendikbudristek.
