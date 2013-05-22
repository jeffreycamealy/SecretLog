//
//  BMSecretLog.m
//  SecretLog
//
//  Created by Jeffrey Camealy on 5/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMSecretLog.h"
#import "LogVC.h"


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
        [self addGestureRecognierToMainWindow];
    }
    return self;
}


#pragma mark - Public API

+ (void)go {
    [BMSecretLog sharedInstance];
}


#pragma mark - Private API

- (UIWindow *)mainWindow {
    return [UIApplication.sharedApplication.delegate window];
}

- (void)addGestureRecognierToMainWindow {
    UILongPressGestureRecognizer *recognizer = [UILongPressGestureRecognizer.alloc initWithTarget:self.mainWindow.rootViewController
                                                                                           action:@selector(successfulLongPress)];
    recognizer.minimumPressDuration = 2;
    recognizer.numberOfTouchesRequired = 3;
    [self.mainWindow addGestureRecognizer:recognizer];
}

- (void)successfulLongPress {
    [self.mainWindow.rootViewController presentViewController:LogVC.new animated:YES completion:nil];
}


@end

































