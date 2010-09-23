//
//  Round.m
//  DiceGame
//
//  Created by Heath Borders on 9/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Round.h"

@implementation Round

@synthesize topRoll = _topRoll;
@synthesize bottomRoll = _bottomRoll;
@synthesize total = _total;
@synthesize result = _result;

- (id) init {
	if (self = [super init]) {
		[self reset];
	}
	
	return self;
}

- (void) dealloc {
	self.topRoll = nil;
	self.bottomRoll = nil;
	self.total = nil;
	self.result = nil;
	
	[super dealloc];
}

- (void) setTopRoll: (NSString *) topRoll {
	if (_topRoll != topRoll) {
		[_topRoll release];
		_topRoll = topRoll;
		[_topRoll retain];
		
		if ([self.bottomRoll isEqualToString:@"?"]) {
			self.total = @"?";
		} else {
			int rawTotal = [_topRoll intValue] + [self.bottomRoll intValue];
			self.total = [[NSNumber numberWithInt:rawTotal] stringValue];
		}
	}
}

- (void) setBottomRoll: (NSString *) bottomRoll {
	if (_bottomRoll != bottomRoll) {
		[_bottomRoll release];
		_bottomRoll = bottomRoll;
		[_bottomRoll retain];
		
		if ([self.topRoll isEqualToString:@"?"]) {
			self.total = @"?";
		} else {
			int rawTotal = [self.topRoll intValue] + [_bottomRoll intValue];
			self.total = [[NSNumber numberWithInt:rawTotal] stringValue];
		}
	}
}

- (void) setTotal:(NSString *) total {
	if (_total != total) {
		[_total release];
		_total = total;
		[_total retain];
		
		if ([_total isEqualToString:@"?"]) {
			self.result = @"?";
		} else if ([_total isEqualToString:@"7"]) {
			self.result = @"WIN";
		} else {
			self.result = @"FAIL";
		}
	}
}

- (void) reset {
	self.topRoll = @"?";
	self.bottomRoll = @"?";
	self.total = @"?";
}

@end
