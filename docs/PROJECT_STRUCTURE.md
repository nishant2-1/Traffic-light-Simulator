# Project Structure

## High-Level Tree

```text
traffic_sim_flutter/
|- lib/
|  |- main.dart
|  |- screens/
|  |  |- map_screen.dart
|  |  |- simulation_screen.dart
|  |  `- reports_screen.dart
|  `- widgets/
|     |- control_panel.dart
|     `- traffic_light_widget.dart
|- test/
|  `- widget_test.dart
|- docs/
|  |- ACHIEVEMENTS.md
|  |- ARCHITECTURE.md
|  |- PROJECT_STRUCTURE.md
|  |- REQUIREMENTS.md
|  `- TECH_STACK.md
|- pubspec.yaml
|- analysis_options.yaml
`- README.md
```

## Directory Purpose

- `lib/`: Main application source code.
- `lib/screens/`: Screen-level features and orchestration.
- `lib/widgets/`: Reusable UI components.
- `test/`: Automated tests.
- `docs/`: Extended project documentation.

## Key File Responsibilities

- `lib/main.dart`: Application entry point and tab navigation shell.
- `lib/screens/simulation_screen.dart`: Simulation state machine, timer loop, and responsive composition.
- `lib/widgets/traffic_light_widget.dart`: Traffic light visualization.
- `lib/widgets/control_panel.dart`: Timing controls and simulation actions.
- `test/widget_test.dart`: Basic launch and navigation verification.

## Platform Folders

The repository includes Flutter platform directories for:
- `android/`
- `ios/`
- `macos/`
- `linux/`
- `windows/`
- `web/`

These are generated/managed by Flutter and are required for multi-platform builds.
