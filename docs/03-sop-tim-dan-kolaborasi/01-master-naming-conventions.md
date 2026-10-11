# 🏷️ Standar Master Penamaan: Dart/Flutter, Issue, Branch, & Commit

Halo kawan-kawan tim Nootid! Dokumen ini adalah **Kamus Resmi Penamaan** untuk semua aktivitas penulisan kode dan manajemen versi di repositori **Nootid**.

---

## 1. Konvensi Penamaan Kode Dart & Flutter (Official Dart Style Guide)

| Elemen Kodingan | Aturan Format | Contoh yang BENAR ✅ | Contoh yang SALAH ❌ |
|---|---|---|---|
| **Nama File & Folder** | `snake_case` | `mascot_widget.dart`, `note_card.dart` | `MascotWidget.dart`, `note-card.dart` |
| **Nama Class & Widget** | `PascalCase` | `MascotController`, `NoteDetailScreen` | `mascot_controller`, `noteDetailScreen` |
| **Nama Variabel & Fungsi**| `camelCase` | `feedMascot()`, `currentEnergyLevel` | `FeedMascot()`, `current_energy_level` |
| **Nama Enum & Tipe Nilai**| `PascalCase` (tipe) & `camelCase` (nilai) | `enum MascotMood { idle, eating, happy }` | `enum mascot_mood { IDLE, EATING }` |
| **Nama Konstanta Global** | `camelCase` (awalan `k` opsional) | `kDefaultPadding`, `primaryBrandColor` | `DEFAULT_PADDING`, `PRIMARY_COLOR` |

---

## 2. Standar Judul Tiket Task (GitHub Issues / Projects)

Format baku:
```text
[TAG] <ID-Tiket>: <Penjelasan Singkat Fitur atau Bug>
```

| Tag Wajib | Kapan Digunakan? | Contoh yang BENAR ✅ |
|---|---|---|
| `[FEAT]` | Pembuatan fitur aplikasi baru | `[FEAT] TASK-2.1: Komponen Animasi Nootti the Capybara` |
| `[BUG]` | Perbaikan error atau cacat tampilan | `[BUG] TASK-3.2: Render Overflow pada Card Ringkasan AI` |
| `[REFACTOR]`| Perapian kode tanpa mengubah fitur | `[REFACTOR] Core: Optimasi Cache Hive State Management` |
| `[DOCS]` | Penulisan spesifikasi atau RAB PKM | `[DOCS] Budget: Update Rincian Domain DomaiNesia` |
| `[CHORE]` | Konfigurasi pubspec atau CI/CD | `[CHORE] Gradle: Setup Obfuskasi R8 untuk Release AAB` |

---

## 3. Standar Nama Branch Git

Format resmi:
```text
<jenis>/<ID-Tiket>-<deskripsi-singkat>
```

- Semua huruf kecil (*lowercase*).
- Gunakan tanda strip `-` pemisah kata (tanpa spasi/garis bawah).
- Contoh: `feat/task-2.1-mascot-canvas`, `fix/task-3.1-ig-link-regex`.

---

## 4. Standar Pesan Commit (Conventional Commits)

Format resmi:
```text
<jenis>(<cakupan>): <pesan santai huruf kecil semua tanpa titik>
```

| Jenis Commit | Penggunaan di Proyek Nootid | Contoh |
|---|---|---|
| `feat` | Menambah fitur baru pengguna | `feat(mascot): tambahkan ekspresi ngunyah link nootti` |
| `fix` | Memperbaiki bug fungsional | `fix(ingestion): tangani timeout api whisper saat koneksi lemot` |
| `refactor` | Memperbaiki struktur kode | `refactor(riverpod): pisahkan controller catatan dari ui layer` |
| `docs` | Menambah atau mengubah dokumentasi | `docs(spec): sinkronisasi rincian anggaran 4 skenario pkm` |
| `perf` | Meningkatkan performa / fps | `perf(canvas): optimasi repaint boundary pada animasi maskot` |
| `chore` | Update dependensi pubspec | `chore(deps): upgrade riverpod ke versi 2.5` |
