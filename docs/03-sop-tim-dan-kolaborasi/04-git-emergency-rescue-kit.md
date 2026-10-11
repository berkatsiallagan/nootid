# 🧯 Kotak Pertolongan Pertama Git (Emergency Rescue Kit)

Halo tim Nootid! Jangan panik kalau kamu merasa kodinganmu "rusak", salah branch, atau commit berantakan. Git menyimpan seluruh riwayat snapshot dengan sangat aman.

Berikut resep penanganan darurat untuk masalah Git yang paling sering terjadi:

---

## 1. "Waduh, gue salah ketik pesan commit terakhir!"

Perbaiki pesan commit tanpa membuat commit baru:
```bash
git commit --amend -m "feat(mascot): pesan commit yang benar dan rapi"
```

---

## 2. "Gue terlanjur commit, tapi ada file yang kelupaan diikutkan!"

Tambahkan file yang kelupaan ke commit terakhir:
```bash
git add lib/features/mascot/presentation/mascot_widget.dart
git commit --amend --no-edit
```

---

## 3. "Gue koding di branch yang salah (misal di staging, harusnya di feat/...)!"

Pindahkan kodingan yang belum di-commit ke branch baru:
```bash
# 1. Simpan perubahan ke lemari sementara
git stash

# 2. Kembalikan branch staging ke kondisi bersih
git checkout staging
git reset --hard origin/staging

# 3. Buat dan pindah ke branch yang benar
git checkout -b feat/task-2.2-quick-link-bar

# 4. Ambil kembali kodingan kamu
git stash pop
```

---

## 4. "Ada konflik saat merge/rebase (Merge Conflict)!"

1. Buka VS Code, cari file yang memiliki tanda merah `<<<<<<< HEAD`.
2. Pilih opsi *"Accept Current Change"*, *"Accept Incoming Change"*, atau gabungkan keduanya secara manual.
3. Setelah tanda konflik bersih:
   ```bash
   git add <nama-file-yang-dibereskan>
   git rebase --continue
   # Atau jika sedang merge:
   git commit -m "chore: selesaikan konflik merge staging"
   ```

---

## 5. "Panik! Gue salah reset --hard dan kodingan gue seolah hilang!"

Gunakan `reflog` untuk memutar balik waktu:
```bash
# 1. Cari riwayat pointer HEAD sebelum kamu reset
git reflog

# 2. Temukan hash commit sebelum musibah (contoh: HEAD@{2})
git reset --hard HEAD@{2}
```
*Kodingan kamu bakal kembali utuh seperti sebelum di-reset!*
