# 🔐 Panduan Sistem Otentikasi Mobile: Supabase Flutter & Google Sign-In

Halo tim Nootid! Di dokumen ini kita membahas penerapan sistem otentikasi pada aplikasi mobile **Nootid** menggunakan **Supabase Flutter SDK** dan **Google Sign-In Native**.

Prinsip utama Nootid: **Zero-Friction Onboarding**. User yang baru mengunduh aplikasi tidak boleh dihadang dinding login paksa! Mereka langsung disambut oleh Nootti the Capybara dan bisa langsung memberi makan link pertama kali. Login Google hanya dipicu saat user ingin menyinkronkan data antar-perangkat atau upgrade ke Nootid Pro.

---

## 1. Arsitektur Otentikasi Mobile (Guest Mode ➔ Google OAuth)

```text
┌────────────────────────────────────────────────────────┐
│                      PENGGUNA BARU                     │
└───────────────────────────┬────────────────────────────┘
                            │ Buka aplikasi pertama kali
                            ▼
┌────────────────────────────────────────────────────────┐
│        Mode Tamu (Guest Mode / Offline First)          │
│  - Data catatan & level Nootti tersimpan lokal di Hive │
│  - Bebas kuota server & tanpa hambatan onboarding      │
└───────────────────────────┬────────────────────────────┘
                            │ Ingin Cloud Backup / Ganti HP
                            ▼
┌────────────────────────────────────────────────────────┐
│     Klik "Hubungkan Akun Google" di Profil Nootid      │
└───────────────────────────┬────────────────────────────┘
                            │ Native Google Sign-In SDK
                            ▼
┌────────────────────────────────────────────────────────┐
│             Pertukaran Token ID di Supabase            │
│  - Verifikasi ID Token Google di Supabase Auth         │
│  - Migrasikan data lokal (Guest) ke cloud user ID      │
│  - Simpan JWT Refresh Token di Android Keystore        │
└────────────────────────────────────────────────────────┘
```

---

## 2. Inisialisasi Supabase di `main.dart`

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce, // Standar keamanan PKCE untuk mobile
    ),
  );

  runApp(const NootidApp());
}
```

---

## 3. Implementasi Google Sign-In Native di Flutter

```dart
// lib/features/auth_profile/data/auth_repository.dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithGoogle() async {
    // 1. Inisialisasi Google Sign In Native
    const webClientId = 'YOUR_GOOGLE_WEB_CLIENT_ID.apps.googleusercontent.com';
    final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: webClientId);
    final googleUser = await googleSignIn.signIn();
    
    if (googleUser == null) {
      throw Exception('Login dibatalkan oleh pengguna.');
    }

    // 2. Ambil token otentikasi Google
    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null) {
      throw Exception('ID Token Google tidak ditemukan.');
    }

    // 3. Tukar token dengan Supabase Auth
    return await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
```

---

## 4. Keamanan Token di Device (`flutter_secure_storage`)

- **Android**: Token JWT disimpan terenkripsi menggunakan **Android Keystore** dan `EncryptedSharedPreferences` (AES-256 GCM).
- **iOS**: Token disimpan di dalam brankas **iOS Keychain** yang dilindungi sandbox sistem operasi.
- **Auto-Refresh**: Supabase Flutter SDK secara otomatis memperbarui (*refresh*) token kedaluwarsa di latar belakang tanpa mengganggu kenyamanan pengguna.
