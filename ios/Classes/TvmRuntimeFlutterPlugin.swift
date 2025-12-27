import Flutter
import UIKit

/// Minimal plugin class for TVM runtime.
/// This plugin does not expose any Flutter methods - it only ensures
/// that libtvm_runtime.a and libtvm_ffi_static.a are linked.
public class TvmFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // No method channel needed - this plugin is for static linking only
  }
}
