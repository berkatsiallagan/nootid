# 🗄️ Panduan Data Layer Mobile: Local-First Cache, Hive/SQLite, & Sinkronisasi Supabase

Halo tim Nootid! Di dokumen ini kita mengupas tuntas arsitektur penyimpanan data aplikasi mobile **Nootid**, menggabungkan kecepatan **Local-First Storage** dengan keandalan **Cloud Sync Supabase**.

Aplikasi mobile edukasi wajib memiliki responsivitas instan: saat user membuka aplikasi di MRT atau area minim sinyal, Nootti the Capybara dan seluruh catatan intisari wajib langsung muncul tanpa loading spinner yang membosankan (*Offline-First Experience*).

---

## 1. Arsitektur Dua Tingkat (Local Cache + Cloud Sync)

Berbeda dengan aplikasi web serverless yang rentan kehabisan connection pool database, aplikasi mobile menggunakan pendekatan klien mandiri:

```text
┌────────────────────────────────────────────────────────┐
│               FLUTTER MOBILE CLIENT (NOOTID)           │
│                                                        │
│  ┌───────────────────────┐    ┌─────────────────────┐  │
│  │ SharedPreferences     │    │ Hive CE / SQLite    │  │
│  │ (Settings, Auth Token)│    │ (Notes, Mascot, Sfx)│  │
│  └───────────────────────┘    └─────────────────────┘  │
│             ▲                            ▲             │
└─────────────┼────────────────────────────┼─────────────┘
              │ Local Read/Write (<10ms)   │
              │                            ▼
      ┌───────┴──────────────────────────────────────────┐
      │ Background Sync Manager (Saat Ada Koneksi)       │
      └──────────────────────┬───────────────────────────┘
                             │ HTTPS / WebSocket (PostgREST)
                             ▼
              ┌─────────────────────────────┐
              │  Supabase Cloud (PostgreSQL)│
              │  (Singapore ap-southeast-1) │
              └─────────────────────────────┘
```

| Tingkat Penyimpanan | Library / Teknologi | Kegunaan Utama | Alasan Pemilihan |
|---|---|---|---|
| **Kunci-Nilai Ringan** | `shared_preferences` | Pengaturan aplikasi, streak flag, status sound mute | Akses instan synchronous saat startup |
| **Dokumen Lokal** | `hive_ce` / `sqflite` | Koleksi `notes`, status exp Nootti, history recap | Kecepatan baca/tulis ultra-cepat tanpa overhead server |
| **Cloud Database** | `supabase_flutter` | Backup catatan multi-device, profil user, leaderboard | Menggunakan PostgREST API (Bebas limit pooler TCP port 5432/6543) |

---

## 2. Struktur Model Data Lokal (`NoteModel`)

Catatan hasil ekstraksi AI disimpan dalam format terstruktur:

```dart
// lib/features/notes_ingestion/domain/note_model.dart
class NoteModel {
  final String id;
  final String originalUrl;
  final String platform; // instagram, tiktok, youtube, x
  final String title;
  final String creatorName;
  final String? thumbnailUrl;
  final List<String> keyTakeaways; // 3 intisari utama dari Whisper + Gemini
  final String? userReflection;   // Refleksi pribadi user
  final List<String> tags;        // Startup, Coding, Marketing, Self-dev
  final DateTime createdAt;
  final bool isSynced;            // Flag sinkronisasi ke cloud

  const NoteModel({
    required this.id,
    required this.originalUrl,
    required this.platform,
    required this.title,
    required this.creatorName,
    this.thumbnailUrl,
    required this.keyTakeaways,
    this.userReflection,
    required this.tags,
    required this.createdAt,
    this.isSynced = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'original_url': originalUrl,
      'platform': platform,
      'title': title,
      'creator_name': creatorName,
      'thumbnail_url': thumbnailUrl,
      'key_takeaways': keyTakeaways,
      'user_reflection': userReflection,
      'tags': tags,
      'created_at': createdAt.toIso8601String(),
      'is_synced': isSynced ? 1 : 0,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as String,
      originalUrl: map['original_url'] as String,
      platform: map['platform'] as String,
      title: map['title'] as String,
      creatorName: map['creator_name'] as String,
      thumbnailUrl: map['thumbnail_url'] as String?,
      keyTakeaways: List<String>.from(map['key_takeaways'] ?? []),
      userReflection: map['user_reflection'] as String?,
      tags: List<String>.from(map['tags'] ?? []),
      createdAt: DateTime.parse(map['created_at'] as String),
      isSynced: (map['is_synced'] as int? ?? 0) == 1,
    );
  }
}
```

---

## 3. Strategi Sinkronisasi (Offline-First Sync)

1. **Simpan Dulu ke Lokal**: Setiap kali user melempar link atau mengedit catatan, data langsung ditulis ke Hive/SQLite lokal dan UI langsung diperbarui dalam < 50ms.
2. **Sinkronisasi Latar Belakang**: Controller memicu fungsi sinkronisasi asynchronous ke Supabase.
3. **Penanganan Konflik (Last-Write-Wins)**: Jika ada modifikasi di device lain, timestamp `updated_at` terbaru yang dimenangkan.
4. **Bebas Kuota API**: User tamu (Guest Mode) tetap bisa menikmati 100% fitur aplikasi tanpa harus login Supabase terlebih dahulu.
