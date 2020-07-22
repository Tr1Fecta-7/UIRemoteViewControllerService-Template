#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ServiceHeaders.h"

@interface @@CLASSPREFIX@@RemoteRootViewController : _UIRemoteViewController
+ (NSInvocation *)requestViewControllerWithConnectionHandler:(void(^)(@@CLASSPREFIX@@RemoteRootViewController *, NSError *))block;
@end

@interface SpringBoard : UIApplication
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIViewController *remoteViewController;
@property (nonatomic, strong) UIView *remoteView;
@end