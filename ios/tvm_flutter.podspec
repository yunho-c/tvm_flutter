#
# TVM Runtime Flutter Plugin
#
# This podspec provides libtvm_runtime.a and libtvm_ffi_static.a for iOS.
# Model-specific plugins should depend on this to avoid duplicate symbols.
#

Pod::Spec.new do |s|
  s.name             = 'tvm_flutter'
  s.version          = '0.1.0'
  s.summary          = 'Shared TVM runtime for Flutter plugins.'
  s.description      = <<-DESC
Provides libtvm_runtime.a and libtvm_ffi_static.a for iOS static linking.
Model plugins (e.g., charsiug2p_flutter) depend on this to avoid duplicate TVM symbols.
                       DESC
  s.homepage         = 'https://github.com/yunho-c/tvm_flutter'
  s.license          = { :type => 'Apache-2.0', :file => '../LICENSE' }
  s.author           = { 'Yunho Cho' => 'opensource@yunhocho.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.platform         = :ios, '14.0'

  # Static libraries
  s.vendored_libraries = 'libs/libtvm_runtime.a', 'libs/libtvm_ffi_static.a'
  s.preserve_paths = 'libs/**/*'

  # Force-load to ensure TVM registration functions are not stripped
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'OTHER_LDFLAGS' => '-force_load ${PODS_TARGET_SRCROOT}/libs/libtvm_runtime.a ' +
                       '-force_load ${PODS_TARGET_SRCROOT}/libs/libtvm_ffi_static.a',
  }

  # Required frameworks for Metal GPU support
  s.frameworks = 'Metal', 'Foundation', 'MetalPerformanceShaders'

  # System libraries required by TVM
  s.libraries = 'c++'
end
