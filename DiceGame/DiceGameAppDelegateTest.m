#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "DiceGameAppDelegate.h"
#import "DiceGameViewController.h"


@interface DiceGameAppDelegateTest : SenTestCase {
	DiceGameAppDelegate *diceGameAppDelegate;
}

@end

@implementation DiceGameAppDelegateTest

- (void) setUp {
	diceGameAppDelegate = [[UIApplication sharedApplication] delegate];
}

- (void) testDiceGameAppDelegate {
    STAssertNotNil(diceGameAppDelegate, @"");
}

@end
