# tvm_flutter

Provides Apache TVM C++ runtime for Flutter plugins.

## Purpose

This plugin provides the TVM runtime (`libtvm_runtime.a`/`libtvm_runtime.so`) and FFI bindings (`libtvm_ffi_static.a`/`libtvm_ffi.so`) to the app. It uses static linking for Apple platforms (to satisfy App Store requirements). NOTE: This plugin does **not** expose any Dart APIs.

Flutter projects utilizing Apache TVM can depend on this plugin to 1) get access to TVM-compiled module loaders and Relax VM and 2) avoid duplicate symbol errors when multiple TVM-based plugins are used together.

## Usage

Add this plugin as a dependency in your model plugin:

### pubspec.yaml
```yaml
dependencies:
  tvm_runtime_flutter:
    # path: https://github.com/yunho-c/tvm_flutter  # from git
    # path: ../tvm_runtime_flutter  # if cloned locally
```

### podspec (iOS)
```ruby
s.dependency 'tvm_runtime_flutter'
```

> `TODO`: Add more detailed documentation

## Supported Platforms

- Android - planned
- iOS (arm64)
- macOS (arm64) - planned
- Windows - planned
- Linux - planned

## License

Apache 2.0
