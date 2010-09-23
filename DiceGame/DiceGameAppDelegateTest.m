#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "DiceGameAppDelegate.h"


@interface DiceGameAppDelegateTest : SenTestCase {
	DiceGameAppDelegate *diceGameAppDelegate;
}

@end

@implementation DiceGameAppDelegateTest

- (void) setUp {
	diceGameAppDelegate = (DiceGameAppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void) testDiceGameAppDelegate {
    STAssertNotNil(diceGameAppDelegate, @"");
}


@end
