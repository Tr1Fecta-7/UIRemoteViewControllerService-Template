#import "Tweak.h"

%subclass @@CLASSPREFIX@@RemoteRootViewController : _UIRemoteViewController

+ (BOOL)_shouldUseXPCObjects { 
	return NO; 
}

%new
+ (NSInvocation *)requestViewControllerWithConnectionHandler:(void(^)(@@CLASSPREFIX@@RemoteRootViewController *, NSError *))block {
	return [self requestViewController:@"@@CLASSPREFIX@@RootViewController" fromServiceWithBundleIdentifier:@"@@APPPACKAGENAME@@" 
			connectionHandler:(void(^)(id,id))block];
}

+ (NSXPCInterface *)exportedInterface {
	return [NSXPCInterface interfaceWithProtocol:@protocol(@@CLASSPREFIX@@RootViewControllerRemoteHost)];
}

+ (NSXPCInterface *)serviceViewControllerInterface {
	return [NSXPCInterface interfaceWithProtocol:@protocol(@@CLASSPREFIX@@RootViewControllerRemoteService)];
}

%end


// Example Hook
%hook SpringBoard

%property (nonatomic, strong) UIWindow *window;
%property (nonatomic, strong) UIViewController *remoteViewController;
%property (nonatomic, strong) UIView *remoteView;

- (void)applicationDidFinishLaunching:(id)application {
	%orig;

	[%c(@@CLASSPREFIX@@RemoteRootViewController) requestViewControllerWithConnectionHandler:^(@@CLASSPREFIX@@RemoteRootViewController *remoteVC, NSError *err) {
		void(^blockForMain)(void) = ^{
			self.remoteViewController = remoteVC;

			// The window being used here is as example. You don't need to use a window at all to use the Remote View Controller.
			self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
			self.window.windowLevel = CGFLOAT_MAX/2.0;

			if (remoteVC) {
				// If you just want the view, then store it in a property (or global (not recommended))
				self.remoteView = remoteVC.view;

				// If you want to call a method that you have exposed on the service using the proxy, you can:
				[remoteVC.serviceViewControllerProxy performSelector:@selector(sendTestLog:) withObject:@"Hello! This is a test message sent by your service view controller proxy!"];

				// Make the window with your content visible  
				self.window.rootViewController = remoteVC;
				[self.window makeKeyAndVisible];
			}
			else {
				self.window.rootViewController = [UIViewController new];
				[self.window makeKeyAndVisible];

				UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:err.description preferredStyle:UIAlertControllerStyleAlert];
				[self.window.rootViewController presentViewController:alert animated:YES completion:nil];
			}
		};

		blockForMain();
	}];
}

%end



