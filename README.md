# Webtu Student Portal

Screenshot-based Flutter prototype for Android. The supplied 1080x2400 reference
screenshots are used as screen backgrounds, with transparent hit areas providing
navigation and placeholder interactions.

## Requirements

- Flutter 3.41.2 or newer
- Dart 3.11.0 or newer
- Android Studio with an Android SDK and an emulator or connected device

The project root is this directory (`progress-replica`). Run all Flutter
commands from here. Android Studio creates `android/local.properties` locally;
that file contains machine-specific SDK paths and is intentionally ignored by
Git.

## Run and build

From the project root:

```shell
flutter pub get
dart run flutter_launcher_icons
flutter run
flutter build apk --release
```

The release APK is written to
`build/app/outputs/flutter-apk/app-release.apk`.

## Test and analyze

```shell
flutter analyze
flutter test
```

## Adjusting hit areas

All reference coordinates are in `lib/core/hit_areas.dart` and use the
1080x2400 reference canvas. `PositionedRect` scales them proportionally to the
current display size.

To show the transparent button bounds while tuning coordinates, change this
global in `lib/main.dart`:

```dart
const bool kShowHitAreas = true;
```

Set it back to `false` for the normal screenshot appearance.
