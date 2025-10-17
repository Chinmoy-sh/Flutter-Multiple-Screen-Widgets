# 🤖 Flutter Multiple Screen Widgets

A clean, modern showcase of frequently used Flutter widgets with smooth animations, page transitions, and multi‑platform support. Great as a learning app for beginners and a quick starter for real projects.

> Built with Flutter and Dart, featuring a polished UI, animated lists, and a simple multi‑page navigation flow.

## ✨ Features

- Splash screen: Fade/scale intro with timed navigation
- Animated list: `flutter_staggered_animations` for slide/fade effects
- Typography: Styled texts and themed `TextTheme`
- Icons: Curated icon showcase
- Buttons: Elevated, Text, and Icon variants (with feedback)
- Advanced UI: Gradient cards, rounded corners, shadows
- Form input: Interactive `TextField` with prefix/suffix and clear action
- Toggles: `Switch` and `Checkbox` with SnackBar feedback
- Feedback: Centralized `SnackBar` helper
- Smooth navigation: Custom `PageRouteBuilder` transitions
- Included pages: Home, Profile, Settings (animated switches), Gallery (animated grid), About
- Platforms: Android, iOS, Web, Windows, macOS, Linux

## 💻 Tech Stack

- Flutter (stable)
- Dart ^3.8
- Packages: `flutter_staggered_animations`

## 🚀 Quick Start

Prerequisites:

- Install Flutter and set up a device/emulator. See Flutter’s official [Get Started](https://docs.flutter.dev/get-started/install).

Clone and run:

```powershell
git clone https://github.com/Chinmoy-sh/Flutter-Multiple-Screen-Widgets.git
cd Flutter-Multiple-Screen-Widgets
flutter pub get
flutter run
```

Run on a specific platform:

```powershell
# Desktop
flutter run -d windows
flutter run -d macos
flutter run -d linux

# Mobile
flutter run -d android
flutter run -d ios

# Web
flutter run -d chrome
```

## 🛠️ Build Releases

```powershell
# Android
flutter build apk --release

# iOS (requires Xcode/macOS)
flutter build ios --release

# Windows / macOS / Linux
flutter build windows --release
flutter build macos --release
flutter build linux --release

# Web
flutter build web --release
```

## 🧱 Project Structure

```text
lib/
  main.dart            # Entry point + routes + screens
test/
  widget_test.dart     # Sample Flutter widget test

android/, ios/, web/, windows/, macos/, linux/
  Platform-specific bootstrap code
```

Key entry points:

- `lib/main.dart`: App theme, Splash screen, Home, Profile, Settings, Gallery, About, and custom transitions
- `pubspec.yaml`: Dependencies, SDK constraints, and platform configuration

## ♻️ How to Use the App

- Start the app, view the splash intro, and land on Home
- Explore sections: text styles, icons, buttons, advanced UI
- Try inputs: toggle switches/checkbox, type in the text field (clear icon appears dynamically)
- Navigate via AppBar/actions or the Home buttons to Profile, Gallery, and About
- Open Settings from Profile to try animated switches

## 📸 Screenshots

Add your screenshots to `docs/screenshots/` and reference them here:

```markdown
![Home](docs/screenshots/home.png)
![Gallery](docs/screenshots/gallery.png)
```

## 🧪 Testing

```powershell
flutter test
```

## 🤝 Contributing

Contributions are welcome! If you’d like to improve the UI, add examples, or fix bugs:

- Open an issue describing the change
- Fork the repo and create a feature branch
- Submit a PR with a clear description and screenshots (if UI changes)

## 🎫 License

This project currently does not specify a license. If you are the owner, consider adding a license (e.g., MIT, Apache-2.0) to clarify usage.

## 📢 Acknowledgments

- Flutter team and community
- [`flutter_staggered_animations`](https://pub.dev/packages/flutter_staggered_animations)

— Happy Fluttering!
