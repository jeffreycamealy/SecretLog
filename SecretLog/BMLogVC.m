//
//  BMLogVC.m
//  Console
//
//  Created by Jeffrey Camealy on 5/7/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "BMLogVC.h"

@interface BMLogVC () {
    BOOL firstOpen;
}
@end


@implementation BMLogVC

#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *logPath = [paths[0] stringByAppendingPathComponent:@"ns.log"];
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:logPath];
        [fileHandle seekToEndOfFile];
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(getData:)
                                                   name:@"NSFileHandleReadCompletionNotification"
                                                 object:fileHandle];
        [fileHandle readInBackgroundAndNotify];
        firstOpen = YES;
    }
    return self;
}


#pragma mark - View Lifecycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *logPath = [paths[0] stringByAppendingPathComponent:@"ns.log"];
    
    if (firstOpen) {
        NSString *content = [NSString stringWithContentsOfFile:logPath
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
        self.textView.editable = YES;
        self.textView.text = [self.textView.text stringByAppendingString:content];
        self.textView.editable = NO;
        firstOpen = NO;
    }
}


#pragma mark - NSLog Redirection Methods

- (void)getData:(NSNotification *)notification {
    NSData *data = notification.userInfo[NSFileHandleNotificationDataItem];
    if (data.length) {
        NSString *string = [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
        self.textView.editable = YES;
        self.textView.text = [self.textView.text stringByAppendingString:string];
        self.textView.editable = NO;
        
        [self setWindowScrollToVisible];
        [notification.object readInBackgroundAndNotify];
    } else {
        [self performSelector:@selector(refreshLog:) withObject:notification afterDelay:1.0];
    }
}

- (void)refreshLog:(NSNotification *)notification {
    [notification.object readInBackgroundAndNotify];
}

- (void)setWindowScrollToVisible {
    NSRange txtOutputRange;
    txtOutputRange.location = self.textView.text.length;
    txtOutputRange.length = 0;
    self.textView.editable = YES;
    [self.textView scrollRangeToVisible:txtOutputRange];
    [self.textView setSelectedRange:txtOutputRange];
    self.textView.editable = NO;
}

- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender {
    [self.delegate logVCIsReadyToDismiss];
}
@end
































