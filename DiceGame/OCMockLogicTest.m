#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import <OCMock/OCMock.h>
#import "Die.h"

@interface OCMockLogicTest : SenTestCase {
	
}

@end

@implementation OCMockLogicTest

- (void) testThatOCMockWorksAsALogicTest {
	id mockDie = [OCMockObject mockForClass:[Die class]];
	Die *die = [[[Die alloc] init] autorelease];
	
	[[[mockDie expect] andReturn:[NSNumber numberWithInt:5]] value];

	[mockDie value];
	
	[mockDie verify];
}

@end
