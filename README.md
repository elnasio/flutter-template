# 🚀 Flutter Project Template: Clean Architecture + BLoC + GoRouter + Dio

Template ini dirancang untuk membangun proyek Flutter dengan struktur modular, scalable, dan production-ready.

---

## 📁 Struktur Folder

```
lib/
├── core/              # Config global, error handler, api_config, env_keys
├── data/              # Data umum (jika diperlukan lintas fitur)
├── domain/            # Entitas dan abstraksi global (jika ada)
├── features/          # Fitur utama (auth, profile, dsb)
│   └── {feature}/
│       ├── data/
│       │   ├── datasources/
│       │   ├── endpoints/
│       │   └── models/
│       ├── domain/
│       │   ├── entities/
│       │   └── repositories/
│       └── presentation/
│           ├── bloc/
│           └── pages/
├── modules/           # Optional module reusable
├── services/          # SessionService, LocalStorage, Logger, dsb
├── ui/
│   └── widgets/       # Komponen UI reusable
├── di/                # Dependency Injection per modul
│   ├── injection.dart
│   ├── profile_di.dart
│   └── network_di.dart
└── app.dart           # Entry point UI
```

---

## ⚙️ Teknologi & Library

- 🧱 **State Management**: `flutter_bloc`
- 🧭 **Routing**: `go_router` + `ShellRoute` + type-safe enum route
- 🌐 **HTTP Client**: `dio`
- 🔐 **Session & Auth**: `SharedPreferences`, `authNotifier`
- 🛠️ **DI**: `get_it`, dipisah per modul
- 🧪 **Environment**: `flutter_dotenv`, dengan dukungan `.env.dev`, `.env.release`
- 🔒 **SSL Pinning (optional)**: aktif hanya di `release`, pakai `.pem`

---

## 🧩 Prinsip Desain

- SSOT (Single Source of Truth) untuk semua: route, env key, baseURL, state
- BottomNavigation tidak rebuild ulang screen (pakai ShellRoute)
- Struktur folder siap tim besar
- Semua komponen UI reusable
- DI aman dari duplicate (pakai `isRegistered()`)

---

## 🛠️ Jalankan Proyek

```bash
flutter run --dart-define=ENV=dev
```

---

## 📦 Assets & ENV

```yaml
flutter:
  assets:
    - .env
    - .env.dev
    - .env.release
    - assets/cert/cert.pem
```

---

## 🔐 SSL Pinning

- Sertifikat `.pem` diletakkan di `assets/cert/`
- Gunakan `SecurityContext` untuk aktivasi di release mode
- Bisa diaktifkan opsional via `createPinnedAdapter()`

---

## 🧠 Tips

- Gunakan enum + sealed class untuk semua path route (`RouteKey`, `AppRoute`)
- Gunakan `authNotifier` untuk refresh navigasi setelah login/logout
- Pisahkan semua dependensi ke dalam modul DI masing-masing

---

## ✅ Siap digunakan untuk:
- Aplikasi skala besar
- Tim dengan banyak developer
- Lingkungan multi-environment (dev/staging/prod)
# flutter-template
# flutter-template
# flutter-template
