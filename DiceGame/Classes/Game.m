//
//  Game.m
//  DiceGame
//
//  Created by Heath Borders on 9/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Game.h"


@implementation Game

@synthesize roundsPlayed = _roundsPlayed;
@synthesize roundsWon = _roundsWon;

- (NSString *) roundWinPercentage {
	if (self.roundsPlayed == 0) {
		return @"?";
	} else {
		NSUInteger rawRoundWinPercentage = (self.roundsWon * ((NSUInteger) 100)) / self.roundsPlayed;
		return [[NSNumber numberWithUnsignedInteger:rawRoundWinPercentage] stringValue];
	}
}

- (void) reset {
	self.roundsPlayed = 0;
	self.roundsWon = 0;
}

@end
