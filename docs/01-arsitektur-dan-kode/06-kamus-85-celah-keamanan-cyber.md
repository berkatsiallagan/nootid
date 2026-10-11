# 🛡️ Kamus Lengkap 85 Celah Keamanan Cyber & Strategi Pertahanan Mobile (Flutter 3.x + AI)

Halo kawan-kawan! Dokumen ini adalah ensiklopedia pertahanan keamanan siber komprehensif yang membedah **85 celah keamanan siber** (dari celah injeksi klasik OWASP, celah mobile OWASP Mobile Top 10, hingga ancaman kecerdasan buatan LLM dan eksploitasi rantai pasokan modern), dirancang untuk ekosistem aplikasi mobile **Nootid**.

Semua konsep dijelaskan dengan bahasa kasual, mudah dipahami, disertai contoh nyata dan strategi pertahanannya di Flutter 3.x, Supabase Auth, Groq Whisper STT, Google Gemini 1.5 Flash, serta pipeline rilis Google Play Store.

---

## 🗺️ 20 Aturan Emas Keamanan Aplikasi Mobile Nootid

Sebelum merilis APK / Android App Bundle (`.aab`) ke Google Play Console, pastikan 20 fondasi ini sudah terpasang:

| No | Aturan Keamanan | Maksud & Cara Kerjanya di Ekosistem Mobile Nootid |
|---|---|---|
| 1 | **Hide API Keys** | Kunci rahasia API (Groq, Gemini, Supabase Service Role) tidak boleh di-hardcode polos di kodingan Dart. Gunakan `.env` + `flutter_dotenv` dan obfuskasi R8. |
| 2 | **Purge Git Secrets** | Jika API key terlanjur ter-push ke GitHub, segera rotasi (*rotate/revoke*) kunci detik itu juga dan bersihkan riwayat commit. |
| 3 | **Use Public Anon Key Only** | Di mobile client hanya boleh memanggil `SUPABASE_ANON_KEY`. Dilarang keras menanam `SERVICE_ROLE_KEY` di dalam APK. |
| 4 | **Enable Row-Level Security (RLS)** | Kunci tabel Supabase PostgreSQL agar pengguna A tidak dapat mengintip catatan milik pengguna B. |
| 5 | **Encrypt Sensitive Local Storage** | Gunakan `flutter_secure_storage` (Android Keystore / iOS Keychain) untuk token otentikasi. Jangan simpan token di SharedPreferences mentah! |
| 6 | **Enforce Server-Side Auth** | Selalu verifikasi sesi login di backend/Supabase via token PKCE, jangan mempercayai status lokal yang rentan di-root. |
| 7 | **Sanitize Android Share Sheet Intents** | Validasi dan saring URL kiriman medsos via `LinkSanitizer` sebelum diproses untuk mencegah injeksi `file://` atau `javascript:`. |
| 8 | **Obfuscate Release Builds (R8)** | Wajibkan `minifyEnabled true` dan `shrinkResources true` di `build.gradle` agar biner APK kebal dari reverse engineering (Jadx/Apktool). |
| 9 | **Block Cleartext HTTP** | Kunci `android:usesCleartextTraffic="false"` di AndroidManifest. Seluruh lalu lintas data WAJIB HTTPS. |
| 10 | **Secure AI System Prompts** | Pasang guardrail ketat pada prompt Google Gemini Flash agar tidak tertipu prompt injection dari transkrip video. |
| 11 | **Rate Limit API Requests** | Batasi pemanggilan API ekstraksi link untuk mencegah banjir request bot atau pengguna iseng. |
| 12 | **Implement SSL Pinning** | Lindungi komunikasi ke server AI dan Supabase dari intersepsi Man-in-the-Middle (MitM) di WiFi publik. |
| 13 | **Parameterize Database Queries** | SQLite / Hive di lokal wajib menggunakan query berparameter, bukan string concatenation mentah. |
| 14 | **Validate All Social URLs** | Whitelist hanya domain resmi (Instagram, TikTok, YouTube, X). Tolak domain mencurigakan. |
| 15 | **Escape Rich Text Rendering** | Markdown/HTML rendering untuk intisari AI wajib memblokir eksekusi tag `<script>` atau iframe jahat. |
| 16 | **Restrict Permissions to Minimum** | Hanya minta izin OS yang benar-benar dipakai (`INTERNET`). Hindari meminta izin berbahaya (Camera/Contacts) jika tidak diperlukan. |
| 17 | **Scrub Logs in Production** | Pastikan `print()` atau debug logger dimatikan pada build release menggunakan `kDebugMode`. Jangan bocorkan token ke logcat! |
| 18 | **Lock Google Play App Signing** | Gunakan Play App Signing dengan keystore terisolasi dan backup SHA-256 fingerprint. |
| 19 | **Verify Pub.dev Packages** | Kunci versi dependensi di `pubspec.lock` dan gunakan package yang memiliki reputasi skor pub.dev tinggi. |
| 20 | **Scan Secrets Pre-Commit** | Pastikan file `.env` masuk ke `.gitignore` dan jalankan pemeriksaan keamanan berkala sebelum push. |

