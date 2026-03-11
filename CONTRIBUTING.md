# Contributing Guide

Thanks for your interest in improving Traffic Light Simulator.

## Workflow

1. Fork the repository.
2. Create a feature branch from `main`.
3. Make focused changes.
4. Run analysis and tests locally.
5. Open a pull request with a clear summary.

## Local Setup

```bash
git clone https://github.com/nishant2-1/Traffic-light-Simulator.git
cd Traffic-light-Simulator
flutter pub get
flutter analyze
flutter test
```

## Branch Naming

Use descriptive branch names:

- `feature/<short-description>`
- `fix/<short-description>`
- `docs/<short-description>`
- `chore/<short-description>`

Examples:
- `feature/multi-intersection-mode`
- `fix/timer-reset-bug`

## Commit Message Format

Use Conventional Commit style when possible:

- `feat: add X`
- `fix: correct Y`
- `docs: update Z`
- `chore: maintain W`
- `test: add coverage for V`

## Pull Request Checklist

Before creating a PR:

1. `flutter analyze` passes.
2. `flutter test` passes.
3. Documentation is updated if behavior changed.
4. PR title and description clearly explain intent.
5. Include screenshots for visible UI changes.

## Code Style

- Follow Dart/Flutter lint rules in `analysis_options.yaml`.
- Prefer small, readable widgets over large monolithic build methods.
- Keep simulation logic deterministic and easy to test.

## Reporting Issues

When reporting a bug, include:

1. Flutter version (`flutter --version`).
2. Target platform/device.
3. Reproduction steps.
4. Expected behavior vs actual behavior.
5. Logs or screenshots if available.
