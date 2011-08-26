
#import "DiceGameAppDelegate.h"
#import "DiceGameViewController.h"

@implementation DiceGameAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)dealloc {
    self.viewController = nil;
    self.window = nil;
    [super dealloc];
}


@end
