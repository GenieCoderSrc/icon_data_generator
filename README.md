# icon_data_generator

A Dart code generator package to produce Flutter Material Icon mappings using `build_runner`. This tool enables automated generation of icon code point to name mappings, making it ideal for Flutter applications that require icon metadata at runtime or during development.

---

## ✨ Features

* 🔧 Automatically extracts `IconData` mappings from Flutter's `icons.dart`
* ⇁ Generates code for bidirectional mapping between icon names and code points
* 🔌 Seamless integration with `build_runner` workflows

---

## 🚀 Getting Started

### 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
resolution: workspace

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  icon_data_generator:
    git:
      url: https://github.com/your-org/icon_data_generator.git
  build_runner: latest_version
```

---

## ⚙️ Usage

Run the code generation command:

```bash
flutter pub run build_runner build
```

This will generate:

* `lib/icon_maps/material_icons_mapper.g.dart`
* `lib/icon_maps/material_icon_data_map.g.dart`

These files contain:

* A `Map<int, String>` for code point to icon name resolution
* A `Map<String, int>` for icon name to code point resolution

---

## 🛠️ Output Example

```dart
// material_icons_mapper.g.dart

const Map<int, String> iconCodePointToName = {
  57344: 'ten_k',
  59136: 'ten_k_sharp',
  62687: 'ten_k_rounded',
  60914: 'ten_k_outlined',
  // ... more icons
};

const Map<String, int> iconNameToCodePoint = {
  'ten_k': 57344,
  'ten_k_sharp': 59136,
  'ten_k_rounded': 62687,
  'ten_k_outlined': 60914,
  // ... more icons
};
```

---

## 🧹 Use Case

Ideal for:

* Icon pickers
* Runtime icon inspection
* Custom UI rendering based on icon metadata

---

## 📜 License

MIT License

---

## 👨‍👷 Maintainer

This package is maintained by [Shohidul Islam](https://github.com/shohidul).

---

## 🤝 Contributions

Pull requests and issues are welcome! Please run:

```bash
dart format .
flutter pub run build_runner build --delete-conflicting-outputs
```

before submitting a PR.
