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
    
    return YES;
}

- (void)setupMainWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

@end
