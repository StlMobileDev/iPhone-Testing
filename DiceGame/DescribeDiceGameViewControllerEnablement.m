#import <UISpec/UISpec.h>
#import <UISpec/UIQuery.h>

@interface DescribeDiceGameViewControllerEnablement : NSObject<UISpec>
{
	UIQuery *app;
}

@end



@implementation DescribeDiceGameViewControllerEnablement

- (void) before {	
	app = [UIQuery withApplication];
	
	[[app.button.with currentTitle:@"Reset"] touch];	
}

- (void) itsResetButtonIsAlwaysEnabled {
	[[expectThat([app.button.with currentTitle:@"Reset"]) should].be enabled];
	
	[[app.button.with currentTitle:@"Roll 1"] touch];
	
	[[expectThat([app.button.with currentTitle:@"Reset"]) should].be enabled];
	
	[[app.button.with currentTitle:@"Roll 2"] touch];
	
	[[expectThat([app.button.with currentTitle:@"Reset"]) should].be enabled];	
}

- (void) itsTopRollButtonIsDisabledAfterFirstPress {
	[[app.button.with currentTitle:@"Roll 1"] touch];
	
	[[expectThat([app.button.with currentTitle:@"Roll 1"]) should].not.be enabled];
}

- (void) itsBottomRollButtonIsDisabledAfterFirstPress {
	[[app.button.with currentTitle:@"Roll 2"] touch];
	
	[[expectThat([app.button.with currentTitle:@"Roll 2"]) should].not.be enabled];
}

- (void) itsTopAndBottomRollButtonsAreEnabledAfterTheyAreBothPressedOnce {
	[[app.button.with currentTitle:@"Roll 1"] touch];
	[[app.button.with currentTitle:@"Roll 2"] touch];
	
	[[expectThat([app.button.with currentTitle:@"Roll 1"]) should].be enabled];
	[[expectThat([app.button.with currentTitle:@"Roll 2"]) should].be enabled];
}

//- (void) itShouldFail {
//    [expectThat(YES) should:be(NO)];
//}

@end
