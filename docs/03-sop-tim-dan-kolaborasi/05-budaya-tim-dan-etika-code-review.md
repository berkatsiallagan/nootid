# 🤝 Budaya Kolaborasi Tim & Etika Code Review Nootid

Halo rekan-rekan pengembang Nootid! Pengembangan startup kemahasiswaan berbasis teknologi mutakhir (**PKM-KC**) membutuhkan sinergi tim yang suportif, transparan, dan saling menguatkan.

---

## 1. Nilai Utama Tim Nootid (Core Values)

1. **Egoless Programming**: Kritik pada Pull Request ditujukan pada baris kodingan, bukan pada kepribadian developer. Setiap masukan bertujuan membuat produk lebih stabil dan ramah pengguna.
2. **Screenshots Don't Lie**: Setiap perubahan antarmuka pengguna (UI) wajib menyertakan tangkapan layar ponsel nyata atau emulator di deskripsi PR.
3. **No Secret in Git**: Menjaga integritas keamanan bersama dengan tidak pernah menempelkan API key ke repositori bersama.
4. **Mindful Like Nootti**: Menghadapi bug dengan tenang dan metodologis, persis seperti filosofi maskot Kapibara kita (*Zen & Anti-FOMO*).

---

## 2. Etika Memberikan Komentar Review (Constructive Feedback)

Gunakan formula: **Apresiasi ➔ Observasi Objektif ➔ Rekomendasi Solusi**.

### Contoh Komentar yang Bagus ✅:
> *"Keren animasi kunyah Nootti-nya responsif banget! Tapi sepertinya kalau user klik tombol berulang kali saat AI masih loading, bakal ada request ganda ke Groq. Gimana kalau kita tambahkan debounce atau disable tombol saat state `isLoading`?"*

### Contoh Komentar yang Dilarang ❌:
> *"Kodingan apaan nih jelek banget, tombolnya dobel-dobel."* (Toxic & tidak memberi solusi).

---

## 3. Label Standar Pull Request di GitHub

| Label | Arti |
|---|---|
| `ready-for-review` | Kodingan sudah tuntas dan siap diuji rekan tim |
| `work-in-progress` | Masih dalam pengerjaan, jangan di-merge dulu |
| `approved` | Sudah diverifikasi dan siap digabungkan ke staging/main |
| `needs-changes` | Ada catatan bug atau styling yang wajib diperbaiki |
| `pkm-monev-milestone` | Pencapaian penting untuk materi presentasi Monev PKM |
