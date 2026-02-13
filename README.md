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

## Navigation

The app features a tabbed bottom navigation bar with:
- **Home** — Welcome screen
- **Search** — Product search
- **Products** — Browse products catalog
- **Cart** — Shopping cart
- **Account** — User account settings

## CI/CD

Two GitHub Actions workflows are configured:

1. **Flutter CI** (`.github/workflows/flutter-analyze.yml`): Runs on push and PRs
   - Installs dependencies
   - Runs `flutter analyze`
   - Runs `flutter test`

2. **Firebase Deploy** (`.github/workflows/firebase-deploy.yml`): Builds and deploys web version on main branch push
   - Builds Flutter web release
   - Deploys to Firebase Hosting

### Setup Firebase Hosting

To enable Firebase deployment, add these secrets to your GitHub repository settings:
- `FIREBASE_SERVICE_ACCOUNT` — Service account JSON (download from Firebase Console)

## Deployment

**Web:** The app auto-deploys to Firebase Hosting when you push to `main`. Visit your Firebase project URL once set up.

**Mobile:** Run locally with:
```bash
cd pronelshop_app
flutter run -d android    # Android
flutter run -d ios        # iOS
```

