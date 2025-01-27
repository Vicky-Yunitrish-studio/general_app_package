# General App Package

A Flutter package providing reusable components and utilities for general app development.

## Features

- Base controller with common functionality
- API service integration
- Local storage service
- App configuration management
- Common utilities and constants

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  general_app_package: ^0.0.1
```

## Usage

Initialize the package in your main.dart:

```dart
void main() {
  AppConfig().initialize(
    baseUrl: 'https://your-api.com',
    isDevelopment: true,
  );
  runApp(MyApp());
}
```

## Additional information

For more information about this package, please visit the [GitHub repository](https://github.com/Vicky-Yunitrish-studio/general_app_template).
