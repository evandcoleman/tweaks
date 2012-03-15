#import <SpringBoard/SpringBoard.h>

%hook SpringBoard

- (BOOL)canShowLockScreenCameraButton {
	return NO;
}

- (BOOL)canShowLockScreenCameraKnob {
	return NO;
}

%end