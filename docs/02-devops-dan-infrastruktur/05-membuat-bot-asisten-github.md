# 🤖 Panduan Pembuatan Bot Asisten GitHub & Notifikasi Tim PKM-KC

Halo kawan-kawan! Di dokumen ini kita mengulas cara membuat bot asisten cerdas di GitHub Actions yang menyapa setiap Pull Request (PR) baru, memeriksa checklist kelayakan rilis (*Definition of Done*), dan mengirimkan tautan unduh APK ke grup komunikasi tim.

---

## 1. Manfaat Bot Asisten di Proyek PKM-KC

1. **Pengingat Standar Kualitas Otomatis**: Setiap kali anggota tim mengajukan PR, bot otomatis menempelkan checklist pengujian (responsivitas layar, cek memori Nootti, sanitasi URL).
2. **Notifikasi Instan ke Grup**: Tim tidak perlu memantau tab GitHub setiap menit; bot mengirimkan ping ke Telegram/Discord saat build APK berhasil dibuat.
3. **Dokumentasi Rapi untuk Monev PKM**: Riwayat komentar bot menjadi bukti profesionalisme tim (*evidence of engineering discipline*) saat presentasi monitoring dan evaluasi kemahasiswaan.

---

## 2. Implementasi GitHub PR Bot (`.github/workflows/pr-assistant.yml`)

```yaml
name: PR Assistant & Review Bot

on:
  pull_request:
    types: [opened, ready_for_review]

jobs:
  pr-greeting:
    name: 🦫 Nootti PR Greeter
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
    steps:
      - name: 💬 Kirim Komentar Sambutan & Checklist
        uses: actions/github-script@v7
        with:
          script: |
            const prAuthor = context.payload.pull_request.user.login;
            const body = `### Halo @${prAuthor}! Nootti the Capybara menyambut PR kamu 🦫✨

            Terima kasih sudah berkontribusi memajukan platform **Nootid**! Sebelum PR ini di-merge ke branch utama, pastikan kamu sudah memeriksa poin-poin berikut:

            - [ ] **Tanpa Error Null Safety**: Kode Flutter lolos analisis \`flutter analyze\`.
            - [ ] **Animasi Maskot Halus**: Reaksi Nootti (makan / senang) tidak memicu drop frame (60 FPS stabil).
            - [ ] **Sanitasi URL Medsos**: Link dari Instagram/TikTok/YouTube disaring dengan \`LinkSanitizer\`.
            - [ ] **Kerahasiaan Kunci**: Tidak ada API key Groq, Gemini, atau Supabase yang tertulis polos di kodingan.
            - [ ] **Penyimpanan Offline**: Catatan tetap bisa dibuka saat ponsel tanpa koneksi internet.

            *Semangat tim Nootid! Menuju PIMNAS & Rilis Play Store! 🚀*`;

            await github.rest.issues.createComment({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.payload.pull_request.number,
              body: body
            });
```
