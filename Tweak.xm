#import <UIKit/UIKit.h>

void writeLog(NSString *logMessage) {
    NSString *logFilePath = @"/var/mobile/HelloWorld.log";
    
    // Create the log message
    NSString *logEntry = [NSString stringWithFormat:@"%@\n", logMessage];
    
    // Check if the file exists
    if (![[NSFileManager defaultManager] fileExistsAtPath:logFilePath]) {
        // Create the file if it does not exist
        [[NSFileManager defaultManager] createFileAtPath:logFilePath contents:nil attributes:nil];
    }
    
    // Write the log message to the file
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:logFilePath];
    if (fileHandle) {
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[logEntry dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle closeFile];
    } else {
        NSLog(@"Failed to open file for writing: %@", logFilePath);
    }
}

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    writeLog(@"Hello World from iOS - Application did finish launching");
}

%end

