//
//  TaskyAppDelegate.h
//  Tasky
//
//  Created by Steve Baker on 4/7/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TaskyAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
