
#import <UIKit/UIKit.h>

@class Die;
@class Game;
@class Round;

@interface DiceGameViewController : UIViewController {

}

@property (nonatomic, retain) IBOutlet UIButton *topRollButton;
@property (nonatomic, retain) IBOutlet UIButton *bottomRollButton;

@property (nonatomic, retain) IBOutlet UITextField *topRollTextField;
@property (nonatomic, retain) IBOutlet UITextField *bottomRollTextField;
@property (nonatomic, retain) IBOutlet UITextField *roundTotalTextField;
@property (nonatomic, retain) IBOutlet UITextField *roundResultTextField;
@property (nonatomic, retain) IBOutlet UITextField *roundsPlayedTextField;
@property (nonatomic, retain) IBOutlet UITextField *roundsWonTextField;
@property (nonatomic, retain) IBOutlet UITextField *winPercentageTextField;

// for testing only
@property (nonatomic, retain) Die *die;
@property (nonatomic, retain) Game *game;
@property (nonatomic, retain) Round *round;

- (IBAction) topRollButtonPressed;
- (IBAction) bottomRollButtonPressed;
- (IBAction) resetButtonPressed;

@end

