//
//  BMSecretLog.m
//  SecretLog
//
//  Created by Jeffrey Camealy on 5/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMSecretLog.h"
#import "LogVC.h"

@interface BMSecretLog () {
    LogVC *logVC;
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
        
        double delayInSeconds = 0.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self addGestureRecognierToMainWindow];
        });
    }
    return self;
}


#pragma mark - Public API

+ (void)go {
    [BMSecretLog sharedInstance];
}


#pragma mark - Private API

- (void)redirectSTDERR {
    if(isatty(STDERR_FILENO)) return;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *log = [paths[0] stringByAppendingPathComponent:@"ns.log"];
    [NSFileManager.defaultManager removeItemAtPath:log error:nil]; // delete existing file
    freopen([log fileSystemRepresentation], "a", stderr);
}

- (UIWindow *)mainWindow {
    return [UIApplication.sharedApplication.delegate window];
}

- (void)addGestureRecognierToMainWindow {
    UILongPressGestureRecognizer *recognizer = [UILongPressGestureRecognizer.alloc initWithTarget:self
                                                                                           action:@selector(successfulLongPress)];
    recognizer.minimumPressDuration = 2;
    recognizer.numberOfTouchesRequired = 2;
    [self.mainWindow addGestureRecognizer:recognizer];
}

- (void)successfulLongPress {
    logVC = LogVC.new;
    if(!UIApplication.sharedApplication.statusBarHidden) {
        float statusBarHeight = 20;
        logVC.view.frame = CGRectMake(0, statusBarHeight,
                                      logVC.view.frame.size.width, logVC.view.frame.size.height-statusBarHeight);
    }
    [self.mainWindow addSubview:logVC.view];
}


@end

































