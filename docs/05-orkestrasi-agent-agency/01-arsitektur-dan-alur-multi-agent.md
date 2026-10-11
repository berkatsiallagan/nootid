# 🧠 Panduan Arsitektur & Alur Kerja Multi-Agent (Agency Orchestration Pipeline)

Halo tim developer dan agent AI! Dokumen ini merangkum **Alur Kerja Otonom Multi-Agent (Agency Autonomous Pipeline)** untuk pembangunan ekosistem aplikasi mobile **Nootid**, mengadopsi standar sistem rekayasa otonom dari spesialis **`agency-agents-orchestrator`**.

Standar ini memastikan eksekusi dari dokumen spesifikasi produk (`project-specs/nootid-setup.md`) menuju implementasi siap rilis di Google Play Store berjalan terstruktur, berkualitas tinggi, anti-halusinasi, dan terlindungi oleh gerbang validasi ketat (*Quality Gates*).

---

## 1. Filosofi & Siklus Utama Pipeline Agency

Pipeline Agency bekerja dengan prinsip **"No Shortcuts, Evidence Required, Zero Fantasy Approvals"**. Tidak ada tugas koding yang dianggap selesai sebelum diverifikasi oleh bukti nyata (*evidence*) pada layar fisik atau emulator.

```text
┌──────────────────────────────────────────────────────────────────────────┐
│ FASE 1: Project Analysis & Planning (agency-senior-project-manager)      │
│  - Baca spesifikasi nootid-setup.md secara harfiah                      │
│  - Pecah jadi tugas granular (30-60 menit) di project-tasks/             │
└────────────────────────────────────┬─────────────────────────────────────┘
                                     │
                                     ▼
┌──────────────────────────────────────────────────────────────────────────┐
│ FASE 2: Technical Architecture & Mobile UX Foundation (agency-ux-arch)   │
│  - Bangun fondasi warna, typografi, dan layout responsif Flutter         │
│  - Rancang canvas state animasi Nootti the Capybara                      │
│  - Tetapkan kontrak data model & Riverpod state controllers              │
└────────────────────────────────────┬─────────────────────────────────────┘
                                     │
                                     ▼
┌──────────────────────────────────────────────────────────────────────────┐
│ FASE 3: Continuous Dev-QA Loop (Per-Task Validation)                     │
│  ┌────────────────────────────────────────────────────────────────────┐  │
│  │ 1. Developer Specialist implementasi task (Flutter / Riverpod)     │  │
│  │ 2. EvidenceQA (agency-evidence-collector) uji tampilan & fungsional │  │
│  │    - Tangkapan layar emulator / device fisik                       │  │
│  │    - Keputusan: PASS -> Lanjut ke Task Berikutnya                  │  │
│  │                 FAIL -> Loop balik ke Dev + feedback (Maks 3x)     │  │
│  └────────────────────────────────────────────────────────────────────┘  │
└────────────────────────────────────┬─────────────────────────────────────┘
                                     │
                                     ▼
┌──────────────────────────────────────────────────────────────────────────┐
│ FASE 4: Final Integration & Reality Check (agency-reality-checker)       │
│  - Pengujian end-to-end menyeluruh (Simulasi lempar link medsos ➔ AI)    │
│  - Smoke Test 10 Poin sebelum build Android App Bundle (.aab)             │
│  - Default status: "NEEDS WORK" sampai bukti mutlak terpenuhi            │
└──────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Rincian Eksekusi Tiap Fase

### Fase 1: Perencanaan Proyek (`agency-senior-project-manager`)
- Menganalisis spesifikasi resmi `project-specs/nootid-setup.md`.
- Menolak penambahan fitur berlebihan yang tidak diminta (misalnya: tidak membuat sistem web scraper ilegal jika bisa memakai share intent).
- Menyusun kartu tugas granular di `project-tasks/nootid-tasklist.md`.

### Fase 2: Fondasi Arsitektur & UX Mobile (`agency-ux-architect`)
- Menetapkan palette warna Capybara Zen (warna cokelat hangat, krem lembut, hijau sage anti-FOMO).
- Menentukan batas komponen kanvas interaktif Nootti.
- Menyusun arsitektur feature-first di `lib/features/`.

### Fase 3: Siklus Dev-QA Mandiri (`agency-evidence-collector`)
- Setiap kali developer menyelesaikan 1 task (contoh: Task 2.1 Mascot Widget), EvidenceQA langsung menguji di viewport smartphone.
- Jika ada overflow atau animasi lag, tugas dikembalikan dengan instruksi perbaikan spesifik.
- Toleransi retry maksimal 3 kali sebelum eskalasi ke lead architect.

### Fase 4: Gerbang Sertifikasi Produksi (`agency-reality-checker`)
- Menjalankan 10 poin pemeriksaan mutlak sebelum rilis file `.aab` ke Google Play Store.
- Menolak klaim sepihak tanpa bukti tangkapan layar nyata.
