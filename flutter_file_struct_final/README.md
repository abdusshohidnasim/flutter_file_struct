# flutter_file_struct

A Dart CLI package that auto-generates a complete Flutter project folder structure with a single command.

## What it generates

```
myapp/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_constants.dart
│   │   │   ├── app_colors.dart
│   │   │   └── app_text_styles.dart
│   │   ├── errors/
│   │   │   └── app_exception.dart
│   │   ├── extensions/
│   │   │   ├── string_extension.dart
│   │   │   └── context_extension.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   └── utils/
│   │       ├── logger.dart
│   │       └── helpers.dart
│   ├── data/
│   │   ├── models/
│   │   │   └── base_model.dart
│   │   ├── repositories/
│   │   │   └── base_repository.dart
│   │   └── services/
│   │       └── api_service.dart
│   └── presentation/
│       ├── routes/
│       │   └── app_routes.dart
│       ├── screens/
│       │   └── home_screen.dart
│       └── widgets/
│           └── common_button.dart
├── assets/
│   ├── images/
│   ├── icons/
│   ├── fonts/
│   └── animations/
├── pubspec.yaml       ← auto-configured with common dependencies
└── analysis_options.yaml
```

## Installation

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_file_struct: ^1.0.0
```

Then run:
```bash
dart pub get
```

## Usage

```bash
dart run flutter_file_struct <project_name>
```

### Example

```bash
dart run flutter_file_struct myapp
```

This will create the complete folder structure inside a `myapp/` folder in your current directory.

## What's in pubspec.yaml

The generated `pubspec.yaml` includes:

| Package | Purpose |
|---|---|
| `flutter_bloc` | State management |
| `equatable` | Value equality |
| `go_router` | Navigation |
| `http` + `dio` | Networking |
| `shared_preferences` | Local storage |
| `hive_flutter` | Local database |
| `get_it` | Dependency injection |
| `intl` | Internationalization |