---

## 🗂️ Bedah Lengkap 85 Celah Keamanan Cyber

### Kategori 1: Celah Klasik & Injeksi (Nomor 1 – 30)

1. **SQL Injection (SQLi)**: Penyerang menyisipkan sintaks SQL mentah di form input lokal/cloud.  
   *Tangkisan kita*: SQLite via `sqflite`/`drift` dan Supabase PostgREST otomatis memakai parameterized queries.
2. **Cross-Site Scripting (XSS)**: Script berbahaya dirender di komponen WebView atau viewer teks.  
   *Tangkisan kita*: Widget Text & Markdown Flutter merender representasi kanvas grafis murni, bukan eksekusi DOM HTML mentah.
3. **Cross-Site Request Forgery (CSRF)**: Permintaan palsu yang dipicu dari browser pihak ketiga.  
   *Tangkisan kita*: Komunikasi mobile menggunakan Bearer Token (Authorization header), kebal terhadap cookie-based CSRF.
4. **Command Injection**: Eksploitasi eksekusi perintah shell OS lokal.  
   *Tangkisan kita*: Aplikasi mobile Flutter tidak pernah mengeksekusi shell command `Process.run()` dengan parameter user.
5. **XML External Entity (XXE)**: Parser XML mengekstrak file sistem lokal.  
   *Tangkisan kita*: Ekosistem Nootid 100% menggunakan payload JSON murni, menolak parser XML mentah.
6. **Clickjacking (Tapjacking di Mobile)**: Overlay transparan di atas layar aplikasi untuk menipu sentuhan pengguna.  
   *Tangkisan kita*: Mengaktifkan proteksi `setFilterTouchesWhenObscured(true)` pada window Android.
7. **Insecure Direct Object References (IDOR)**: Pengguna memanipulasi UUID di request untuk melihat catatan user lain.  
   *Tangkisan kita*: Supabase Row-Level Security (RLS) mengunci: `auth.uid() = user_id`.
8. **Insecure Deserialization**: Eksekusi kode jahat saat memparsing objek biner/JSON.  
   *Tangkisan kita*: Menggunakan parser type-safe Dart berstandar kuat dengan pengecekan tipe eksplisit.
9. **Server-Side Request Forgery (SSRF)**: Memancing server parser mengambil URL internal loopback (`127.0.0.1` / metadata cloud).  
   *Tangkisan kita*: Validasi hostname URL sosial media via whitelist ketat sebelum mengirimkan request ekstraksi.
10. **Software Supply Chain Attack**: Package pub.dev disusupi kode berbahaya.  
    *Tangkisan kita*: Memverifikasi reputasi package, mengunci `pubspec.lock`, dan memantau security advisory.
11. **Broken Authentication & Access Control**: Endpoint tanpa verifikasi token yang dapat diakses publik.  
    *Tangkisan kita*: Seluruh akses data cloud diverifikasi via Supabase JWT token.
12. **AI Prompt Injection**: Manipulasi transkrip video untuk membajak instruksi Gemini Flash.  
    *Tangkisan kita*: System prompt isolasi ketat yang memisahkan instruksi sistem dengan data input mentah.
13. **Brute Force / Credential Stuffing**: Percobaan ribuan password login per menit.  
    *Tangkisan kita*: Rate limiting Supabase Auth dan prioritas login Google OAuth (tanpa form password rentan).
14. **Session Hijacking**: Pencurian token otentikasi di jaringan terbuka.  
    *Tangkisan kita*: Token ditransmisikan hanya via HTTPS dan disimpan di EncryptedSharedPreferences (Android Keystore).
