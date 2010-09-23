#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "Round.h"

@interface RoundTest : SenTestCase {
	Round *round;
}

@end

@implementation RoundTest

- (void) setUp {
	round = [[[Round alloc] init] autorelease];
	
}

- (void) testAllValuesAreInitiallyQuestionMarks {
    STAssertEqualObjects(@"?", round.topRoll, @"");
	STAssertEqualObjects(@"?", round.bottomRoll, @"");
	STAssertEqualObjects(@"?", round.total, @"");
	STAssertEqualObjects(@"?", round.result, @"");
}


@end
