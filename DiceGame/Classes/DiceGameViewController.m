//
//  DiceGameViewController.m
//  DiceGame
//
//  Created by Heath Borders on 9/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DiceGameViewController.h"
#import "Die.h"
#import "Round.h"
#import "Game.h"

@interface UIButton(DiceGameViewController)

- (void) setEnabledAndBackgroundWithEnabled: (BOOL) enabled;

@end

@implementation UIButton(DiceGameViewController)

- (void) setEnabledAndBackgroundWithEnabled: (BOOL) enabled {
	self.enabled = enabled;
	if (self.enabled) {
		self.backgroundColor = [UIColor whiteColor];
	} else {
		self.backgroundColor = [UIColor redColor];
	}
}

@end



@interface DiceGameViewController()

@property (nonatomic, retain) Game *game;
@property (nonatomic, retain) Round *round;
@property (nonatomic, retain) Die *die;

- (void) finishRoundIfNecessary;
- (void) updateUi;

@end


@implementation DiceGameViewController

@synthesize topRollButton = _topRollButton;
@synthesize bottomRollButton = _bottomRollButton;

@synthesize topRollTextField = _topRollTextField;
@synthesize bottomRollTextField = _bottomRollTextField;
@synthesize roundTotalTextField = _roundTotalTextField;
@synthesize roundResultTextField = _roundResultTextField;
@synthesize roundsPlayedTextField = _roundsPlayedTextField;
@synthesize roundsWonTextField = _roundsWonTextField;
@synthesize winPercentageTextField = _winPercentageTextField;

@synthesize game = _game;
@synthesize round = _round;
@synthesize die = _die;

#pragma mark -
#pragma mark NSObject

- (void)dealloc {
	self.topRollButton = nil;
	self.bottomRollButton = nil;
	
	self.topRollTextField = nil;
	self.bottomRollTextField = nil;
	self.roundTotalTextField = nil;
	self.roundResultTextField = nil;
	self.roundsPlayedTextField = nil;
	self.roundsWonTextField = nil;
	self.winPercentageTextField = nil;
	
	self.game = nil;
	self.round = nil;
	self.die = nil;
	
    [super dealloc];
}

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.game = [[[Game alloc] init] autorelease];
	self.round = [[[Round alloc] init] autorelease];
	self.die = [[[Die alloc] init] autorelease];
	
	[self updateUi];
}

- (void)viewDidUnload {
	self.topRollButton = nil;
	self.bottomRollButton = nil;
	
	self.topRollTextField = nil;
	self.bottomRollTextField = nil;
	self.roundTotalTextField = nil;
	self.roundResultTextField = nil;
	self.roundsPlayedTextField = nil;
	self.roundsWonTextField = nil;
	self.winPercentageTextField = nil;
	
	self.game = nil;
	self.round = nil;
	self.die = nil;
	
	[super viewDidUnload];
}

#pragma mark -
#pragma mark IBActions

- (IBAction) topRollButtonPressed {
	[self finishRoundIfNecessary];
	
	self.round.topRoll = [self.die.value stringValue];
	
	[self updateUi];
}

- (IBAction) bottomRollButtonPressed {
	[self finishRoundIfNecessary];
	
	self.round.bottomRoll = [self.die.value stringValue];
	
	[self updateUi];
}

- (IBAction) resetButtonPressed {
	[self.round reset];
	[self.game reset];
	
	[self updateUi];
}

#pragma mark -
#pragma mark private API

- (void) finishRoundIfNecessary {
	if (![self.round.result isEqualToString:@"?"]) {
		if ([self.round.result isEqualToString:@"WIN"]) {
			[self.game won];
		} else if ([self.round.result isEqualToString:@"FAIL"]) {
			[self.game lost];
		}
		
		[self.round reset];
	}
}

- (void) updateUi {	
	BOOL topRollButtonEnabled = NO;
	BOOL bottomRollButtonEnabled = NO;
	if ([self.round.result isEqualToString:@"?"]) {
		topRollButtonEnabled = [self.round.topRoll isEqualToString:@"?"];
		bottomRollButtonEnabled = [self.round.bottomRoll isEqualToString:@"?"];
	} else {
		topRollButtonEnabled = YES;
		bottomRollButtonEnabled = YES;
	}
	
	[self.topRollButton setEnabledAndBackgroundWithEnabled:topRollButtonEnabled];
	[self.bottomRollButton setEnabledAndBackgroundWithEnabled:bottomRollButtonEnabled];
	
	self.topRollTextField.text = self.round.topRoll;
	self.bottomRollTextField.text = self.round.bottomRoll;
	self.roundTotalTextField.text = self.round.total;
	self.roundResultTextField.text = self.round.result;
	self.roundsPlayedTextField.text = self.game.roundsPlayed;
	self.roundsWonTextField.text = self.game.roundsWon;
	self.winPercentageTextField.text = self.game.roundWinPercentage;
}

@end
