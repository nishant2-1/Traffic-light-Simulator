# Tech Stack

## Core Technologies

| Technology | Version / Constraint | Purpose |
|---|---|---|
| Flutter | Stable SDK | Cross-platform UI framework |
| Dart | `>=3.0.0 <4.0.0` | Application programming language |
| Material 3 | Flutter built-in | Design system for UI components |

## Dependencies

From `pubspec.yaml`:

| Package | Version | Usage Status | Purpose |
|---|---|---|---|
| `cupertino_icons` | `^1.0.8` | Active | iOS-style icon set |
| `mapbox_maps_flutter` | `^2.17.0` | Planned expansion | Map integration capability |
| `provider` | `^6.0.5` | Planned expansion | State management option |
| `flutter_dotenv` | `^6.0.0` | Planned expansion | Environment variable loading |
| `geolocator` | `^14.0.2` | Planned expansion | Device location services |

## Testing and Quality Tooling

| Tool | Purpose |
|---|---|
| `flutter_test` | Widget and unit testing |
| `flutter_lints` | Static lint rules |
| `flutter analyze` | Static analysis and lint validation |

## Build and Run Commands

Install dependencies:

```bash
flutter pub get
```

Run app:

```bash
flutter run
```

Run static analysis:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

## Platform Targets

The repository contains platform folders for:
- Android
- iOS
- Web
- macOS
- Linux
- Windows

## Why This Stack

1. Flutter enables one codebase for multiple platforms.
2. Dart provides predictable performance and strong tooling.
3. Material components speed up UI implementation while keeping consistency.
4. Included dependencies support planned migration from a simple simulator to a geo-aware traffic analysis platform.
