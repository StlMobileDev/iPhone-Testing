#import <Foundation/Foundation.h>
#import "GTMSenTestCase.h"
#import "DiceGameAppDelegate.h"
#import "DiceGameViewController.h"

@interface DiceGameViewControllerGTMTest : GTMTestCase {
	DiceGameAppDelegate *diceGameAppDelegate;
	DiceGameViewController *diceGameViewController;
}

@end


@implementation DiceGameViewControllerGTMTest

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

@end
