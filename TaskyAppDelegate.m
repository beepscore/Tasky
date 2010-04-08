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
@synthesize inText;
@synthesize outText;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (IBAction) handleListButton:(id)sender {
    
    NSData *data;
    NSPipe *inPipe, *outPipe;
    NSFileHandle *writingHandle;
    NSTask *task;
    NSString *aString;
    
    task = [[NSTask alloc] init];
    inPipe = [[NSPipe alloc] init];
    outPipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/usr/bin/sort"];
    [task setStandardInput:inPipe];
    [task setStandardOutput:outPipe];
    [task setArguments:[NSArray arrayWithObject:@"-f"]];
    
    [task launch];
    
    writingHandle = [inPipe fileHandleForWriting];
    [writingHandle writeData:[[inText string] dataUsingEncoding:NSUTF8StringEncoding]];
    [writingHandle closeFile];
    
    data = [[outPipe fileHandleForReading] readDataToEndOfFile];
    aString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    [outText setString:aString];
    [aString release];
    [task release];
    [inPipe release];
    [outPipe release];
}


- (void)dealloc {
    [inText release], inText = nil;
    [outText release], outText = nil;
    
    [super dealloc];
}


@end
