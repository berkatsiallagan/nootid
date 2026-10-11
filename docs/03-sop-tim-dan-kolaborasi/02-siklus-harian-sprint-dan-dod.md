# ⏱️ Siklus Harian Sprint & Standar Definition of Done (DoD)

Halo kawan-kawan tim Nootid! Di dokumen ini kita menyepakati ritme kerja harian tim mahasiswa PKM-KC dan daftar periksa mutlak **Definition of Done (DoD)** sebelum sebuah tugas dianggap selesai (*done*).

---

## 1. Ritme Kerja Harian (The 15-Minute Sync)

Sebagai tim startup mahasiswa yang memiliki jadwal kuliah beragam, kita mengadopsi sinkronisasi asynchronous 15 menit setiap malam di grup chat:

1. **Apa yang selesai hari ini?** (Sebutkan nomor Task di `project-tasks/nootid-tasklist.md`).
2. **Apa yang dikerjakan besok?** (Fokus pada 1 task berbobot 30–60 menit).
3. **Ada hambatan teknis (*blocker*)?** (Misal: emulator ngadat, API key kena limit, animasi patah-patah).

---

## 2. Checklist Wajib Definition of Done (DoD)

Sebuah tugas kodingan **DILARANG DICENTANG `[x]`** di `nootid-tasklist.md` sebelum memenuhi 7 kriteria DoD berikut:

- [ ] **1. Kepatuhan Spesifikasi**: Sesuai 100% dengan dokumen acuan `project-specs/nootid-setup.md` (tidak menambah fitur fiktif atau mengurangi fungsi inti).
- [ ] **2. Lolos Flutter Analyze**: Menjalankan pengecekan statis tanpa warning atau error fatal.
- [ ] **3. Uji Perangkat Nyata / Emulator**: Tampilan diuji minimal pada satu ukuran layar ponsel Android (resolusi standar 1080x2400 / 390px viewport) bebas kebocoran tata letak (*RenderFlex overflow yellow-black stripes*).
- [ ] **4. Responsif & Smooth Frame Rate**: Animasi interaktif (Nootti makan/senang) berjalan mulus di 60 FPS tanpa jank.
- [ ] **5. Penanganan Keadaan Kosong (Empty State)**: Jika belum ada catatan atau link, antarmuka menampilkan ilustrasi ramah Nootti yang mengajak user membagikan link pertamanya.
- [ ] **6. Isolasi Secrets**: Tidak ada token API Groq, Gemini, atau Supabase yang tertinggal di baris kode Dart.
- [ ] **7. Riwayat Commit Terstruktur**: Perubahan di-commit menggunakan Conventional Commits yang jelas.
