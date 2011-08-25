
#import <UIKit/UIKit.h>

@class DiceGameViewController;

@interface DiceGameAppDelegate : NSObject <UIApplicationDelegate> {
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DiceGameViewController *viewController;

@end

