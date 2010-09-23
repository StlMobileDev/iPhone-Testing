//
//  Round.h
//  DiceGame
//
//  Created by Heath Borders on 9/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Round : NSObject {

}

@property (nonatomic, retain) NSString *topRoll;
@property (nonatomic, retain) NSString *bottomRoll;
@property (nonatomic, retain) NSString *total;
@property (nonatomic, retain) NSString *result;

- (void) reset;

@end
