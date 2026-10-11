# 📐 Standar Kontrak API, Response Builder, & AI Pipeline Contract

Halo kawan-kawan developer! Dokumen ini mendefinisikan standar baku kontrak data dan struktur respon komunikasi antara Flutter Mobile Client dengan backend API serta external AI engines (**Groq Whisper STT** & **Google Gemini 1.5 Flash**).

Standarisasi ini menjamin parsing data di sisi Flutter tidak pernah mengalami crash karena tipe null yang tak terduga (*TypeCastException* atau *NullSafety crash*).

---

## 1. Format Baku Response Wrapper (`ApiResponse<T>`)

Di Dart/Flutter, seluruh panggilan HTTP dibungkus dalam generic type class yang menangani kondisi sukses maupun gagal secara elegan:

```dart
// lib/core/network/api_response.dart

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final ApiError? error;
  final DateTime timestamp;

  const ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.error,
    required this.timestamp,
  });

  factory ApiResponse.success({required T data, String message = 'Berhasil memproses data'}) {
    return ApiResponse(
      success: true,
      message: message,
      data: data,
      timestamp: DateTime.now(),
    );
  }

  factory ApiResponse.failure({required String code, required String message, dynamic details}) {
    return ApiResponse(
      success: false,
      message: message,
      error: ApiError(code: code, message: message, details: details),
      timestamp: DateTime.now(),
    );
  }
}

class ApiError {
  final String code;
  final String message;
  final dynamic details;

  const ApiError({required this.code, required this.message, this.details});
}
```

---

## 2. Kontrak Pipeline AI Ingestion (Social Link ➔ Whisper ➔ Gemini)

Alur kerja konversi link video medsos menjadi catatan edukasi terstruktur:

```text
[Link Medsos: IG/TikTok/YT] 
             │
             ▼
[1. Metadata & Audio Resolver] ──> Ekstrak Title, Creator, Audio Stream
             │
             ▼
[2. OpenAI Whisper Large-v3]   ──> Endpoint: Groq Cloud API
             │                     Transkripsi Audio ➔ Teks Mentah (Full Transcript)
             ▼
[3. Google Gemini 1.5 Flash]   ──> Endpoint: Google AI Studio API
             │                     Prompt Sistem: Ekstraksi 3 intisari & tags
             ▼
[4. Structured Note JSON]      ──> Validasi Field ➔ Simpan ke NoteModel lokal
```

### JSON Schema Output Gemini 1.5 Flash

Gemini 1.5 Flash diinstruksikan mengembalikan JSON murni dengan format schema berikut:

```json
{
  "title": "5 Formula Bikin Pitch Deck Startup yang Dilirik VC",
  "creator": "@startupid",
  "category": "Startup",
  "tags": ["Startup", "Pitch Deck", "Fundraising", "Bisnis"],
  "key_takeaways": [
    "Fokuskan slide pertama pada ukuran masalah (Problem Statement) yang nyata dan divalidasi oleh angka riil.",
    "Jelaskan Unique Value Proposition dalam satu kalimat tajam tanpa jargon berlebihan.",
    "Tunjukkan traksi awal (early traction) atau unit economics yang masuk akal bagi investor tahap awal."
  ],
  "estimated_reading_time_seconds": 45
}
```

---

## 3. Penanganan Error & Ketahanan Jaringan (Fault Tolerance)

| Kasus Kegagalan | Kode Error | Tindakan di Aplikasi Nootid |
|---|---|---|
| **Link Tidak Valid / Private** | `INVALID_URL` | Tampilkan dialog ramah: *"Akun kreator di-private atau link tidak valid, bro."* |
| **Batas Kuota AI (Rate Limit)** | `RATE_LIMIT_EXCEEDED` | Otomatis fallback ke antrean lokal (Local Queue) untuk diproses ulang saat kuota reset |
| **Koneksi Internet Putus** | `NETWORK_UNAVAILABLE` | Simpan URL ke antrean `PendingIngestionQueue` di SQLite lokal, beri Nootti cemilan darurat |
| **Format Bahasa Campuran** | `MIXED_LANGUAGE` | Whisper Large-v3 otomatis mendeteksi bahasa Indonesia, daerah (Jawa/Sunda), & slang Gen-Z |
