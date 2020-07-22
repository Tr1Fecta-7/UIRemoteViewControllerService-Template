#import "@@CLASSPREFIX@@RootViewController.h"

@implementation @@CLASSPREFIX@@RootViewController

+ (BOOL)_shouldUseXPCObjects { 
	return NO; 
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// Set your view(controller) up here
	self.view.backgroundColor = UIColor.redColor;
}

- (void)sendTestLog:(NSString *)textToLog {
	NSLog(@"[@@APPPROJECTNAME@@]: %@", textToLog);
}

+ (NSXPCInterface *)_exportedInterface {
	return [NSXPCInterface interfaceWithProtocol:@protocol(@@CLASSPREFIX@@RootViewControllerRemoteService)];
}

+ (NSXPCInterface *)_remoteViewControllerInterface {
	return [NSXPCInterface interfaceWithProtocol:@protocol(@@CLASSPREFIX@@RootViewControllerRemoteHost)];
}

@end
