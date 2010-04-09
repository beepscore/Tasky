//
//  TaskyAppDelegate.m
//  Tasky
//
//  Created by Steve Baker on 4/7/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "TaskyAppDelegate.h"

@implementation TaskyAppDelegate

#pragma mark -
#pragma mark properties
@synthesize window;
@synthesize pathTextField;
@synthesize outText;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (IBAction) handleListButton:(id)sender {
    
    NSData *data;
    NSPipe *outPipe;
    NSTask *task;
    NSString *aString;
    
    task = [[NSTask alloc] init];
    outPipe = [[NSPipe alloc] init];

    // construct a command of the form ls -la <pathOfDirectoryToList>
    // e.g.                            ls -la /users/johndoe/documents
    // find launchPath by opening terminal and typing "which ls"
    [task setLaunchPath:@"/bin/ls"];
    [task setStandardOutput:outPipe];
    
    [task setArguments:[NSArray arrayWithObjects:@"-la",
                        [self.pathTextField stringValue],
                        nil]];
    
    [task launch];
    
    data = [[outPipe fileHandleForReading] readDataToEndOfFile];
    aString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    [outText setString:aString];
    [aString release];
    [task release];
    [outPipe release];
}


- (void)dealloc {
    [pathTextField release], pathTextField = nil;
    [outText release], outText = nil;
    
    [super dealloc];
}

@end
