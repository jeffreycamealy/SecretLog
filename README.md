# SecretLog

Allows you to access the debug console for your iOS App when not plugged into a computer.

## Getting Started

Add `SecretLog` folder to your project.

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [BMSecretLog go];
    return YES;
}
```

## Usage
1. Perform a 3 finger, 3 second long press on any screen to display your `SecretLog`  
- If you launch while your device is connected to Xcode, logging will display as normal in the console
- If you launch while not connected, logging will display in `SecretLog`

