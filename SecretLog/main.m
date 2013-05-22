//
//  main.m
//  SecretLog
//
//  Created by Jeffrey Camealy on 5/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


void redirectSTDERR () {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *log = [paths[0] stringByAppendingPathComponent:@"ns.log"];
    [NSFileManager.defaultManager removeItemAtPath:log error:nil]; // delete existing file
    freopen([log fileSystemRepresentation], "a", stderr);
}

int main(int argc, char *argv[]) {
    @autoreleasepool {
        redirectSTDERR();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(AppDelegate.class));
    }
}