15. **HTTP Request Smuggling**: Desinkronisasi parsing request antara proxy dan backend server.  
    *Tangkisan kita*: Semua komunikasi cloud menggunakan HTTPS standar via Google & Supabase Edge Gateway.
16. **Web / Mobile Cache Deception**: Cache lokal menyimpan informasi sensitif tanpa proteksi.  
    *Tangkisan kita*: Direktori cache lokal diisolasi di sandbox aplikasi `/data/user/0/app.nootid/cache`.
17. **Subdomain Takeover**: DNS pointer mengarah ke layanan hosting non-aktif.  
    *Tangkisan kita*: Manajemen DNS resmi di DomaiNesia dikontrol berkala tanpa pointer yatim (*orphan CNAME*).
18. **DNS Poisoning / Spoofing**: Manipulasi resolusi domain di jaringan WiFi lokal.  
    *Tangkisan kita*: Mengaktifkan DNSSEC di DomaiNesia dan DoH (DNS over HTTPS).
19. **Cross-Site WebSocket Hijacking**: Eksploitasi koneksi realtime socket.  
    *Tangkisan kita*: Token otentikasi dikirimkan pada payload handshake realtime Supabase.
20. **Path Confusion / Traversal**: Mengakses file sistem internal via path manipulasi.  
    *Tangkisan kita*: Pembatasan akses file hanya pada direktori `getApplicationDocumentsDirectory()`.
21. **CRLF Injection**: Karakter enter ganda untuk memanipulasi header HTTP.  
    *Tangkisan kita*: Dio client secara otomatis memvalidasi karakter baris baru pada header.
22. **LDAP Injection**: Manipulasi query direktori pengguna.  
    *Tangkisan kita*: Nootid tidak menggunakan LDAP, melainkan auth modern Supabase.
23. **XPath Injection**: Manipulasi query file XML.  
    *Tangkisan kita*: Data tersimpan di SQLite / JSON terstruktur, bebas dari XML query.
24. **Insecure File Storage**: Menyimpan file unduhan di penyimpanan publik (`/sdcard/Download`) tanpa enkripsi.  
    *Tangkisan kita*: Penyimpanan database catatan diisolasi di sandbox privat aplikasi.
25. **Race Condition di Mobile**: Double-tap tombol 'Feed Link' yang memicu duplikasi proses AI.  
    *Tangkisan kita*: State debounce di Riverpod controller (`isLoading` flag menonaktifkan tombol instan).
26. **Prototype Pollution**: Manipulasi objek bawaan (JavaScript specific).  
    *Tangkisan kita*: Dart adalah bahasa strongly-typed berbasis kelas, kebal dari prototype pollution.
27. **GraphQL Deep Query DoS**: Query nested tak terbatas yang menguras CPU.  
    *Tangkisan kita*: Arsitektur Nootid menggunakan REST API terarah, tidak mengekspos endpoint GraphQL bebas.
28. **WebSocket Flooding**: Pengiriman paket message beruntun di koneksi socket terbuka.  
    *Tangkisan kita*: Debounce dan rate limit di controller state management.
29. **CORS Misconfiguration**: Endpoint server mengizinkan sembarang origin.  
    *Tangkisan kita*: Kunci origin domain resmi `nootid.app` pada konfigurasi CORS backend.
30. **Open Redirect**: Parameter redirect melempar user ke link phishing luar.  
    *Tangkisan kita*: Navigasi internal diatur oleh GoRouter / Navigator 2.0 tanpa parameter eksternal liar.

---

### Kategori 2: Auth, Mobile OS & Phishing (Nomor 31 – 35)

31. **OAuth Consent Phishing**: Aplikasi palsu meminta izin akses akun Google yang berlebihan.  
    *Tangkisan kita*: Scope Google OAuth dibatasi hanya pada `email` dan `profile`.
32. **AiTM (Adversary-in-the-Middle) Phishing**: Proksi phishing mencuri token sesi aktif.  
    *Tangkisan kita*: Pertukaran token menggunakan alur PKCE dengan verifikasi SHA-256 code challenge.
33. **Mobile Root / Jailbreak Abuse**: Hacker mengakses database SQLite pada perangkat yang di-root.  
    *Tangkisan kita*: Enkripsi data sensitif lokal menggunakan database berenkripsi (SQLCipher/AES-256).
