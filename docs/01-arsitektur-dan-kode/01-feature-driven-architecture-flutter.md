# 🏗️ Panduan Susunan Folder & Arsitektur Kodingan Berbasis Fitur (Flutter 3.x & Dart)

Halo tim Nootid! Di dokumen ini kita bakal membedah tuntas gimana cara menyusun struktur folder dan kodingan modern di project Flutter kita, dirancang khusus untuk platform **Nootid**: *Platform Edutech Gamified Knowledge Hub Terintegrasi AI* dengan standar industri mobile.

Kita tidak menumpuk semua file berdasarkan jenisnya (misal semua widget dicampur di satu folder raksasa). Kita mengadopsi **Feature-First & Layered Architecture** (Presentation, Domain, Data) yang didukung oleh **Flutter Riverpod** untuk state management. Kodingan bakal tetap bersih, modular, testable, 60–120 FPS lancar, dan gampang di-maintain!

---

## 1. Peta Susunan Folder Project Nootid Mobile (`lib/`)

```text
root/
├── .github/workflows/                 # CI/CD Flutter build APK, AAB & test
├── docs/                              # Dokumentasi resmi arsitektur, SOP, devops, security & agency
├── project-specs/                     # Spec nootid-setup, lean-canvas, anggaran PKM
├── project-tasks/                     # Tasklist granular development
├── assets/                            # Aset visual & audio lokal
│   ├── animations/                    # Lottie / Rive file (animasi Nootti makan, happy, idle)
│   ├── audio/                         # Sound effect sfx (chew.mp3, levelup.mp3, pop.mp3)
│   ├── icons/                         # SVG icons (Instagram, TikTok, YouTube, X, mascot)
│   └── images/                        # Ilustrasi onboarding, placeholder thumbnail
├── android/                           # Native Android project & Share Sheet Intent Filter
├── ios/                               # Native iOS project & Share Extension
│
└── lib/                               # SOURCE CODE UTAMA (FLUTTER 3.x)
    ├── main.dart                      # Entry point, ProviderScope, ErrorWidget handler
    ├── app.dart                       # MaterialApp.router, AppTheme, global routes
    │
    ├── core/                          # CORE FOUNDATION (Shared across features)
    │   ├── constants/                 # AppColors, AppTypography, AppSpacing, AppAssets
    │   ├── errors/                    # Failure classes, Exceptions, ErrorHandler
    │   ├── network/                   # Dio client, Interceptors, SSL Pinning, RetryPolicy
    │   ├── theme/                     # Light & Dark ThemeData, Mascot palettes
    │   └── utils/                     # LinkParser, DateFormatter, ShareIntentReceiver
    │
    ├── features/                      # FITUR MODULAR (Feature-First)
    │   │
    │   ├── mascot/                    # Engine Virtual Pet "Nootti the Capybara"
    │   │   ├── data/                  # MascotRepository, LocalMascotDataSource (Hive/Prefs)
    │   │   ├── domain/                # MascotModel, MascotMood (idle, eating, happy, hungry)
    │   │   ├── presentation/          # MascotWidget, CanvasChewPainter, MascotController (Riverpod)
    │   │   └── widgets/               # MoodBubble, LevelBadge, FeedingAnimationOverlay
    │   │
    │   ├── notes_ingestion/           # Intake Link Medsos & AI Summarizer
    │   │   ├── data/                  # NotesRepository, WhisperSTTService, GeminiSummarizerService
    │   │   ├── domain/                # NoteModel, KeyTakeaway, SocialPlatformEnum
    │   │   ├── presentation/          # QuickLinkBar, NoteDetailScreen, IngestionController
    │   │   └── widgets/               # NoteCard, PlatformBadge, ReflectionInput
    │   │
    │   ├── pet_sanctuary/             # Kustomisasi & Unlock Hewan Lain (Miko, Robi)
    │   │   ├── data/                  # CosmeticsRepository
    │   │   ├── domain/                # AccessoryModel, PetTypeEnum
    │   │   └── presentation/          # CustomizeMascotModal, WardrobeGrid
    │   │
    │   ├── recap_wrapped/             # Knowledge Screen Time (Monthly Recap)
    │   │   ├── data/                  # RecapStatsRepository
    │   │   ├── domain/                # MonthlyStatsModel, TopCategoryBreakdown
    │   │   └── presentation/          # KnowledgeWrappedScreen, StoryShareCard916
    │   │
    │   └── auth_profile/              # Otentikasi Supabase & User Profile
    │       ├── data/                  # AuthRepository, SupabaseAuthDataSource
    │       ├── domain/                # UserModel, AuthState
    │       └── presentation/          # LoginScreen, ProfileScreen, AuthController
    │
    └── shared/                        # WIDGET REUSABLE
        └── widgets/                   # AppButton, AppTextField, EmptyStateCard, SkeletonLoader
```

