Allows your app to access the debug console when not plugged into a computer.

To use, simply add to your `main.m` file.

```objc
#import "BMSecretLog.h"

int main(int argc, char *argv[]) {
	@autoreleasepool {
		[BMSecretLog go];
		return UIApplicationMain(argc, argv, nil, NSStringFromClass(AppDelegate.class));
	}
}
```

SecretLog will display modally - triggered by a 3 second long press on any screen.  
Logging will print to standard debug console if phone is connected to Xcode, or to SecretLog if not.  

**Note:** SecretLog requires a public `window` property on your AppDelegate.
