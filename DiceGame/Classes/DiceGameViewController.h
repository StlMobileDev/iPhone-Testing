//
//  DiceGameViewController.h
//  DiceGame
//
//  Created by Heath Borders on 9/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Die.h"

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

- (IBAction) topRollButtonPressed;
- (IBAction) bottomRollButtonPressed;
- (IBAction) resetButtonPressed;

@end

