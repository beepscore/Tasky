//
//  TaskyAppDelegate.h
//  Tasky
//
//  Created by Steve Baker on 4/7/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//  Ref: Dalrymple and Hillegass Advanced Mac OS X Programming Ch 14

#import <Cocoa/Cocoa.h>

@interface TaskyAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSTextField *pathTextField;
    NSTextView *outText;
}

#pragma mark -
#pragma mark properties
@property (assign) IBOutlet NSWindow *window;
@property(nonatomic,retain)IBOutlet NSTextField *pathTextField;
@property(nonatomic,retain)IBOutlet NSTextView *outText;

- (IBAction) handleListButton:(id)sender;

@end