34. **AI Agent Exploitation (Agentjacking)**: Menipu asisten Nootti untuk mengeksekusi instruksi di luar koridor.  
    *Tangkisan kita*: Fitur "Ask Your Mascot" hanya diberi akses baca (*read-only*) ke catatan lokal user.
35. **APK Repackaging & Tampering**: Modifikasi biner APK oleh pihak ketiga dengan menanam adware.  
    *Tangkisan kita*: Verifikasi signature sertifikat Google Play App Signing saat runtime.

---

### Kategori 3: Standar OWASP Mobile & API Security (Nomor 36 – 39)

36. **Unrestricted Resource Consumption**: Permintaan AI berulang tanpa jeda yang menguras kuota API.  
    *Tangkisan kita*: Quota tracker lokal yang membatasi panggilan AI per hari/bulan sesuai tier akun.
37. **Improper Inventory Management**: Versi API lama yang tidak dipelihara.  
    *Tangkisan kita*: Versi API terstandarisasi `/v1/` dan pensiunkan versi lama segera.
38. **Unsafe Consumption of Third-Party APIs**: Langsung mempercayai respons JSON mentah tanpa validasi.  
    *Tangkisan kita*: Validasi struktur respons AI dengan try-catch dan pengecekan tipe data eksplisit.
39. **Cryptographic Failures**: Penggunaan algoritma enkripsi usang (MD5, SHA1).  
    *Tangkisan kita*: Standar industri AES-256-GCM dan SHA-256 untuk seluruh integritas data.

---

### Kategori 4: Ancaman Modern & AI Cyber Threats (Nomor 40 – 64)

40. **ShadowPrompt**: Karakter Unicode tersembunyi (zero-width characters) untuk memanipulasi model AI.  
    *Tangkisan kita*: Normalisasi string dan pembersihan karakter non-printable sebelum dikirim ke Gemini.
41. **AutoJack**: Bot scanner otomatis mendeteksi kebocoran API key di repositori publik.  
    *Tangkisan kita*: Git secret scan dan aturan ketat `.gitignore`.
42. **JWT Algorithm Confusion**: Manipulasi header JWT RS256 ke HS256.  
    *Tangkisan kita*: Supabase mengunci algoritma verifikasi token secara ketat.
43. **OAuth Redirect URI Manipulation**: Pembajakan callback URL autentikasi.  
    *Tangkisan kita*: URL callback terdaftar spesifik menggunakan Custom Scheme `app.nootid://auth-callback`.
44. **Session Fixation**: Pemasangan ID sesi sebelum login.  
    *Tangkisan kita*: Regenerasi token baru setiap kali otentikasi berhasil.
45. **AI Credential Theft via Prompt**: Prompt menipu model agar membocorkan secret key sistem.  
    *Tangkisan kita*: Kunci API disimpan di environment runtime, tidak pernah dimasukkan ke dalam teks context prompt!
46. **Android Intent Spoofing**: Aplikasi jahat mengirim intent palsu ke Nootid.  
    *Tangkisan kita*: Validasi ketat `Intent.ACTION_SEND` dan sanitasi data MIME `text/plain`.
47. **Logcat Information Leakage**: Data pribadi atau token tercetak di Android Logcat.  
    *Tangkisan yang terpasang*: Menonaktifkan semua print logging pada build rilis (`kReleaseMode`).
48. **Insecure Backup (Android Auto Backup)**: File konfigurasi sensitif ter-backup ke Google Drive tanpa enkripsi.  
    *Tangkisan kita*: Setel `android:allowBackup="false"` atau pasang exclude rule pada file rahasia.
49. **Botnet IP Residensial**: Serangan DDoS botnet melalui jutaan proxy.  
    *Tangkisan kita*: Proteksi WAF cloud di level provider (Supabase & Cloudflare).
50. **LLM-Assisted Automated Scraping**: Bot AI mengekstrak data dari platform tanpa izin.  
    *Tangkisan kita*: Proteksi otentikasi di level API.
51. **Container Runtime Vulnerabilities**: Celah pada runner backend.
52. **GitOps Configuration Drift**: Inkonsistensi deklarasi deployment.
53. **Message Queue C2 Abuse**: Penyalahgunaan antrean pesan untuk botnet.
54. **Cloud API Token Leakage**: Pembajakan API key Groq atau Gemini untuk akun lain.  
    *Tangkisan kita*: Monitor dashboard pemakaian token dan rotasi berkala.
