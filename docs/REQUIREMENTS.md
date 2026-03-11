# Requirements

## Functional Requirements

### Implemented

1. The app must provide three tabs: `Map`, `Simulation`, and `Reports`.
2. The simulation must follow a 4-phase traffic cycle:
   - Red
   - Red + Amber
   - Green
   - Amber
3. The simulation must show the active phase and a live countdown.
4. Users must be able to:
   - Start/Pause simulation
   - Move to next phase manually
   - Reset simulation to initial state
5. Users must be able to configure phase durations at runtime.
6. The traffic light widget must visually indicate active and inactive lamps.

### Planned

1. Map-based traffic context and intersection visualization.
2. Reporting and analytics views with simulation metrics.
3. Multi-intersection support.

## Non-Functional Requirements

1. The app should run on major Flutter-supported platforms.
2. UI should be responsive for both mobile and wider desktop/tablet layouts.
3. Transition logic should remain deterministic and easy to test.
4. Code should pass `flutter analyze` and existing tests.

## Development Environment Requirements

Minimum recommended setup:
- Flutter SDK: stable channel
- Dart SDK: `>=3.0.0 <4.0.0`
- Git
- A supported IDE (VS Code or Android Studio)

Platform-specific requirements:
- Android: Android SDK + emulator/device
- iOS/macOS: Xcode + simulator/device (macOS only)
- Web: Chrome or compatible browser

## Runtime Configuration

Current app behavior does not require mandatory runtime secrets.

Potential future configuration:
- Map-related access tokens (for example Mapbox), usually provided by environment variables and loaded with `flutter_dotenv`.

## Validation Requirements

Before publishing changes:

```bash
flutter pub get
flutter analyze
flutter test
```

## Git and Release Requirements

1. Keep `main` stable.
2. Implement features in dedicated branches.
3. Merge via reviewed pull requests when possible.
4. Maintain clear commit messages using prefixes such as `feat`, `fix`, `docs`, and `chore`.
