# 🛡️ Gerbang Kelayakan Produksi: Smoke Test 10-Poin & Reality Check Nootid

Halo tim pengembang! Dokumen ini adalah benteng pertahanan terakhir sebelum biner rilis **Nootid** (`app-release.aab`) diunggah ke Google Play Console, diawasi langsung oleh spesialis **`agency-reality-checker`**.

Prinsip mutlak: **"DEFAULT TO NEEDS WORK — Status proyek selalu dianggap belum layak rilis sampai seluruh 10 poin audit di bawah ini terbukti valid dengan rekaman nyata."**

---

## 1. Lembar Verifikasi Smoke Test 10-Poin Mobile Nootid

Sebelum mengajukan rilis versi ke Google Play Store atau demo penjurian PKM-KC, lakukan pengujian 10 langkah ini secara berurutan:

| No | Poin Pengujian Smoke Test | Skenario Uji Nyata | Standar Kelulusan (PASS) | Status |
|---|---|---|---|:---:|
| 1 | **Cold App Launch** | Buka aplikasi dari kondisi mati total (*cold start*). | Aplikasi terbuka dalam < 2 detik langsung menampilkan Nootti yang siap berinteraksi. | [ ] |
| 2 | **Native Share Sheet Intake** | Dari aplikasi Instagram/TikTok, klik Share ➔ Pilih Nootid. | Nootid langsung terbuka, URL tertangkap otomatis tanpa perlu paste manual. | [ ] |
| 3 | **Animasi Kunyah & Audio SFX** | Tekan tombol *"Feed to Mascot"*. | Animasi makan berjalan mulus, suara kunyah berbunyi, exp Nootti bertambah. | [ ] |
| 4 | **Ekstraksi AI Whisper & Gemini** | Tunggu proses perangkuman link edukasi. | Muncul judul video yang akurat dan 3 butir intisari edukasi yang mudah dibaca. | [ ] |
| 5 | **Simulasi Offline (Airplane Mode)**| Hidupkan Mode Pesawat, coba buka riwayat catatan. | Semua catatan sebelumnya tetap terbaca utuh dari database lokal Hive/SQLite. | [ ] |
| 6 | **Debounce Double-Tap** | Ketuk tombol kirim link 5 kali secara cepat bertubi-tubi. | Hanya 1 proses AI yang tereksekusi; tombol terkunci selama proses berlangsung. | [ ] |
| 7 | **Sanitasi Link Aneh** | Masukkan teks acak atau URL non-medsos (cth: `google.com`). | Muncul notifikasi validasi ramah, aplikasi tidak force close. | [ ] |
| 8 | **Kustomisasi Maskot** | Ubah nama Nootti dan pasang aksesori topi wisuda. | Tampilan Nootti langsung berubah dan tersimpan saat aplikasi ditutup lalu dibuka lagi. | [ ] |
| 9 | **Export Monthly Recap (9:16)** | Klik tombol bagikan rekap bulanan ke Instagram Story. | Kartu grafis 9:16 ter-generate rapi dan dialog share sheet sistem Android muncul. | [ ] |
| 10| **Audit Memory Leak & Crash** | Gunakan aplikasi selama 10 menit terus-menerus. | Memori RAM stabil (< 150 MB), frame rate tetap 60 FPS, zero crash. | [ ] |

---

## 2. Syarat Mutlak Persetujuan RealityChecker

Sebuah versi biner hanya dapat disetujui untuk rilis jika:
1. Kesepuluh poin di atas berstatus **PASS** dengan bukti pengujian nyata.
2. Tidak ada kebocoran rahasia (API key) pada file APK biner.
3. Halaman kebijakan privasi `https://nootid.app/privacy` aktif dan dapat diakses.

Jika satu saja poin di atas gagal, status rilis langsung ditolak dan dikembalikan ke tim pengembang untuk perbaikan!
