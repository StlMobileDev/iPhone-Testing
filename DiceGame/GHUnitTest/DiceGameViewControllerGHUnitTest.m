#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "DiceGameAppDelegate.h"
#import "DiceGameViewController.h"

@interface DiceGameViewControllerGHUnitTest : GHTestCase {
	DiceGameViewController *diceGameViewController;
}

@end


@implementation DiceGameViewControllerGHUnitTest

- (void) setUp {	
	diceGameViewController = [[[DiceGameViewController alloc] initWithNibName:nil
                                                                       bundle:nil] autorelease];
    [diceGameViewController view]; //force the view to load
	[diceGameViewController resetButtonPressed];
}

- (void) testTopRollButtonIsDisabledAfterFirstPress {
	[diceGameViewController topRollButtonPressed];
	
	GHAssertFalse(diceGameViewController.topRollButton.enabled, @"");
}

- (void) testBottomRollButtonIsDisabledAfterFirstPress {
	[diceGameViewController bottomRollButtonPressed];
	
	GHAssertFalse(diceGameViewController.bottomRollButton.enabled, @"");
}

- (void) testTopAndBottomRollButtonsAreEnabledAfterTheyAreBothPressedOnce {
	[diceGameViewController topRollButtonPressed];
	[diceGameViewController bottomRollButtonPressed];
	
	GHAssertTrue(diceGameViewController.topRollButton.enabled, @"");
	GHAssertTrue(diceGameViewController.bottomRollButton.enabled, @"");
}

@end
