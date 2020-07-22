#import <UIKit/UIKit.h>

@interface _UIRemoteViewController : UIViewController
+ (NSInvocation *)requestViewController:(NSString *)className
	fromServiceWithBundleIdentifier:(NSString *)bundleIdentifier
	connectionHandler:(void(^)(_UIRemoteViewController *, NSError *))callback;
- (NSProxy *)serviceViewControllerProxy;
@end

@interface NSXPCInterface : NSObject
+ (instancetype)interfaceWithProtocol:(Protocol *)protocol;
@end

// Client
@protocol @@CLASSPREFIX@@RootViewControllerRemoteHost
@end

// Service
@protocol @@CLASSPREFIX@@RootViewControllerRemoteService
// List the methods here, that you want to be able to call through the client
// The return type can be either void or NSProgress *, any other type will cause an exception to be raised

// Test Method
- (void)sendTestLog:(NSString *)textToLog;
@end