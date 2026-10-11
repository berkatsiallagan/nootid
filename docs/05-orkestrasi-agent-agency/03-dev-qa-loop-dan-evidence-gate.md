# 🔍 Siklus Berkelanjutan Dev-QA Loop & Gerbang Validasi Berbasis Bukti (Evidence Gate)

Halo tim! Dokumen ini menetapkan standar pengujian kualitas per-tugas (*task-by-task continuous validation*) yang diawasi langsung oleh **`agency-evidence-collector` (EvidenceQA)** pada proyek mobile **Nootid**.

Prinsip mutlak yang dipegang teguh: **"Screenshots Don't Lie — Klaim tanpa bukti visual dan rekaman hasil uji adalah fatamorgana (*fantasy reporting*)."**

---

## 1. Siklus Dev-QA Loop per Tugas

Setiap kartu tugas di `project-tasks/nootid-tasklist.md` wajib melalui siklus 4 langkah berikut:

```text
┌─────────────────────────────────────────────────────────────┐
│ 1. Developer Implementasi Tugas                             │
│    - Menulis kode modular di lib/features/<fitur>/          │
│    - Melakukan self-check lokal di emulator                 │
│    - Menandai tugas siap diuji                              │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 2. EvidenceQA Menjalankan Uji Berbasis Bukti                │
│    - Menjalankan flutter test & visual inspect di emulator   │
│    - Memeriksa kesesuaian dengan spesifikasi nootid-setup.md│
│    - Mengambil bukti screenshot di berbagai ukuran layar    │
└──────────────────────────────┬──────────────────────────────┘
                               │
               ┌───────────────┴───────────────┐
               ▼                               ▼
       [ Hasil: PASS ]                  [ Hasil: FAIL ]
               │                               │
               ▼                               ▼
┌─────────────────────────────┐  ┌─────────────────────────────┐
│ 3A. Validasi Diterima       │  │ 3B. Umpan Balik Perbaikan   │
│ - Tugas dicentang [x]       │  │ - Catat bukti visual cacat  │
│ - Reset penghitung retry    │  │ - Uraikan deviasi spesifik  │
│ - Lanjut ke tugas berikutnya│  │ - Increment retry counter   │
└─────────────────────────────┘  └──────────────┬──────────────┘
                                                │
                                                ▼
                                 ┌─────────────────────────────┐
                                 │ 4. Pengulangan / Eskalasi   │
                                 │ - Bila Retry < 3: Loop balik│
                                 │ - Bila Retry >= 3: Eskalasi │
                                 └─────────────────────────────┘
```

---

## 2. Metodologi Pengujian Berbasis Bukti di Nootid

### A. Uji Tampilan & Tata Letak Mobile (Visual Screenshots)
1. Setiap layar diuji pada 2 variasi ukuran layar:
   - **Compact Smartphone**: 360x780 px (Android compact).
   - **Large Smartphone**: 412x915 px (Android Flagship / Pixel).
2. Verifikasi ketiadaan garis kuning-hitam (*RenderFlex overflow stripes*).
3. Verifikasi kontras teks intisari AI agar nyaman dibaca oleh mata mahasiswa.

### B. Uji Interaksi Animasi Nootti the Capybara
1. Verifikasi animasi transisi:
   - Link dilempar ➔ Nootti membuka mulut ➔ Partikel kunyah dopamin muncul ➔ Nootti tersenyum puas (*Happy/Zen*).
2. Efek audio kunyah terpicu tepat waktu tanpa jeda (*audio latency < 100ms*).
3. FPS stabil di angka 60 FPS pada perangkat pengujian.

### C. Uji Ketahanan Jaringan & Offline
1. Masukkan URL saat mode pesawat aktif: aplikasi tidak boleh crash (*force close*), melainkan menyimpan link ke antrean tunggu lokal.
2. Saat koneksi kembali, sistem secara anggun melanjutkan ekstraksi tanpa intervensi manual yang rumit.
