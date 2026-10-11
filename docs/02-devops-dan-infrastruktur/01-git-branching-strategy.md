# 🌿 Panduan Manajemen Branch Git & Alur Rilis Mobile (Flutter)

Halo tim Nootid! Di dokumen ini kita merangkum strategi percabangan Git (**Git Branching Strategy**) yang dirancang khusus untuk alur pengembangan aplikasi mobile Flutter **Nootid**, terintegrasi dengan siklus review tim mahasiswa PKM-KC dan distribusi Google Play Store.

---

## 1. Peta Pohon Percabangan (Branch Hierarchy)

```text
  main (Production Ready / Live di Google Play Store)
   ▲
   │ Merge via PR Resmi (Tag: v1.0.0+1)
  staging (Uji Coba Internal / Google Play Internal Testing Track)
   ▲
   │ Merge setelah lolos review QA
  feat/* atau fix/* (Cabang Pengerjaan Sehari-hari)
```

| Nama Branch | Peran & Lingkungan | Aturan Proteksi |
|---|---|---|
| `main` | Kode stabil 100%. Sumber build Android App Bundle (`.aab`) resmi yang dirilis ke Google Play Store dan bahan Monev PKM-KC. | Wajib lulus review 1 rekan tim (PR Approval), dilarang `git push -f`. |
| `staging` | Kode integrasi fitur. Sumber build APK tester untuk uji coba langsung di smartphone fisik tim pengembang. | Wajib lolos validasi CI/CD automated test. |
| `feat/*` | Cabang pembuatan fitur baru (misal: feed mascot, link parser, monthly recap). | Dibuat dari `staging`, di-merge kembali ke `staging`. |
| `fix/*` | Cabang perbaikan bug yang ditemukan selama fase pengujian internal. | Dibuat dari `staging`. |
| `hotfix/*` | Cabang perbaikan darurat untuk bug kritis yang langsung ditemukan di produksi Play Store. | Dibuat dari `main`, di-merge ke `main` dan `staging`. |

---

## 2. Format Penamaan Branch Resmi

Format standar:
```text
<jenis>/<ID-Tiket>-<deskripsi-singkat>
```

### Contoh yang BENAR ✅:
- `feat/TASK-2.1-mascot-animation-canvas`
- `feat/TASK-3.1-social-link-parser`
- `fix/TASK-1.2-android-share-intent-null`
- `hotfix/v1.0.1-gemini-quota-fallback`
- `docs/pkm-rab-update`

### Contoh yang SALAH ❌:
- `fitur-mascot` *(Tanpa jenis dan ID tiket)*
- `benerin-error` *(Terlalu ambigu)*
- `Feat/Mascot_Animation` *(Memakai huruf kapital dan underscore)*

---

## 3. Aturan Penomoran Versi Mobile di `pubspec.yaml`

Format versi Flutter: `version: [versionName]+[versionCode]`

```yaml
# pubspec.yaml
version: 1.0.0+1
```

- **`1.0.0` (Version Name)**: Ditampilkan ke pengguna di antarmuka aplikasi dan halaman Google Play Store.
- **`+1` (Version Code / Build Number)**: Bilangan bulat positif yang **WAJIB bertambah 1 setiap kali upload** build baru ke Google Play Console (`+1`, `+2`, `+3`, dst). Google Play akan menolak biner baru jika nomor versionCode sama dengan rilisan sebelumnya.
