#import "FlutterLqruiPlugin.h"
#if __has_include(<flutter_lqrui/flutter_lqrui-Swift.h>)
#import <flutter_lqrui/flutter_lqrui-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_lqrui-Swift.h"
#endif

@implementation FlutterLqruiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterLqruiPlugin registerWithRegistrar:registrar];
}
@end
