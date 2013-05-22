//
//  LogVC.h
//  Console
//
//  Created by Jeffrey Camealy on 5/7/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogVC : UIViewController
- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
