#import <GHUnitIOS/GHUnit.h>
#import "Game.h"

@interface GameGHUnitTest : GHTestCase {
	Game *testObject;
}

@end

@implementation GameGHUnitTest

- (void) setUp {
	testObject = [[[Game alloc] init] autorelease];
}

- (void) testRoundsWonInitiallyZero {
	GHAssertEqualObjects(testObject.roundsWon, @"0", @"");
}

- (void) testRoundsPlayedInitiallyZero {
	GHAssertEqualObjects(testObject.roundsPlayed, @"0", @"");
}

- (void) testRoundWinPercentageInitiallyUnknown {
	GHAssertEqualObjects(testObject.roundWinPercentage, @"?", @"");
}

- (void) testResetChangesRoundsWonToZero {
	[testObject won];
	[testObject reset];
	
	GHAssertEqualObjects(testObject.roundsWon, @"0", @"");
}

- (void) testResetChangesRoundsPlayedToZero {
	[testObject won];
	[testObject reset];
	
	GHAssertEqualObjects(testObject.roundsPlayed, @"0", @"");
}

- (void) testResetChangesRoundWinPercentageToUnknown {
	[testObject won];
	[testObject reset];
	
	GHAssertEqualObjects(testObject.roundWinPercentage, @"?", @"");
}

- (void) testOneWinIs100PercentWins {
	[testObject won];
	
	GHAssertEqualObjects(testObject.roundWinPercentage, @"100", @"");
}

- (void) testOneLossIsZeroPercentWins {
	[testObject lost];
	
	GHAssertEqualObjects(testObject.roundWinPercentage, @"0", @"");
}

- (void) testOneWinAndTwoLossesIs33PercentWins {
	[testObject won];
	[testObject lost];
	[testObject lost];
	
	GHAssertEqualObjects(testObject.roundWinPercentage, @"33", @"");
}

//- (void) testFailure {
//    GHFail(@"This will show a failure");
//}

@end
