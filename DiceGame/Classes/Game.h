#import <Foundation/Foundation.h>

@interface Game : NSObject {

}

@property (nonatomic, readonly) NSString *roundsPlayed;
@property (nonatomic, readonly) NSString *roundsWon;
@property (nonatomic, readonly) NSString *roundWinPercentage;

- (void) won;
- (void) lost;
- (void) reset;

@end
