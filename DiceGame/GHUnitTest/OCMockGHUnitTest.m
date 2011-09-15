#import <GHUnitIOS/GHUnit.h>
#import "DiceGameViewController.h"
#import <OCMock/OCMock.h>
#import "Game.h"
#import "Round.h"

@interface OCMockGHUnitTest : GHTestCase {    
    id mockGame;
    id mockRound;
    
	DiceGameViewController *testObject;
}

@end

@implementation OCMockGHUnitTest

- (void) setUp {
    mockGame = [OCMockObject niceMockForClass:[Game class]];
    mockRound = [OCMockObject niceMockForClass:[Round class]];
    
	testObject = [[[DiceGameViewController alloc] init] autorelease];
    [testObject view]; //trigger viewDidLoad
    testObject.game = mockGame;
    testObject.round = mockRound;
}

// fails because mockGame is not a niceMock
//- (void) testResetButtonPressedResetsRound {
//    testObject.game = [OCMockObject mockForClass:[Game class]];
//    
//    [[mockRound expect] reset];
//    
//    [testObject resetButtonPressed];
//    
//    [mockRound verify];
//}

// doesn't fail because mockRound is a niceMock
- (void) testResetButtonPressedResetsGame {
    [[mockGame expect] reset];
    
    [testObject resetButtonPressed];
    
    [mockGame verify];
}

- (void) testCustomizedMockBehavior {
    [[[mockGame expect] andDo:^(NSInvocation *notification) {
        NSLog(@"This is custom behavior!");
    }] reset];
    
    [testObject resetButtonPressed];
    
    [mockGame verify];
}

- (void) testResetButtonPressedUpdatesTopRollTextFieldWithRoundTopRoll {
    id mockTopTextField = [OCMockObject niceMockForClass:[UITextField class]];
    testObject.topRollTextField = mockTopTextField;
    
    [[[mockRound expect] andReturn:@"foo!"] topRoll];
    [[mockTopTextField expect] setText:@"foo!"];
    
    [testObject resetButtonPressed];
    
    [mockTopTextField verify];
}

@end
