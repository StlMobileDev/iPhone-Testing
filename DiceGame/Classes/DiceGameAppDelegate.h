//
//  DiceGameAppDelegate.h
//  DiceGame
//
//  Created by Heath Borders on 9/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiceGameViewController;

@interface DiceGameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DiceGameViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DiceGameViewController *viewController;

@end

