//
//  BMSecretLog.m
//  SecretLog
//
//  Created by Jeffrey Camealy on 5/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMSecretLog.h"
#import "BMLogVC.h"
#import "BMLogVCDelegate.h"

@interface BMSecretLog () <BMLogVCDelegate> {
    BOOL secretLogIsShowing;
    UIWindow *mainWindow;
    UIWindow *logWindow;
}
@end


@implementation BMSecretLog

#pragma mark - Singleton Method

+ (id)sharedInstance {
    static id __sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = BMSecretLog.new;
    });
    return __sharedInstance;
}


#pragma mark - Init Method

- (id)init {
    if (self = [super init]) {
        [self redirectSTDERR];
        [self addGestureRecognierToMainWindow];
    }
    return self;
}


#pragma mark - Public API

+ (void)go {
    [BMSecretLog sharedInstance];
}


#pragma mark - Private API

- (void)redirectSTDERR {
    if(self.deviceIsConnectedToComputer) return;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *log = [paths[0] stringByAppendingPathComponent:@"ns.log"];
    [NSFileManager.defaultManager removeItemAtPath:log error:nil]; // delete existing file
    freopen([log fileSystemRepresentation], "a", stderr);
}

- (BOOL)deviceIsConnectedToComputer {
    return isatty(STDERR_FILENO);
}

- (void)addGestureRecognierToMainWindow {
    mainWindow = UIApplication.sharedApplication.windows.lastObject;
    UILongPressGestureRecognizer *recognizer = [UILongPressGestureRecognizer.alloc initWithTarget:self
                                                                                           action:@selector(successfulLongPress)];
    recognizer.minimumPressDuration = 2;
    recognizer.numberOfTouchesRequired = 3;
    [mainWindow addGestureRecognizer:recognizer];
}

- (void)successfulLongPress {
    if (secretLogIsShowing) return;
    
    secretLogIsShowing = YES;
    
    logWindow = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [logWindow makeKeyAndVisible];
    
    BMLogVC *logVC = BMLogVC.new;
    logVC.delegate = self;
    logWindow.rootViewController = logVC;
}


#pragma mark - LogVC Delegate Method

- (void)logVCIsReadyToDismiss {
    [mainWindow makeKeyAndVisible];
    logWindow = nil;
    secretLogIsShowing = NO;
}

@end

































