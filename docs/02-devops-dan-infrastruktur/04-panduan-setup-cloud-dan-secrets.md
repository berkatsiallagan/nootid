# ☁️ Panduan Setup Akun Cloud, Kunci Rahasia, & GitHub Secrets

Halo kawan-kawan! Di dokumen ini kita memandu konfigurasi layanan cloud kunci untuk proyek **Nootid**: **Groq Cloud (Whisper STT)**, **Google AI Studio (Gemini 1.5 Flash)**, **Supabase Cloud**, **Google Play Console**, dan **GitHub Secrets**.

Pastikan seluruh kunci rahasia ini disimpan di brankas terenkripsi dan file `.env` lokal, serta **DILARANG KERAS** di-push langsung ke publik Git!

---

## 1. Setup Groq Cloud (OpenAI Whisper Large-v3 STT)

1. Buka [console.groq.com](https://console.groq.com/) dan login via akun Google.
2. Buka menu **API Keys** ➔ Klik **Create API Key**.
3. Beri nama kunci: `nootid-whisper-stt`.
4. Salin kunci API yang diawali dengan `gsk_...` ke file `.env` lokal:
   ```env
   GROQ_API_KEY="gsk_..."
   ```
5. Kuota Free Tier Groq menyediakan kecepatan inferensi Whisper Large-v3 ultra-cepat (ratusan token per detik) tanpa biaya langganan bulanan.

---

## 2. Setup Google AI Studio (Gemini 1.5 Flash)

1. Buka [aistudio.google.com](https://aistudio.google.com/) dan login menggunakan akun Google tim.
2. Klik **Get API key** di pojok kiri atas ➔ Klik **Create API key in new project**.
3. Beri nama project: `nootid-edutech-ai`.
4. Salin kunci API ke file `.env`:
   ```env
   GEMINI_API_KEY="AIzaSy..."
   ```
5. Google AI Studio menyediakan **Free Tier Gemini 1.5 Flash** dengan kuota 15 RPM (Requests Per Minute) dan 1 juta token context window, sangat optimal untuk ringkasan 3 intisari edukasi.

---

## 3. Setup Supabase (Database Cloud & Auth)

1. Buka [database.new](https://database.new) dan login via GitHub.
2. Buat project baru:
   * **Project Name**: `nootid-production`.
   * **Region**: **Singapore (ap-southeast-1)** untuk latensi terendah dari Indonesia.
   * **Database Password**: Buat password kuat dan simpan di password manager tim.
3. Ambil API Keys di menu **Project Settings > API**:
   ```env
   SUPABASE_URL="https://[project-ref].supabase.co"
   SUPABASE_ANON_KEY="eyJhbGciOi..."
   ```

---

## 4. Setup Google Play Console ($25 / Rp 410.000 Akun Developer)

1. Buka [play.google.com/console/signup](https://play.google.com/console/signup).
2. Lakukan pendaftaran akun developer individu atau organisasi.
3. Bayar biaya registrasi satu kali seumur hidup ($25 USD atau sekitar Rp 410.000 menggunakan alokasi dana operasional PKM-KC).
4. Selesaikan verifikasi identitas (KTP/Paspor pengembang).
5. Di menu **API Access**, buat Service Account Google Cloud untuk automasi upload build via GitHub Actions bila diperlukan.

---

## 5. Brankas Kunci Rahasia GitHub (GitHub Secrets)

Di repositori GitHub, buka **Settings > Secrets and variables > Actions > New repository secret**. Masukkan daftar variabel berikut:

| Nama Secret GitHub | Deskripsi Nilai |
|---|---|
| `GROQ_API_KEY` | Kunci API Groq Cloud untuk transkripsi audio Whisper |
| `GEMINI_API_KEY` | Kunci API Google AI Studio untuk summarizer Gemini Flash |
| `SUPABASE_URL` | URL endpoint instance Supabase project |
| `SUPABASE_ANON_KEY` | Public Anon JWT key Supabase |
| `ANDROID_KEYSTORE_BASE64` | File keystore rilis Android di-encode dalam base64 untuk signing APK di cloud |
| `ANDROID_KEY_PASSWORD` | Password alias kunci keystore |
| `ANDROID_STORE_PASSWORD`| Password keystore rilis |
