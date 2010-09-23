//
//  Game.h
//  DiceGame
//
//  Created by Heath Borders on 9/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Game : NSObject {

}

@property (nonatomic) NSUInteger roundsPlayed;
@property (nonatomic) NSUInteger roundsWon;
@property (nonatomic, readonly) NSString *roundWinPercentage;

- (void) reset;

@end
