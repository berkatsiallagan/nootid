# 🌐 Panduan Setup Domain DomaiNesia & Hosting Landing Page (`nootid.app`)

Halo tim Nootid! Di dokumen ini kita mengupas strategi konfigurasi domain resmi **`nootid.app`** (dibeli di DomaiNesia senilai **Rp 332.889 / tahun**) dan hosting landing page gratisan untuk mendukung distribusi aplikasi mobile kita.

---

## 1. Mengapa Aplikasi Mobile Membutuhkan Domain & Website?

Meski Nootid berbasis aplikasi mobile Flutter di Google Play Store, domain web resmi `nootid.app` bersifat **wajib mutlak** karena alasan berikut:

1. **Syarat Wajib Google Play Store**: Kebijakan Google Play mewajibkan setiap developer mencantumkan URL Kebijakan Privasi publik yang aktif (`https://nootid.app/privacy`) dan URL Bantuan/Dukungan (`https://nootid.app/support`). Tanpa URL ini, aplikasi akan ditolak (*rejected*) saat submission.
2. **Android App Links (`assetlinks.json`)**: Untuk fitur deep linking, Android membutuhkan berkas verifikasi kriptografi domain di `https://nootid.app/.well-known/assetlinks.json` agar tautan share sheet bisa langsung membuka aplikasi Nootid.
3. **Showcase Landing Page & Download Hub**: Menjadi etalase visual resmi memperkenalkan Nootti the Capybara, rangkuman AI, dan tombol langsung *"Get it on Google Play"* saat promosi di Instagram Ads / TikTok Ads.

---

## 2. Arsitektur Hosting Gratis (Zero Cost Hosting)

Kita tidak perlu menyewa server VPS mahal untuk landing page! Landing page statis dihosting **100% gratis** menggunakan **Cloudflare Pages** atau **GitHub Pages**, lalu dihubungkan ke domain DomaiNesia:

```text
┌─────────────────────────┐
│     User / Pengunjung   │
└────────────┬────────────┘
             │ Buka https://nootid.app
             ▼
┌─────────────────────────┐
│  DomaiNesia (DNS Manager│ ──> Name Server Cloudflare (Bebas Biaya)
└────────────┬────────────┘
             ▼
┌─────────────────────────┐
│ Cloudflare Pages / Vercel│ ──> Menyajikan HTML Statis & Halaman /privacy
└─────────────────────────┘
```

---

## 3. Konfigurasi DNS di Dashboard DomaiNesia

1. Masuk ke Client Area [DomaiNesia](https://dash.domainesia.com/) ➔ Menu **Domains** ➔ Pilih `nootid.app`.
2. Buka menu **DNS Zone Editor** atau gunakan Custom Nameservers.
3. Tambahkan DNS Records berikut:

| Tipe Record | Nama Host / Subdomain | Target / Nilai | TTL | Keterangan |
|---|---|---|---|---|
| `CNAME` | `@` (root) | `nootid-app.pages.dev` | Auto | Mengarahkan domain utama `nootid.app` |
| `CNAME` | `www` | `nootid-app.pages.dev` | Auto | Mengarahkan `www.nootid.app` |
| `TXT` | `@` | `google-site-verification=...` | Auto | Verifikasi Google Search Console & Play Console |

---

## 4. Berkas Wajib di Root Landing Page

Di direktori hosting web statis, sediakan file-file kunci berikut:
- `index.html`: Landing page modern memperkenalkan fitur Nootid & Nootti the Capybara.
- `privacy.html` (atau `/privacy`): Dokumen Kebijakan Privasi sesuai UU PDP No. 27/2022 dan Google Play Developer Policy.
- `terms.html` (atau `/terms`): Syarat & Ketentuan Penggunaan.
- `/.well-known/assetlinks.json`: Berkas JSON resmi Android App Links memuat SHA-256 fingerprint sertifikat release APK Nootid.