---

## 2. Pola 3-Layer di Setiap Fitur (Data, Domain, Presentation)

Setiap fitur dalam `lib/features/<nama_fitur>/` memiliki 3 lapisan pemisah tanggung jawab:

```text
┌────────────────────────────────────────────────────────┐
│  1. Presentation Layer (UI & State)                    │
│     - Widget: Komponen UI reaktif                      │
│     - Controller (Riverpod Notifier): Mengelola state  │
└───────────────────────────┬────────────────────────────┘
                            │ Memanggil Use Case / Model
                            ▼
┌────────────────────────────────────────────────────────┐
│  2. Domain Layer (Bisnis Logic Murni - Pure Dart)      │
│     - Entities/Models: Blueprint objek data            │
│     - Bebas ketergantungan Flutter UI / library luar   │
└───────────────────────────┬────────────────────────────┘
                            │ Memanggil Repository Interface
                            ▼
┌────────────────────────────────────────────────────────┐
│  3. Data Layer (Sumber Data Eksternal)                 │
│     - Repository Implementation: Menggabung lokal & API│
│     - Data Sources: Dio / Groq / Gemini / Hive / SQL   │
└────────────────────────────────────────────────────────┘
```

---

## 3. Contoh Implementasi State Management: Riverpod Notifier

Contoh controller untuk memberi makan Nootti the Capybara saat link medsos masuk:

```dart
// lib/features/mascot/presentation/mascot_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/mascot_model.dart';
import '../data/mascot_repository.dart';

final mascotControllerProvider = StateNotifierProvider<MascotController, MascotState>((ref) {
  final repo = ref.watch(mascotRepositoryProvider);
  return MascotController(repo);
});

class MascotController extends StateNotifier<MascotState> {
  final MascotRepository _repository;

  MascotController(this._repository) : super(MascotState.initial()) {
    loadMascot();
  }

  Future<void> loadMascot() async {
    final mascot = await _repository.getMascotData();
    state = state.copyWith(mascot: mascot, status: MascotStatus.loaded);
  }

  Future<void> feedLink({required String url, required String platform}) async {
    // 1. Ubah state jadi sedang mengunyah (trigger animasi & sound effect)
    state = state.copyWith(currentMood: MascotMood.eating);

    // 2. Simpan progres & tambah exp
    final updatedMascot = state.mascot.increaseExp(points: 15);
    await _repository.saveMascotData(updatedMascot);

    // 3. Setelah animasi kunyah selesai, mood berubah menjadi Happy / Zen
    await Future.delayed(const Duration(milliseconds: 1800));
    state = state.copyWith(
      mascot: updatedMascot,
      currentMood: MascotMood.happy,
    );
  }
}
```

---

## 4. Golden Rules Pengembangan Flutter di Nootid

1. **Anti `setState` Liar di Komponen Besar**: Gunakan `flutter_riverpod` agar hanya widget yang datanya berubah yang di-rebuild. Render tetap 60-120 FPS tanpa lag.
2. **Pisahkan Business Logic dari UI**: Dilarang memanggil HTTP request atau parsing AI langsung di dalam `build()` method widget.
3. **Responsive by Design**: Gunakan `MediaQuery`, `LayoutBuilder`, dan ekstensi helper agar proporsional di smartphone (360px s/d 430px) hingga tablet.
4. **Clean Asset Management**: Semua path aset gambar, lottie/rive, dan audio wajib didefinisikan di `AppAssets` konstanta agar bebas typo.
