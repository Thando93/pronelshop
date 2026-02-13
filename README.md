# pronelshop
shopping at its best

## Overview

This repository contains the Flutter app `pronelshop_app` — a minimal e-commerce starter.

## Local setup

Prerequisite: install the Flutter SDK (https://flutter.dev/docs/get-started/install).

From the repository root:

```bash
cd pronelshop_app
flutter pub get
flutter analyze
flutter run
```

## CI

A GitHub Actions workflow runs `flutter pub get`, `flutter analyze` and `flutter test` on pushes and PRs. The workflow file is at `.github/workflows/flutter-analyze.yml`.

## Notes

- If `flutter` is not available in your environment, follow the official install guide above.
- If you want, I can add more CI jobs (build, format check, platform-specific tests).

