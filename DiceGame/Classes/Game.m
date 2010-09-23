//
//  Game.m
//  DiceGame
//
//  Created by Heath Borders on 9/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@interface Game()

@property (nonatomic) NSUInteger roundsPlayedCount;
@property (nonatomic) NSUInteger roundsWonCount;

@end


@implementation Game

@synthesize roundsPlayedCount = _roundsPlayedCount;
@synthesize roundsWonCount = _roundsWonCount;

- (NSString *) roundsPlayed {
	return [[NSNumber numberWithUnsignedInteger:self.roundsPlayedCount] stringValue];
}

- (NSString *) roundsWon {
	return [[NSNumber numberWithUnsignedInteger:self.roundsWonCount] stringValue];
}

- (NSString *) roundWinPercentage {
	if (self.roundsPlayedCount == 0) {
		return @"?";
	} else {
		NSUInteger rawRoundWinPercentage = (self.roundsWonCount * ((NSUInteger) 100)) / self.roundsPlayedCount;
		return [[NSNumber numberWithUnsignedInteger:rawRoundWinPercentage] stringValue];
	}
}

- (void) reset {
	self.roundsPlayedCount = 0;
	self.roundsWonCount = 0;
}

- (void) won {
	self.roundsWonCount++;
	self.roundsPlayedCount++;
}

- (void) lost {
	self.roundsPlayedCount++;
}

@end
