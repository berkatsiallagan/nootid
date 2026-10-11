# ⌨️ Buku Saku Perintah Git Harian & Alur Kerja Terminal Nootid

Halo kawan-kawan tim Nootid! Dokumen ini adalah buku saku contekan perintah terminal Git harian yang bakal kamu gunakan saat mengembangkan fitur mobile Nootid.

Simpan dokumen ini sebagai pegangan harian. Kapan pun kamu lupa perintahnya, tinggal buka file ini dan salin baris perintahnya!

---

## 1. Alur 5 Menit Rutinitas Harian Developer Nootid

Setiap kali kamu menerima tugas fitur baru dari `project-tasks/nootid-tasklist.md`:

```bash
# 1. Pindah ke branch staging dan tarik pembaruan terbaru dari tim
git checkout staging
git pull origin staging

# 2. Buat branch kerja baru khusus untuk fitur kamu
git checkout -b feat/task-2.1-mascot-animation

# 3. Koding fitur kamu di lib/features/...
# 4. Periksa berkas yang dimodifikasi
git status

# 5. Kumpulkan perubahan dan lakukan commit terstruktur
git add .
git commit -m "feat(mascot): tambahkan canvas painter animasi ngunyah nootti"

# 6. Kirim branch kerja kamu ke GitHub untuk pertama kalinya
git push -u origin feat/task-2.1-mascot-animation
```

---

## 2. Kamus Perintah Git yang Sering Digunakan

### A. Navigasi & Status Branch
* **`git status`**: Melihat daftar berkas yang diubah, ditambah, atau dihapus.
* **`git branch`**: Melihat daftar branch lokal (tanda `*` menandakan branch aktif).
* **`git checkout <nama-branch>`**: Berpindah ke branch yang sudah ada.
* **`git checkout -b <nama-branch-baru>`**: Membuat branch baru sekaligus berpindah ke dalamnya.

### B. Penyimpanan & Sinkronisasi
* **`git pull origin staging`**: Mengunduh dan menggabungkan pembaruan terkini dari tim.
* **`git add .`**: Menandai seluruh perubahan untuk siap di-commit.
* **`git commit -m "<pesan>"`**: Menyimpan snapshot riwayat perubahan dengan pesan deskriptif.
* **`git push -u origin <nama-branch>`**: Mengirimkan branch lokal ke GitHub.

### C. Menarik Update Terbaru Tim Saat Sedang Koding
Bila rekan tim baru saja me-merge kode baru ke `staging` saat kamu sedang koding di branch fitur:

```bash
# 1. Amankan perubahan yang sedang dikerjakan ke brankas sementara
git stash

# 2. Pindah ke staging dan tarik pembaruan
git checkout staging
git pull origin staging

# 3. Kembali ke branch fitur kamu dan rebase ke staging terbaru
git checkout feat/task-2.1-mascot-animation
git rebase staging

# 4. Buka kembali kodingan kamu yang tadi diamankan
git stash pop
```