55. **Blockchain C2**: Instruksi botnet melalui smart contract.
56. **HalluSquatting**: Pendaftaran package palsu di pub.dev dengan nama hasil halusinasi AI.  
    *Tangkisan kita*: Wajib verifikasi publisher resmi dan popularitas package sebelum menambahkan dependency baru.
57. **Voice Phishing (Vishing)**: Penipuan rekayasa sosial via telepon.
58. **Fake Survey Phishing**: Tautan kuesioner palsu berkedok pengujian aplikasi.
59. **Recruiter Impersonation**: Penyamaran untuk menyebarkan file APK malware.
60. **Fake Biometric Auth Bypass**: Modifikasi logika verifikasi fingerprint lokal.  
    *Tangkisan kita*: Verifikasi kriptografi berbasis hardware keystore jika menggunakan biometrik.
61. **ClickFix Attack**: Panduan palsu mengeksekusi script bahaya di terminal developer.
62. **Team Member Impersonation**: Penyamaran di grup koordinasi tim PKM.
63. **Calendar Invite Hijacking**: Penipuan melalui undangan kalender online.
64. **Model Poisoning**: Backdoor pada model AI pra-latih.  
    *Tangkisan kita*: Menggunakan model terpercaya dari provider resmi (Google Gemini & OpenAI Whisper).

---

### Kategori 5: Kriptografi & Hardware (Nomor 65 – 70)

65. **Broken Post-Quantum Signatures**: Kelemahan algoritma generasi baru.
66. **Cache Timing Attack**: Analisis waktu respon kriptografi pada CPU.
67. **Deep Learning Cipher Recovery**: Dekripsi via neural network.
68. **Physical Device Extraction**: Hacker mengambil data via kabel USB/ADB debugging.  
    *Tangkisan kita*: Nonaktifkan USB debugging mode saat pengujian release dan kunci enkripsi internal.
69. **Hardware Keystore Tampering**: Eksploitasi chip keamanan perangkat.
70. **Signal Tampering**: Manipulasi sinyal transmisi fisik.

---

### Kategori 6: Injeksi & Misconfiguration Lanjutan (Nomor 71 – 85)

71. **Dependency Confusion**: Penyerang mendaftarkan nama package private di pub.dev publik.
72. **Deep Link Hijacking**: Aplikasi lain mendaftarkan custom scheme URL yang sama (`app.nootid://`).  
    *Tangkisan kita*: Menggunakan **Android App Links** terverifikasi dengan berkas `assetlinks.json` di domain resmi `nootid.app`.
73. **Email Header Injection**: Karakter CRLF pada form input email.
74. **SQLite Injection**: Manipulasi query database lokal.  
    *Tangkisan kita*: Selalu menggunakan helper query berparameter (`rawQuery(sql, [params])`).
75. **Server-Side Template Injection**: Eksekusi template backend.
76. **NoSQL Operator Injection**: Injeksi operator query database non-relasional.
77. **Log Injection**: Pemalsuan log audit aplikasi.  
    *Tangkisan kita*: Sanitasi string sebelum dicatat ke sistem audit.
78. **Remote Code Execution via Dynamic Code Loading**: Memuat file `.dex` dari server luar secara dinamis (Dilarang Google Play!).  
    *Tangkisan kita*: Nootid 100% biner statis terkompilasi, mematuhi kebijakan Google Play Store.
79. **Local File Inclusion**: Membaca file konfigurasi lokal dari parameter query.
80. **Path Traversal di Local Storage**: Mengakses folder di luar direktori dokumen aplikasi.
81. **API Rate Limit Bypassing**: Serangan banjir query untuk menguras token API AI.
82. **Response Cache Poisoning**: Keracunan cache respon jaringan.
83. **Memory Scraping di RAM Mobile**: Membaca teks password dari memori RAM yang belum di-clear.  
    *Tangkisan kita*: Segera buang referensi string password dari memori setelah token ditukar.
84. **Reverse Tabnabbing / URL Spoofing**: Membuka URL eksternal tanpa proteksi.  
    *Tangkisan kita*: Gunakan package `url_launcher` dengan mode `LaunchMode.externalApplication`.
85. **Unvalidated Deeplink Navigation**: Deep link yang langsung membuka layar sensitif tanpa cek status login.  
    *Tangkisan kita*: Router guard memeriksa status otentikasi sebelum merender layar terproteksi.
