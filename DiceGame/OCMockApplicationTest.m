#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import <OCMock/OCMock.h>
#import "Die.h"


@interface OCMockApplicationTest : SenTestCase {
	
}

@end

@implementation OCMockApplicationTest

- (void) testThatOCMockWorksAsALogicTest {
	id mockDie = [OCMockObject mockForClass:[Die class]];
	
	[[[mockDie expect] andReturn:[NSNumber numberWithInt:5]] value];
    
	STAssertEqualObjects([mockDie value], [NSNumber numberWithInt:5], @"");
	
	[mockDie verify];
}

@end
