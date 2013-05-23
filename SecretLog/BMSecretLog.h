//
//  BMSecretLog.h
//  SecretLog
//
//  Created by Jeffrey Camealy on 5/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMSecretLog : NSObject

/**
 * Adds SecretLogging to your app.
 *
 * Usage:
 *  // Just call it once 
 *  // (such as in you applicationDidFinishLaunching)
 *  
 *  [BMSecretLog go];
 *
 *
 * Triggered by a 3 second long press on any screen.
 * Will print to standard debug console if phone is 
 *   connected to Xcode, or to SecretLog if not.
 * 
 * Note: requires a public `window` property on 
 *       your AppDelegate.
 *
 */
+ (void)go;

@end
