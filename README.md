# SecretLog

Allows your app to access the debug console for your iOS App when not plugged into a computer.

## Getting Started
Simply add `SecretLog` to your `main.m` file.

```objc
#import "BMSecretLog.h" // <-- Include

int main(int argc, char *argv[]) {
	@autoreleasepool {
		[BMSecretLog go]; // <-- Kickoff
		return UIApplicationMain(argc, argv, nil, NSStringFromClass(AppDelegate.class));
	}
}
```

## Usage
- Perform a 3 finger, 3 second long press on any screen to display your `SecretLog`  
- If you launch while connected to Xcode, logging will display as normal in the console
- If you launch while not connected, logging will display in `SecretLog`

## Caveat
`SecretLog` requires the following property on your AppDelegate:  
`@property (strong, nonatomic) UIWindow *window;`
