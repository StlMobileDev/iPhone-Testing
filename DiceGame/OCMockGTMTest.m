#import "GTMSenTestCase.h"
#import <OCMock/OCMock.h>
#import "Die.h"

@interface OCMockGTMTest : GTMTestCase {
	
}

@end

@implementation OCMockGTMTest

- (void) testOCMockWorksWithGTM {
	id mockDie = [OCMockObject mockForClass:[Die class]];
	
	[[mockDie expect] value];
	
	[mockDie value];
	
	[mockDie verify];
}

@end
