//
//  AppDelegate.m
//  SecretLog
//
//  Created by Jeffrey Camealy on 5/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "AppDelegate.h"
#import "LogVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupMainWindow];
    self.window.rootViewController = UIViewController.new;
//    self.window.rootViewController = LogVC.new;
//    
//    UILongPressGestureRecognizer *recognizer = [UILongPressGestureRecognizer.alloc initWithTarget:self.window.rootViewController
//                                                                                           action:@selector(longPressed)];
//    recognizer.minimumPressDuration = 2;
//    recognizer.numberOfTouchesRequired = 3;
//    [self.window addGestureRecognizer:recognizer];
    
    
    return YES;
}

- (void)setupMainWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}


#pragma mark - Action Method

- (void)longPressed {
    [self.window.rootViewController presentViewController:LogVC.new animated:YES completion:nil];
}


@end
