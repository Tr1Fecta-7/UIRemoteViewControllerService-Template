#import "../ServiceHeaders.h"

@interface @@CLASSPREFIX@@RootViewController : UIViewController

+ (BOOL)_shouldUseXPCObjects;
- (void)viewDidLoad;
- (void)sendTestLog:(NSString *)textToLog;

+ (NSXPCInterface *)_exportedInterface;
+ (NSXPCInterface *)_remoteViewControllerInterface;
@end
