#import "GTMSenTestCase.h"
#import "Game.h"

@interface GameGTMTest : GTMTestCase {
	Game *testObject;
}

@end

@implementation GameGTMTest

- (void) setUp {
	testObject = [[[Game alloc] init] autorelease];
}

- (void) testRoundsWonInitiallyZero {
	STAssertEqualObjects(testObject.roundsWon, @"0", @"");
}

- (void) testRoundsPlayedInitiallyZero {
	STAssertEqualObjects(testObject.roundsPlayed, @"0", @"");
}

- (void) testRoundWinPercentageInitiallyUnknown {
	STAssertEqualObjects(testObject.roundWinPercentage, @"?", @"");
}

- (void) testResetChangesRoundsWonToZero {
	[testObject won];
	[testObject reset];
	
	STAssertEqualObjects(testObject.roundsWon, @"0", @"");
}

- (void) testResetChangesRoundsPlayedToZero {
	[testObject won];
	[testObject reset];
	
	STAssertEqualObjects(testObject.roundsPlayed, @"0", @"");
}

- (void) testResetChangesRoundWinPercentageToUnknown {
	[testObject won];
	[testObject reset];
	
	STAssertEqualObjects(testObject.roundWinPercentage, @"?", @"");
}

- (void) testOneWinIs100PercentWins {
	[testObject won];
	
	STAssertEqualObjects(testObject.roundWinPercentage, @"100", @"");
}

- (void) testOneLossIsZeroPercentWins {
	[testObject lost];
	
	STAssertEqualObjects(testObject.roundWinPercentage, @"0", @"");
}

- (void) testOneWinAndTwoLossesIs33PercentWins {
	[testObject won];
	[testObject lost];
	[testObject lost];
	
	STAssertEqualObjects(testObject.roundWinPercentage, @"33", @"");
}

@end
