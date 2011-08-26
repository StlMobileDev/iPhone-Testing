#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "DiceGameAppDelegate.h"
#import "DiceGameViewController.h"

@interface DiceGameViewControllerTest : SenTestCase {
	DiceGameAppDelegate *diceGameAppDelegate;
	DiceGameViewController *diceGameViewController;
}

@end

@implementation DiceGameViewControllerTest

- (void) setUp {	
	diceGameAppDelegate = [[UIApplication sharedApplication] delegate];
	diceGameViewController = diceGameAppDelegate.viewController;
	[diceGameViewController resetButtonPressed];
}

- (void) testTopRollButtonIsDisabledAfterFirstPress {
	[diceGameViewController topRollButtonPressed];
	
	STAssertFalse(diceGameViewController.topRollButton.enabled, @"");
}

- (void) testBottomRollButtonIsDisabledAfterFirstPress {
	[diceGameViewController bottomRollButtonPressed];
	
	STAssertFalse(diceGameViewController.bottomRollButton.enabled, @"");
}

- (void) testTopAndBottomRollButtonsAreEnabledAfterTheyAreBothPressedOnce {
	[diceGameViewController topRollButtonPressed];
	[diceGameViewController bottomRollButtonPressed];
	
	STAssertTrue(diceGameViewController.topRollButton.enabled, @"");
	STAssertTrue(diceGameViewController.bottomRollButton.enabled, @"");
}

/*
- (void) testFail {
    STFail(@"This will show a failure");
}
 */

@end
