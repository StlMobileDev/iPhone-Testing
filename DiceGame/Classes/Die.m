
#import "Die.h"


@implementation Die

- (NSNumber *) value {
	int randomInt = (int) random();
	int rawValue = (randomInt % 6) + 1;
	return [NSNumber numberWithInt:rawValue];
}

@end
