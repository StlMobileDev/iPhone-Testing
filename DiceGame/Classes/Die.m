//
//  Die.m
//  DiceGame
//
//  Created by Heath Borders on 9/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Die.h"


@implementation Die

- (NSNumber *) value {
	int randomInt = (int) random();
	int rawValue = (randomInt % 6) + 1;
	return [NSNumber numberWithInt:rawValue];
}

@end
