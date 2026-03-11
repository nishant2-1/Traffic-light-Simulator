# Traffic Light Simulator

A Flutter application that simulates a realistic traffic signal cycle with interactive timing controls.

Repository: `https://github.com/nishant2-1/Traffic-light-Simulator`

## Documentation Hub

Detailed project documentation is available in `docs/`:

- `docs/ARCHITECTURE.md` - system design, layers, state flow, and scaling path
- `docs/REQUIREMENTS.md` - functional/non-functional and environment requirements
- `docs/TECH_STACK.md` - technology choices, dependency roles, and tooling
- `docs/ACHIEVEMENTS.md` - completed milestones and portfolio impact
- `docs/PROJECT_STRUCTURE.md` - repository layout and ownership of key files

## About

This project is designed to model a traffic light system in a clean and interactive way for learning, demos, and future expansion into traffic analytics.

The current implementation focuses on:
- A realistic 4-phase signal sequence
- Live countdown for the active phase
- Runtime control (start, pause, next phase, reset)
- Adjustable timings for each phase
- Responsive UI for mobile and larger screens

The app uses a tab-based layout:
- `Map` tab: placeholder screen for map-based traffic features
- `Simulation` tab: active traffic signal simulation
- `Reports` tab: placeholder screen for metrics/reporting

## Traffic Signal Logic

The simulation follows this phase order:

1. `Red`
2. `Red + Amber`
3. `Green`
4. `Amber`
5. Back to `Red`

Default durations:
- Red: `30s`
- Red + Amber: `2s`
- Green: `25s`
- Amber: `3s`

Adjustable ranges:
- Red: `5s` to `120s`
- Red + Amber: `1s` to `10s`
- Green: `5s` to `120s`
- Amber: `2s` to `10s`

Behavior notes:
- Countdown decreases every second using a periodic timer.
- When the countdown reaches zero, the simulator automatically advances to the next phase.
- Changing the duration of the currently active phase immediately resets the countdown for that phase.
- Reset returns the simulation to the `Red` phase and pauses the timer.

## Tech Stack

- Flutter (Material 3)
- Dart SDK `>=3.0.0 <4.0.0`

Core dependencies in `pubspec.yaml`:
- `mapbox_maps_flutter`
- `provider`
- `flutter_dotenv`
- `geolocator`

Note: Some dependencies are part of future expansion and are not fully used by the current placeholder screens.

## Project Structure

Important files:

- `lib/main.dart`: App entry point and bottom navigation tabs
- `lib/screens/simulation_screen.dart`: Simulation state, timer, phase transitions, responsive layout
- `lib/widgets/traffic_light_widget.dart`: Visual traffic light display with active lamp glow animation
- `lib/widgets/control_panel.dart`: Timing sliders and run controls
- `test/widget_test.dart`: Basic widget-level app launch and navigation checks

## Getting Started

### 1. Prerequisites

- Flutter SDK installed and configured
- Dart SDK (comes with Flutter)
- Xcode (for iOS/macOS builds on macOS)
- Android Studio + Android SDK (for Android builds)

Verify your setup:

```bash
flutter --version
flutter doctor
```

### 2. Clone the Repository

```bash
git clone https://github.com/nishant2-1/Traffic-light-Simulator.git
cd Traffic-light-Simulator
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the App

```bash
flutter run
```

Optional target examples:

```bash
flutter run -d chrome
flutter run -d ios
flutter run -d android
```

## How To Use The Simulation

1. Open the `Simulation` tab from the bottom navigation.
2. Press `Start` to begin the cycle.
3. Watch the active phase and countdown update in real time.
4. Adjust phase durations with sliders.
5. Use:
	- `Pause` to stop the timer
	- `Next phase` to force an immediate transition
	- `Reset` to return to initial red state

## Quality Checks

Run static analysis:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

## Git Branching Used In This Project

- `main`: stable branch
- `feature/traffic-light-accuracy`: feature branch for simulation logic updates

Typical flow:

```bash
git checkout -b feature/your-feature-name
# make changes
git add .
git commit -m "feat: your update"
git push -u origin feature/your-feature-name
```

## Roadmap

Planned next improvements:
- Integrate real map interactions in `Map` screen
- Add simulation analytics and charts in `Reports`
- Support multiple intersections and lane-aware signal control
- Add persistence for timing presets
- Expand unit and widget test coverage for simulation edge cases

## License

No license file is currently included in this repository.
If you plan to open source this project, add a `LICENSE` file (for example MIT).
