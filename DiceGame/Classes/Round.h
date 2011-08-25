
#import <Foundation/Foundation.h>


@interface Round : NSObject {

}

@property (nonatomic, retain) NSString *topRoll;
@property (nonatomic, retain) NSString *bottomRoll;
@property (nonatomic, retain) NSString *total;
@property (nonatomic, retain) NSString *result;

- (void) reset;

@end
