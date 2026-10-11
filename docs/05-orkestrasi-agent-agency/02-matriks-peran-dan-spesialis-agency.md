# 👥 Matriks Peran & Spesialisasi Agency Skills untuk Nootid

Halo tim! Dokumen ini memetakan pembagian tanggung jawab antara peran manusia dan spesialis agent AI (**Agency Skills Suite**) dalam pengembangan produk **Nootid**.

---

## 1. Peta Matriks Peran

| Nama Spesialis Agent | Peran Kunci di Nootid | Tanggung Jawab Utama |
|---|---|---|
| **`agency-agents-orchestrator`** | Master Pipeline Governor | Mengatur urutan eksekusi fase, delegasi tugas ke subagent, dan memastikan alur berjalan tertib tanpa deviasi. |
| **`agency-senior-project-manager`** | Manajer Proyek & Scope | Menjaga kepatuhan ruang lingkup spesifikasi resmi, memecah tugas ke `project-tasks/nootid-tasklist.md`, dan mencegah *scope creep*. |
| **`agency-ux-architect`** | Arsitek UX & Visual Mobile | Mendesain tata letak antarmuka mobile, proporsi ukuran kanvas Nootti the Capybara, palet warna Zen, dan ritme mikrointeraksi dopamin. |
| **`agency-mobile-app-builder`** | Implementor Flutter & Dart | Menulis kode modular feature-first di `lib/features/`, mengonfigurasi Riverpod, animasi Canvas, dan integrasi Android Share Sheet. |
| **`agency-api-tester`** | Spesialis Validasi API & AI | Memvalidasi ketahanan pemanggilan Groq Whisper Large-v3 STT dan Google Gemini 1.5 Flash summarizer terhadap variasi URL medsos. |
| **`agency-evidence-collector`** | Penguji Berbasis Bukti (EvidenceQA) | Mengambil bukti visual tangkapan layar di emulator/device fisik, memverifikasi ketiadaan overflow, dan mencatat deviasi kualitas. |
| **`agency-reality-checker`** | Penjaga Kualitas Rilis Akhir | Memegang teguh prinsip "Default to NEEDS WORK", mengaudit biner release sebelum upload Google Play Console. |
| **`agency-app-store-optimizer`** | Spesialis ASO & Play Store | Mengoptimalkan deskripsi aplikasi, judul kata kunci, ikon 512x512, dan strategi listing di Google Play Store. |

---

## 2. Aturan Komunikasi Antar-Peran

1. **Komunikasi Berbasis Berkas**: Setiap perpindahan fase ditandai dengan pembaruan status pada file dokumentasi (`project-tasks/nootid-tasklist.md` atau `docs/`).
2. **Tidak Ada Asumsi**: Jika developer menemukan ketidakjelasan pada format link medsos atau perilaku maskot, wajib meminta klarifikasi ke PM, bukan mengarang fitur sendiri.
3. **Penyampaian Masalah Terbuka**: Celah keamanan atau potensi lonjakan kuota API wajib dilaporkan di awal agar dapat dimitigasi segera.
