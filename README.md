/**
 * Adds SecretLogging to your app.
 *
 * Usage:
 *  // Add to your 'main.m' like this
 *  int main(int argc, char *argv[]) {
 *      @autoreleasepool {
 *          [BMSecretLog go];
 *          return UIApplicationMain(argc, argv, nil, NSStringFromClass(AppDelegate.class));
 *      }
 *  }
 *
 * Triggered by a 3 second long press on any screen.
 * Will print to standard debug console if phone is 
 *   connected to Xcode, or to SecretLog if not.
 * 
 * Note: requires a public `window` property on 
 *       your AppDelegate.
 *
 */
