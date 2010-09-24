#import <Foundation/Foundation.h>
#import <UISpec/UISpec.h>
#import <UISpec/UIQuery.h>
#import <OCMock/OCMock.h>
#import "DiceGameAppDelegate.h"
#import "DiceGameViewController.h"
#import "Die.h"

@interface DescribeDiceGameViewControllerTextFields : NSObject<UISpec> {
	UIQuery *app;
	id mockDie;
	DiceGameViewController *diceGameViewController;
}

@end

@implementation DescribeDiceGameViewControllerTextFields

- (void) before {
	app = [UIQuery withApplication];
	
	[[app.button.with currentTitle:@"Reset"] touch];
	
	mockDie = [OCMockObject mockForClass:[Die class]];
	
	DiceGameAppDelegate *diceGameAppDelegate = [[UIApplication sharedApplication] delegate];
	diceGameViewController = diceGameAppDelegate.viewController;
	diceGameViewController.die = mockDie;
}

- (void) after {
	diceGameViewController.die = [[[Die alloc] init] autorelease];
}

- (void) itPutsTheTopRollValueIntoTheTopRollTextField {
	[[[mockDie expect] andReturn:[NSNumber numberWithInt:5]] value];
	
	[[app.button.with currentTitle:@"Roll 1"] touch];
	
	[[expectThat([app.textField tag:1]) should].have text:@"5"];
}

@end
